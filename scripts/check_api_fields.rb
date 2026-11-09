# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "json"
require "net/http"
require "pathname"
require "prism"
require "stringio"
require "uri"

require_relative "../lib/x_twitter_scraper"

module ApiFieldsCheck
  ROOT = File.expand_path("..", __dir__)
  RESOURCES = File.join("lib", "x_twitter_scraper", "resources")
  DEFAULT_SPEC = "https://xquik.com/openapi.json"
  SPEC_VARIABLE = "XQUIK_OPENAPI_SPEC"
  ACCEPTED_FILE = "accepted-field-differences.json"
  ACCEPTED_CEILING = 0
  HTTP_METHODS = %w[get put post delete options head patch trace].freeze
  BODY_TYPES = %w[application/json multipart/form-data application/x-www-form-urlencoded].freeze
  RESPONSE_TYPES = %w[application/json].freeze
  PLACEHOLDER = %r{\{[^{}/]*\}}
  FORMAT_PLACEHOLDER = /%\d+\$s/
  KINDS = %w[missing extra enum required nullable].freeze
  METHOD_NAMES = HTTP_METHODS.map(&:upcase).join("|").freeze
  KIND_NAMES = KINDS.join("|").freeze
  DIFFERENCE = %r{\A(?:#{METHOD_NAMES}) /\S* (?:request|response) (?:#{KIND_NAMES}) \S+\z}
  DIFFERENCE_EXAMPLE = "Write a method, a path, request or response, a kind and a field, such as " \
                       "GET /api/v1/monitors/{id} response extra pausedAt."
  REQUEST_KEYS = [:method, :path, :query, :body, :headers, :model, :options, :security].freeze
  UNTYPED_RESPONSES = [NilClass, StringIO].freeze
  SCALARS = [String, Symbol, Integer, Float, Time, Date, TrueClass, FalseClass].freeze
  INTERNAL_TYPES = XTwitterScraper::Internal::Type

  UNREADABLE_REQUEST_NEXT = "Fix that line. Write each request path as a string or a format array, " \
                            "and pass model."
  UNREADABLE_TYPE_NEXT = "Name the params and response types the SDK defines, " \
                         "or teach scripts/check_api_fields.rb the new type."
  FIX_NEXT = "Fix each field above in the SDK, or list it in #{ACCEPTED_FILE} with a reason.".freeze
  REMOVE_NEXT = "Remove each difference above from #{ACCEPTED_FILE}.".freeze
  GROWN_NEXT = "Fix each new difference in the SDK instead of accepting it. " \
               "ACCEPTED_CEILING in scripts/check_api_fields.rb only falls."

  class Failure < StandardError
    attr_reader :lines

    def initialize(*lines)
      super(lines.join("\n"))
      @lines = lines
    end
  end

  class UnexpectedSpec < StandardError; end

  class UnreadableSdk < StandardError
    attr_reader :node, :next_step

    def initialize(node, reason, next_step)
      super(reason)
      @node = node
      @next_step = next_step
    end
  end

  Unknown = Data.define
  FreeForm = Data.define
  Leaf = Data.define(:enum)
  List = Data.define(:items)
  Prop = Data.define(:node, :required, :nullable)
  Fields = Data.define(:props, :open)
  Shape = Data.define(:query, :body, :response, :hidden)

  UNKNOWN = Unknown.new
  FREE_FORM = FreeForm.new
  ANY_LEAF = Leaf.new(enum: nil)

  module Nodes
    module_function

    def opaque?(node) = node.is_a?(Unknown) || node.is_a?(FreeForm)

    def merge(nodes)
      return FREE_FORM if nodes.any?(FreeForm)

      objects = nodes.grep(Fields)
      return merge_objects(objects) unless objects.empty?

      lists = nodes.grep(List)
      return List.new(items: merge(lists.map(&:items))) unless lists.empty?

      leaves = nodes.grep(Leaf)
      return UNKNOWN if leaves.empty?

      enums = leaves.map(&:enum)
      Leaf.new(enum: enums.include?(nil) ? nil : enums.reduce(:|))
    end

    def merge_objects(objects)
      props = objects.flat_map { _1.props.keys }.uniq.to_h do |name|
        have = objects.filter_map { _1.props[name] }
        required = have.length == objects.length && have.all?(&:required)
        nullables = have.map(&:nullable)
        nullable = nullables.include?(nil) ? nil : nullables.any?
        [name, Prop.new(node: merge(have.map(&:node)), required: required, nullable: nullable)]
      end
      Fields.new(props: props, open: objects.any?(&:open))
    end

    def merge_optional(first, second)
      return first || second if first.nil? || second.nil?

      merge([first, second])
    end

    def intersect(nodes)
      objects = nodes.grep(Fields)
      if objects.empty?
        lists = nodes.grep(List)
        return List.new(items: intersect(lists.map(&:items))) unless lists.empty?

        return nodes.find { !opaque?(_1) } || UNKNOWN
      end

      props = {}
      objects.each do |object|
        object.props.each do |name, prop|
          props[name] = props.key?(name) ? intersect_props(props[name], prop) : prop
        end
      end
      Fields.new(props: props, open: objects.any?(&:open))
    end

    def intersect_props(first, second)
      Prop.new(
        node: intersect([first.node, second.node]),
        required: first.required || second.required,
        nullable: first.nullable && second.nullable ? true : false
      )
    end
  end

  class SpecReader
    Operation = Data.define(:http_method, :path, :item, :spec) do
      def key = ApiFieldsCheck.operation_key(http_method, path)

      def label = "#{http_method} #{path}"
    end

    def initialize(document)
      @document = document
    end

    def shapes
      operations.to_h { [_1.key, [_1.label, shape(_1.item, _1.spec)]] }
    end

    private

    def operations
      object!(@document["paths"]).flat_map do |path, value|
        item = object!(value)
        raise UnexpectedSpec, "The path item of #{path} is a reference" if item.key?("$ref")

        HTTP_METHODS.select { item.key?(_1) }.map do |method|
          operation = object!(item[method])
          prefix = server_path(operation["servers"], item["servers"], @document["servers"])
          Operation.new(http_method: method.upcase, path: prefix + path, item: item, spec: operation)
        end
      end
    end

    def server_path(*levels)
      levels.compact.each do |servers|
        entries = list!(servers)
        next if entries.empty?

        return URI(string!(object!(entries.first)["url"])).path.chomp("/")
      end
      ""
    end

    def shape(item, operation)
      parameters = [*item.fetch("parameters", []), *operation.fetch("parameters", [])].map { parameter(_1) }
      query = parameters.select { _1["in"] == "query" }.to_h do |entry|
        prop = Prop.new(
          node: node(entry.fetch("schema", {})).first,
          required: entry["required"] == true,
          nullable: nil
        )
        [string!(entry["name"]), prop]
      end
      body = operation.key?("requestBody") ? content_node(operation["requestBody"], BODY_TYPES) : nil
      responses = object!(operation.fetch("responses", {})).filter_map do |code, response|
        content_node(response, RESPONSE_TYPES) if code.start_with?("2")
      end
      Shape.new(
        query: Fields.new(props: query, open: false),
        body: body,
        response: responses.empty? ? nil : Nodes.merge(responses),
        hidden: parameters.select do
          %w[path header].include?(_1["in"])
        end.to_set { ApiFieldsCheck.normalize(string!(_1["name"])) }
      )
    end

    def parameter(value)
      entry = object!(value)
      entry.key?("$ref") ? object!(resolve(string!(entry["$ref"]))) : entry
    end

    def content_node(value, accepted)
      container = object!(value)
      container = object!(resolve(string!(container["$ref"]))) if container.key?("$ref")
      nodes = object!(container.fetch("content", {})).filter_map do |media_type, media|
        entry = object!(media)
        next unless accepted.include?(media_type.split(";").first.strip) && entry.key?("schema")

        node(entry["schema"]).first
      end
      nodes.empty? ? nil : Nodes.merge(nodes)
    end

    def resolve(reference)
      reference.delete_prefix("#/").split("/").reduce(@document) do |value, token|
        object!(value).fetch(token.gsub("~1", "/").gsub("~0", "~"))
      end
    end

    def node(value, stack = [])
      schema = object!(value)
      return referenced(schema, stack) if schema["$ref"].is_a?(String)

      types = schema["type"]
      return [UNKNOWN, true] if types == "null"

      nullable = schema["nullable"] == true || (types.is_a?(Array) && types.include?("null"))
      return all_of(schema, nullable, stack) if schema.key?("allOf")

      variants = %w[oneOf anyOf].find { schema.key?(_1) }
      return any_of(schema, variants, nullable, stack) if variants

      plain(schema, Array(types) - ["null"], nullable, stack)
    end

    def referenced(schema, stack)
      reference = schema["$ref"]
      return [UNKNOWN, false] if stack.include?(reference)

      target, nullable = node(resolve(reference), [*stack, reference])
      types = schema["type"]
      [target, nullable || (types.is_a?(Array) && types.include?("null"))]
    end

    def all_of(schema, nullable, stack)
      parts = list!(schema["allOf"]).map { object!(_1) }
      rest = schema.except("allOf")
      nodes = parts.map { node(_1, stack).first }
      nodes << node(rest, stack).first if rest.key?("properties")
      merged = Nodes.intersect(nodes)
      required = [*parts, rest].reject { _1.key?("properties") }.flat_map { list!(_1.fetch("required", [])) }
      return [merged, nullable] unless merged.is_a?(Fields) && !required.empty?

      props = merged.props.to_h do |name, prop|
        [name, prop.with(required: prop.required || required.include?(name))]
      end
      [merged.with(props: props), nullable]
    end

    def any_of(schema, key, nullable, stack)
      variants = []
      list!(schema[key]).each do |part|
        branch = object!(part)
        if branch["type"] == "null"
          nullable = true
          next
        end
        branch_node, branch_nullable = node(branch, stack)
        nullable ||= branch_nullable
        variants << branch_node
      end
      if schema.key?("properties")
        base = node(schema.except(key), stack).first
        variants = variants.map { Nodes.intersect([base, _1]) }
      end
      [Nodes.merge(variants), nullable]
    end

    def plain(schema, types, nullable, stack)
      return [Leaf.new(enum: Set[schema["const"].to_s]), nullable] if schema.key?("const")

      if schema.key?("enum")
        values = list!(schema["enum"])
        return [Leaf.new(enum: values.compact.to_set(&:to_s)), nullable || values.include?(nil)]
      end
      return [object_node(schema, stack), nullable] if schema["properties"].is_a?(Hash)
      return [FREE_FORM, nullable] if types.include?("object")
      if types.include?("array") && schema.key?("items")
        return [
          List.new(items: node(schema["items"], stack).first),
          nullable
        ]
      end

      [ANY_LEAF, nullable]
    end

    def object_node(schema, stack)
      required = list!(schema.fetch("required", []))
      props = schema["properties"].to_h do |name, item|
        prop_node, prop_nullable = node(item, stack)
        [name, Prop.new(node: prop_node, required: required.include?(name), nullable: prop_nullable)]
      end
      Fields.new(props: props, open: ![nil, false].include?(schema["additionalProperties"]))
    end

    def object!(value)
      return value if value.is_a?(Hash)

      raise UnexpectedSpec, "Expected an object, not #{value.inspect}"
    end

    def list!(value)
      return value if value.is_a?(Array)

      raise UnexpectedSpec, "Expected a list, not #{value.inspect}"
    end

    def string!(value)
      return value if value.is_a?(String)

      raise UnexpectedSpec, "Expected a string, not #{value.inspect}"
    end
  end

  class SdkTypes
    def initialize
      @models = {}
    end

    def node(type, stack = [])
      return [UNKNOWN, true] if type == NilClass
      return [Leaf.new(enum: Set[type.to_s]), false] if literal?(type)
      return [ANY_LEAF, false] if scalar?(type)
      return [UNKNOWN, false] if type == INTERNAL_TYPES::Unknown
      return [FREE_FORM, false] if type.is_a?(INTERNAL_TYPES::HashOf)
      return [list(type, stack), false] if type.is_a?(INTERNAL_TYPES::ArrayOf)
      return [Leaf.new(enum: type.values.to_set(&:to_s)), false] if type.is_a?(INTERNAL_TYPES::Enum)
      return union(type, stack) if type.is_a?(INTERNAL_TYPES::Union)
      return [model(type, stack), false] if model?(type)

      raise ArgumentError, "uses the type #{type.inspect}, which the check cannot read"
    end

    def params(type)
      raise ArgumentError, "reads request fields from #{type.inspect}, which is no model" unless model?(type)

      model(type, []).props.except("request_options")
    end

    private

    def list(type, stack)
      List.new(items: node(type.send(:item_type), stack).first)
    end

    def literal?(type)
      [Symbol, String, Integer, Float, TrueClass, FalseClass].any? { type.instance_of?(_1) }
    end

    def scalar?(type)
      SCALARS.include?(type) || type == INTERNAL_TYPES::Boolean || type == INTERNAL_TYPES::FileInput
    end

    def model?(type)
      type.is_a?(Class) && type <= INTERNAL_TYPES::BaseModel
    end

    def union(type, stack)
      nullable = false
      nodes = type.variants.filter_map do |variant|
        variant_node, variant_nullable = node(variant, stack)
        nullable ||= variant_nullable
        variant_node unless variant == NilClass
      end
      [Nodes.merge(nodes), nullable]
    end

    def model(type, stack)
      return UNKNOWN if stack.include?(type)

      @models[type] ||= Fields.new(props: props(type, [*stack, type]), open: false)
    end

    def props(type, stack)
      type.fields.to_h do |_name, field|
        node, nullable = field_node(field, stack)
        prop = Prop.new(
          node: node,
          required: field.fetch(:required),
          nullable: nullable || field.fetch(:nilable)
        )
        [field.fetch(:api_name).to_s, prop]
      end
    end

    def field_node(field, stack)
      const = field.fetch(:const)
      return [Leaf.new(enum: Set[const.to_s]), false] unless const == XTwitterScraper::Internal::OMIT

      node(field.fetch(:type), stack)
    end
  end

  class RequestReader
    def initialize(types, base_path)
      @types = types
      @base_path = base_path
    end

    def read(call, locals)
      arguments = keywords(call)
      unknown = arguments.keys - REQUEST_KEYS
      unreadable(call, "passes #{unknown.join(' and ')}, which the check cannot read") unless unknown.empty?

      key = ApiFieldsCheck.operation_key(
        request_method(call, arguments[:method]),
        full_path(call, arguments[:path])
      )
      [key, shape(call, arguments, locals)]
    end

    private

    def shape(call, arguments, locals)
      unreadable(call, "passes no model") unless arguments.key?(:model)

      query = arguments.key?(:query) ? sent_fields(arguments[:query], locals) : {}
      Shape.new(
        query: Fields.new(props: query, open: false),
        body: arguments.key?(:body) ? body(arguments[:body], locals) : nil,
        response: response(arguments[:model]),
        hidden: Set.new
      )
    end

    def keywords(call)
      list = call.arguments&.arguments || []
      unless list.length == 1 && list.first.is_a?(Prism::KeywordHashNode)
        unreadable(call, "passes other than keyword arguments")
      end

      list.first.elements.to_h do |element|
        readable = element.is_a?(Prism::AssocNode) && element.key.is_a?(Prism::SymbolNode)
        unreadable(element, "passes #{element.slice}, which the check cannot read") unless readable
        [element.key.unescaped.to_sym, element.value]
      end
    end

    def request_method(call, node)
      unreadable(call, "passes no method symbol") unless node.is_a?(Prism::SymbolNode)

      node.unescaped.upcase
    end

    def full_path(call, node)
      template = node.is_a?(Prism::ArrayNode) ? node.elements.first : node
      unreadable(call, "passes a path the check cannot read") unless template.is_a?(Prism::StringNode)

      "#{@base_path}/#{template.unescaped.delete_prefix('/').gsub(FORMAT_PLACEHOLDER, '{}')}"
    end

    def body(node, locals)
      if node.is_a?(Prism::CallNode) && node.name == :[]
        name = argument_names(node, locals).first
        props = sent_fields(node.receiver, locals)
        unreadable(node, "reads #{name} from params that lack it") unless props.key?(name)
        return props.fetch(name).node
      end

      Fields.new(props: sent_fields(node, locals), open: false)
    end

    def sent_fields(node, locals)
      case node
      when Prism::LocalVariableReadNode then sent_fields(local(node, locals), locals)
      when Prism::CallNode then fields_from_call(node, locals)
      else unreadable(node, "builds request fields with #{node.slice}, which the check cannot read")
      end
    end

    def fields_from_call(node, locals)
      case node.name
      when :dump_request then @types.params(constant(node.receiver))
      when :encode_query_params then sent_fields(node.arguments.arguments.first, locals)
      when :except then sent_fields(node.receiver, locals).except(*argument_names(node, locals))
      when :slice then sent_fields(node.receiver, locals).slice(*argument_names(node, locals))
      when :transform_keys then sent_fields(node.receiver, locals).transform_keys(renames(node, locals))
      else unreadable(node, "builds request fields with #{node.slice}, which the check cannot read")
      end
    end

    def local(node, locals)
      locals.fetch(node.name) { unreadable(node, "names #{node.name}, which the check cannot read") }
    end

    def argument_names(call, locals)
      (call.arguments&.arguments || []).flat_map { names(_1, locals) }
    end

    def names(node, locals)
      case node
      when Prism::SymbolNode then [node.unescaped]
      when Prism::SplatNode then names(node.expression, locals)
      when Prism::LocalVariableReadNode then names(local(node, locals), locals)
      when Prism::ArrayNode then node.elements.flat_map { names(_1, locals) }
      when Prism::CallNode
        unless node.name == :keys
          unreadable(
            node,
            "names fields with #{node.slice}, which the check cannot read"
          )
        end

        hash_entries(node.receiver, locals).keys
      else unreadable(node, "names fields with #{node.slice}, which the check cannot read")
      end
    end

    def renames(call, locals)
      hash_entries(call.arguments.arguments.first, locals)
    end

    def hash_entries(node, locals)
      node = local(node, locals) if node.is_a?(Prism::LocalVariableReadNode)
      unless node.is_a?(Prism::HashNode) || node.is_a?(Prism::KeywordHashNode)
        unreadable(node, "renames fields with #{node.slice}, which the check cannot read")
      end

      node.elements.to_h do |element|
        readable = element.is_a?(Prism::AssocNode) && element.key.is_a?(Prism::SymbolNode) &&
                   element.value.is_a?(Prism::StringNode)
        unless readable
          unreadable(
            element,
            "renames fields with #{element.slice}, which the check cannot read"
          )
        end
        [element.key.unescaped, element.value.unescaped]
      end
    end

    def response(node)
      type = constant(node)
      return nil if UNTYPED_RESPONSES.include?(type)

      @types.node(type).first
    rescue ArgumentError => e
      raise UnreadableSdk.new(node, e.message, UNREADABLE_TYPE_NEXT)
    end

    def constant(node)
      unless node.is_a?(Prism::ConstantPathNode) || node.is_a?(Prism::ConstantReadNode)
        raise UnreadableSdk.new(
          node,
          "names #{node.slice}, which the check cannot read",
          UNREADABLE_TYPE_NEXT
        )
      end

      Object.const_get(node.slice)
    rescue NameError
      raise UnreadableSdk.new(node, "names #{node.slice}, which the check cannot find", UNREADABLE_TYPE_NEXT)
    end

    def unreadable(node, reason)
      raise UnreadableSdk.new(node, reason, UNREADABLE_REQUEST_NEXT)
    end
  end

  class SdkReader
    def initialize(root:, resources:, base_path:)
      @root = Pathname(root)
      @resources = resources
      @reader = RequestReader.new(SdkTypes.new, base_path)
    end

    def shapes
      Dir.glob("**/*.rb", base: @resources).sort.each_with_object({}) do |relative, found|
        file_shapes(File.join(@resources, relative)).each do |key, shape|
          found[key] = found.key?(key) ? merge_shapes(found[key], shape) : shape
        end
      end
    end

    private

    def file_shapes(path)
      program = Prism.parse_file(path)
      unless program.errors.empty?
        line = program.errors.first.location.start_line
        raise Failure.new("#{relative(path)}:#{line} is not valid Ruby.", UNREADABLE_REQUEST_NEXT)
      end

      definitions(program.value).flat_map do |definition|
        locals = local_values(definition)
        requests(definition).map { read(path, _1, locals) }
      end
    end

    def read(path, call, locals)
      @reader.read(call, locals)
    rescue UnreadableSdk => e
      raise Failure.new("#{relative(path)}:#{e.node.location.start_line} #{e.message}.", e.next_step)
    rescue ArgumentError => e
      raise Failure.new("#{relative(path)}:#{call.location.start_line} #{e.message}.", UNREADABLE_TYPE_NEXT)
    end

    def relative(path)
      Pathname(path).relative_path_from(@root).to_s
    end

    def definitions(node)
      walk(node).grep(Prism::DefNode)
    end

    def requests(definition)
      walk(definition).grep(Prism::CallNode).select do |call|
        receiver = call.receiver
        call.name == :request && receiver.is_a?(Prism::InstanceVariableReadNode) && receiver.name == :@client
      end
    end

    def local_values(definition)
      walk(definition).each_with_object({}) do |node, locals|
        case node
        when Prism::LocalVariableWriteNode then locals[node.name] = node.value
        when Prism::MultiWriteNode then locals[node.lefts.first.name] = node.value
        end
      end
    end

    def walk(node)
      [node, *node.compact_child_nodes.flat_map { walk(_1) }]
    end

    def merge_shapes(first, second)
      Shape.new(
        query: Nodes.merge_objects([first.query, second.query]),
        body: Nodes.merge_optional(first.body, second.body),
        response: Nodes.merge_optional(first.response, second.response),
        hidden: first.hidden | second.hidden
      )
    end
  end

  module Comparison
    module_function

    def join(path, name) = path.empty? ? name : "#{path}.#{name}"

    def body_path(path) = path.empty? ? "(body)" : path

    def compare(spec, sdk, path, out)
      if spec.is_a?(Fields) && sdk.is_a?(Fields)
        compare_fields(spec, sdk, path, out)
      elsif spec.is_a?(List) && sdk.is_a?(List)
        compare(spec.items, sdk.items, "#{path}[]", out)
      elsif spec.is_a?(Leaf) && sdk.is_a?(Leaf)
        out << ["enum", body_path(path)] if spec.enum && sdk.enum && spec.enum != sdk.enum
      elsif !Nodes.opaque?(spec) && !Nodes.opaque?(sdk)
        out << ["missing", body_path(path)]
      end
    end

    def compare_fields(spec, sdk, path, out)
      spec.props.each do |name, spec_prop|
        here = join(path, name)
        sdk_prop = sdk.props[name]
        if sdk_prop.nil?
          out << ["missing", here]
          next
        end
        out << ["required", here] if spec_prop.required != sdk_prop.required
        unless spec_prop.nullable.nil? || sdk_prop.nullable.nil? || spec_prop.nullable == sdk_prop.nullable
          out << ["nullable", here]
        end
        compare(spec_prop.node, sdk_prop.node, here, out)
      end
      return if spec.open

      sdk.props.each_key { out << ["extra", join(path, _1)] unless spec.props.key?(_1) }
    end

    def compare_bodies(spec, sdk, out)
      if spec && sdk
        compare(spec, sdk, "", out)
      elsif spec
        one_sided(spec, "missing", out)
      elsif sdk
        one_sided(sdk, "extra", out)
      end
    end

    def one_sided(node, kind, out)
      if node.is_a?(Fields)
        node.props.each_key { out << [kind, _1] }
      elsif !Nodes.opaque?(node)
        out << [kind, "(body)"]
      end
    end

    def visible(node, spec, spec_names)
      return node unless node.is_a?(Fields)

      node.with(
        props: node.props.select do |name, _prop|
          spec_names.include?(name) || !spec.hidden.include?(ApiFieldsCheck.normalize(name))
        end
      )
    end

    def differences(spec, sdk)
      spec_names = spec.query.props.keys
      spec_names += spec.body.props.keys if spec.body.is_a?(Fields)
      request = []
      compare(spec.query, visible(sdk.query, spec, spec_names), "", request)
      compare_bodies(spec.body, visible(sdk.body, spec, spec_names), request)
      response = []
      compare_bodies(spec.response, sdk.response, response)
      [*request.map { ["request", *_1] }, *response.map { ["response", *_1] }]
    end
  end

  module_function

  def operation_key(method, path) = "#{method} #{path.gsub(PLACEHOLDER, '{}')}"

  def normalize(name) = name.downcase.gsub(/[^a-z0-9]/, "")

  def spec_source(environment = ENV)
    source = environment.fetch(SPEC_VARIABLE, "")
    source.empty? ? DEFAULT_SPEC : source
  end

  def unreadable_spec(source)
    Failure.new(
      "Could not read the API spec from #{source}. " \
      "Check network access, or set #{SPEC_VARIABLE} to a local copy of #{DEFAULT_SPEC}."
    )
  end

  def unexpected_spec(source)
    Failure.new(
      "The API spec from #{source} has a part the check cannot read. " \
      "Fix the spec, or set #{SPEC_VARIABLE} to a valid copy of #{DEFAULT_SPEC}."
    )
  end

  def download(url)
    response = Net::HTTP.get_response(URI(url))
    raise IOError, response.code unless response.is_a?(Net::HTTPSuccess)

    response.body
  end

  def load_spec(source)
    content = source.start_with?("https://", "http://") ? download(source) : File.binread(source)
    document = JSON.parse(content)
    raise unexpected_spec(source) unless document.is_a?(Hash)

    document
  rescue SystemCallError,
         IOError,
         SocketError,
         Timeout::Error,
         OpenSSL::SSL::SSLError,
         Net::ProtocolError,
         Net::HTTPBadResponse,
         URI::InvalidURIError,
         JSON::ParserError,
         EncodingError
    raise unreadable_spec(source)
  end

  def spec_shapes(document, source)
    SpecReader.new(document).shapes
  rescue UnexpectedSpec, KeyError, URI::InvalidURIError, NoMethodError, TypeError
    raise unexpected_spec(source)
  end

  def invalid_accepted(problem)
    Failure.new(
      "#{ACCEPTED_FILE} is not valid. #{problem}",
      "Fix #{ACCEPTED_FILE} in the format CONTRIBUTING.md shows under API fields."
    )
  end

  def read_accepted(root)
    groups = begin
      JSON.parse(File.binread(File.join(root, ACCEPTED_FILE)))
    rescue SystemCallError, IOError
      raise invalid_accepted("The file cannot be read.")
    rescue JSON::ParserError, EncodingError
      raise invalid_accepted("It breaks the JSON syntax.")
    end
    unless groups.is_a?(Array)
      raise invalid_accepted("It must be a list of groups, each with a reason and differences.")
    end

    groups.each.with_index(1).with_object({}) do |(group, number), accepted|
      group_entries(group, number).each do |entry|
        key = difference_key(entry)
        raise invalid_accepted("#{entry} appears more than once.") if accepted.key?(key)

        accepted[key] = entry
      end
    end
  end

  def group_entries(group, number)
    fields = group.is_a?(Hash) ? group : {}
    unless fields.keys.sort == %w[differences reason]
      raise invalid_accepted("Group #{number} must hold a reason and differences, and nothing else.")
    end

    reason, listed = fields.values_at("reason", "differences")
    unless reason.is_a?(String) && !reason.strip.empty?
      raise invalid_accepted("Group #{number} needs a non-empty reason.")
    end
    unless listed.is_a?(Array) && !listed.empty?
      raise invalid_accepted("Group #{number} needs at least 1 difference.")
    end

    listed.each do |entry|
      next if entry.is_a?(String) && DIFFERENCE.match?(entry)

      raise invalid_accepted("Group #{number} lists #{JSON.generate(entry)}. #{DIFFERENCE_EXAMPLE}")
    end
  end

  def difference_key(line)
    method, path, *rest = line.split
    [operation_key(method, path), *rest].join(" ")
  end

  def sdk_base_path
    URI(XTwitterScraper::Client.new(base_url: nil).base_url).path.chomp("/")
  end

  def found_differences(spec, sdk, compared)
    compared.each_with_object({}) do |key, found|
      label, spec_shape = spec.fetch(key)
      Comparison.differences(spec_shape, sdk.fetch(key)).each do |side, kind, path|
        line = "#{label} #{side} #{kind} #{path}"
        found[difference_key(line)] = line
      end
    end
  end

  def count(number, noun) = number == 1 ? "1 #{noun}" : "#{number} #{noun}s"

  def check(source:, root:, resources:, ceiling:)
    spec = spec_shapes(load_spec(source), source)
    accepted = read_accepted(root)
    if accepted.length > ceiling
      listed = count(accepted.length, "accepted difference")
      raise Failure.new("#{ACCEPTED_FILE} lists #{listed}, more than the #{ceiling} it may hold.", GROWN_NEXT)
    end
    sdk = SdkReader.new(root: root, resources: resources, base_path: sdk_base_path).shapes
    compared = (spec.keys & sdk.keys).sort
    if compared.empty?
      raise Failure.new(
        "The API spec from #{source} and #{RESOURCES} share no operation, so the check compared nothing. " \
        "Fix the spec source, or the request calls in the SDK."
      )
    end

    found = found_differences(spec, sdk, compared)
    unaccepted = found.except(*accepted.keys).values.sort
    stale = accepted.except(*found.keys).values.sort.map do |entry|
      "#{ACCEPTED_FILE} lists #{entry}, which the check no longer finds. Remove it."
    end
    raise Failure.new(*unaccepted, *stale, FIX_NEXT) unless unaccepted.empty?
    raise Failure.new(*stale, REMOVE_NEXT) unless stale.empty?

    "The SDK's fields match the API for #{count(compared.length, 'operation')}, " \
      "and #{ACCEPTED_FILE} lists #{count(accepted.length, 'accepted difference')}."
  end

  def main(
    source: spec_source,
    root: ROOT,
    resources: File.join(root, RESOURCES),
    ceiling: ACCEPTED_CEILING
  )
    puts(check(source: source, root: root, resources: resources, ceiling: ceiling))
    0
  rescue Failure => e
    warn(e.lines.join("\n"))
    1
  end
end

exit(ApiFieldsCheck.main) if $PROGRAM_NAME == __FILE__
