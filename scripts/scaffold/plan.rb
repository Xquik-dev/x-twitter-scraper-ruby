# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "json"

module Scaffold
  ROOT_MODULE = "XTwitterScraper"
  MODELS = "#{ROOT_MODULE}::Models".freeze
  RESOURCES = "#{ROOT_MODULE}::Resources".freeze
  HTTP_METHODS = %w[get put post delete patch].freeze
  JSON_TYPES = %w[application/json].freeze
  RUBY_KEYWORDS = %w[
    __ENCODING__
    __LINE__
    __FILE__
    BEGIN
    END
    alias
    and
    begin
    break
    case
    class
    def
    defined?
    do
    else
    elsif
    end
    ensure
    false
    for
    if
    in
    module
    next
    nil
    not
    or
    redo
    rescue
    retry
    return
    self
    super
    then
    true
    undef
    unless
    until
    when
    while
    yield
  ].freeze
  RBS_KEYWORDS = %w[
    alias
    attr_accessor
    attr_reader
    attr_writer
    bool
    bot
    class
    def
    end
    extend
    false
    include
    instance
    interface
    module
    nil
    out
    prepend
    private
    public
    self
    singleton
    top
    true
    type
    unchecked
    untyped
    void
  ].freeze
  CORE_CONSTANTS = %w[Array Date Float Hash Integer Object Set String Symbol T Time].freeze

  class PlanError < StandardError; end

  Scalar = Data.define(:name)
  Literal = Data.define(:value)
  Ref = Data.define(:constant, :kind)
  List = Data.define(:items)
  Map = Data.define(:values)

  STRING = Scalar.new(name: :string)
  INTEGER = Scalar.new(name: :integer)
  FLOAT = Scalar.new(name: :float)
  BOOLEAN = Scalar.new(name: :boolean)
  TIME = Scalar.new(name: :time)
  DATE = Scalar.new(name: :date)
  UNKNOWN = Scalar.new(name: :unknown)

  Field = Data.define(:name, :api_name, :type, :required, :nullable, :doc)
  Model = Data.define(:constant, :doc, :fields, :nested, :see)
  Enum = Data.define(:constant, :doc, :values)
  Union = Data.define(:constant, :doc, :variants, :nested)
  Alias = Data.define(:constant, :doc, :type, :see)
  Params = Data.define(:constant, :doc, :fields, :nested, :see)

  Operation = Data.define(
    :verb,
    :path,
    :resource,
    :name,
    :doc,
    :positional,
    :keyword_path,
    :query,
    :body,
    :headers,
    :params,
    :response,
    :accept
  ) do
    def label = "#{verb.upcase} #{path}"

    def request_path = path.delete_prefix("/api/v1/")

    def stream? = response.is_a?(Hash) && response.key?(:stream)

    def binary? = response == :binary
  end

  module Names
    module_function

    def camel(name)
      name.to_s.split(/[^a-zA-Z0-9]+/).reject(&:empty?).map { _1[0].upcase + _1[1..] }.join
    end

    def snake(name)
      name.to_s
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .gsub(/[^a-zA-Z0-9]+/, "_")
          .gsub(/\A_+|_+\z/, "")
          .downcase
    end

    def singular(name)
      return name if name.match?(/(ss|us|is)\z/)

      case name
      when /ies\z/ then name.sub(/ies\z/, "y")
      when /(sh|ch|x|ses)es\z/ then name.sub(/es\z/, "")
      when /s\z/ then name.delete_suffix("s")
      else name
      end
    end

    def reserved?(name)
      RUBY_KEYWORDS.include?(name) ||
        XTwitterScraper::Internal::Type::BaseModel.method_defined?(name) ||
        XTwitterScraper::Internal::Type::BaseModel.private_method_defined?(name)
    end

    def field(api_name)
      name = snake(api_name)
      raise PlanError, "#{api_name} has no Ruby name" if name.empty? || name.match?(/\A\d/)

      reserved?(name) ? "#{name}_" : name
    end

    def type_alias(constant)
      name = snake(constant.split("::").last)
      RBS_KEYWORDS.include?(name) || reserved?(name) ? "#{name}_" : name
    end

    def enum_constant(value)
      name = value.to_s.upcase.gsub(/[^A-Z0-9]+/, "_").gsub(/\A_+|_+\z/, "")
      name = "V_#{name}" if name.empty? || name.match?(/\A\d/)
      name
    end

    def nested(owner, name)
      constant = camel(name)
      constant = "#{constant}Item" if CORE_CONSTANTS.include?(constant)
      raise PlanError, "#{name} has no constant name" unless constant.match?(/\A[A-Z]/)

      "#{owner}::#{constant}"
    end
  end

  class Planner
    attr_reader :models

    def initialize(document, table)
      @document = document
      @schemas = document.fetch("components").fetch("schemas")
      @reuse = table.fetch("reuse")
      @rows = table.fetch("operations")
      @models = {}
      @kinds = {}
    end

    def operations
      @rows.map { operation(_1) }
    end

    def files
      @models.values
    end

    private

    def operation(row)
      verb, path = row.fetch("operation").split(" ", 2)
      spec = @document.fetch("paths").fetch(path).fetch(verb.downcase)
      resource = row.fetch("resource").split(".")
      method = row.fetch("method")
      namespace = [MODELS, *resource[...-1].map { Names.camel(_1) }].join("::")
      prefix = Names.camel(Names.singular(resource.last)) + Names.camel(method)
      params_constant = "#{namespace}::#{prefix}Params"
      see = "#{RESOURCES}::#{resource.map { Names.camel(_1) }.join('::')}##{method}"
      parameters = spec.fetch("parameters", []).map { resolve_parameter(_1) }
      path_names = path.scan(/\{([^}]+)\}/).flatten
      path_fields = path_names.map { path_field(_1, parameters, params_constant) }
      query = parameters.select { _1["in"] == "query" }.map { parameter_field(_1, params_constant, row) }
      headers = parameters.select { _1["in"] == "header" }.map { header_field(_1, params_constant) }
      body = body_fields(spec, params_constant)
      nested = [*path_fields, *query, *body, *headers].flat_map { _1[1] }
      local = [*path_fields, *headers].map { _1[0].with(api_name: _1[0].name) }
      fields = [*local.first(path_fields.length), *query.map(&:first), *body.map(&:first), *local.drop(path_fields.length)]
      params = Params.new(
        constant: params_constant,
        doc: nil,
        fields: fields,
        nested: nested,
        see: see
      )
      response = response_type(row, spec, "#{namespace}::#{prefix}Response", see)
      Operation.new(
        verb: verb.downcase,
        path: path,
        resource: resource,
        name: method,
        doc: text(spec["description"] || spec["summary"]),
        positional: path_fields.last&.first,
        keyword_path: path_fields[...-1].map(&:first),
        query: query.map(&:first),
        body: body.map(&:first),
        headers: headers.map(&:first),
        params: params,
        response: response,
        accept: response_accept(row, spec)
      )
    end

    def resolve_parameter(value)
      return value unless value.key?("$ref")

      dig(value.fetch("$ref"))
    end

    def path_field(name, parameters, owner)
      spec = parameters.find { _1["in"] == "path" && _1["name"] == name } || {"schema" => {"type" => "string"}}
      type, nested = request_type(spec.fetch("schema", {}), owner, name)
      [
        Field.new(
          name: Names.field(name),
          api_name: name,
          type: type,
          required: true,
          nullable: false,
          doc: text(spec["description"])
        ),
        nested
      ]
    end

    def parameter_field(spec, owner, row)
      name = spec.fetch("name")
      schema = spec.fetch("schema", {})
      narrowed = row.dig("narrow", name)
      schema = schema.merge("enum" => narrowed) if narrowed
      type, nested = request_type(schema, owner, name)
      required = spec["required"] == true || row.fetch("require", []).include?(name)
      [
        Field.new(
          name: Names.field(name),
          api_name: name,
          type: type,
          required: required,
          nullable: false,
          doc: text(spec["description"])
        ),
        nested
      ]
    end

    def header_field(spec, owner)
      name = spec.fetch("name")
      type, nested = request_type(spec.fetch("schema", {}), owner, name)
      [
        Field.new(
          name: Names.field(name),
          api_name: name,
          type: type,
          required: spec["required"] == true,
          nullable: false,
          doc: text(spec["description"])
        ),
        nested
      ]
    end

    def body_fields(spec, owner)
      return [] unless spec.key?("requestBody")

      content = resolve_parameter(spec.fetch("requestBody")).fetch("content")
      media = content.fetch("application/json") { raise PlanError, "#{owner} takes no JSON body" }
      schema = flatten(resolve_ref(media.fetch("schema")))
      required = schema.fetch("required", [])
      schema.fetch("properties", {}).map do |name, property|
        type, nested, nullable = typed(property, owner, name, request: true)
        [
          Field.new(
            name: Names.field(name),
            api_name: name,
            type: type,
            required: required.include?(name),
            nullable: nullable,
            doc: text(property["description"] || referenced_doc(property))
          ),
          nested
        ]
      end
    end

    def request_type(schema, owner, name)
      type, nested, = typed(schema, owner, name, request: true)
      [type, nested]
    end

    def response_accept(row, _spec)
      return "application/octet-stream" if row["response"] == "binary"
      return "text/event-stream" if row["response"] == "stream"

      nil
    end

    def response_type(row, spec, constant, see)
      return :binary if row["response"] == "binary"
      return {stream: reuse_or_component(row.fetch("items"))} if row["response"] == "stream"

      schemas = spec.fetch("responses").select { |code, _| code.start_with?("2") }.filter_map do |_, response|
        resolve_parameter(response).fetch("content", {}).find { |type, _| JSON_TYPES.include?(type) }&.last&.fetch("schema")
      end
      raise PlanError, "#{constant} has no JSON response" if schemas.empty?
      raise PlanError, "#{constant} has 2xx responses of different shapes" if schemas.map { strip_docs(_1) }.uniq.length > 1

      owner, _, name = constant.rpartition("::")
      type, nested, = typed(schemas.first, owner, name)
      own = nested.find { _1.constant == constant }
      nested.each { add_top(_1.equal?(own) ? _1.with(see: see) : _1) }
      return type if own || type.is_a?(Ref)

      add_top(Alias.new(constant: constant, doc: nil, type: type, see: see))
      Ref.new(constant: constant, kind: :alias)
    end

    def add_top(plan)
      existing = @models[plan.constant]
      raise PlanError, "#{plan.constant} is planned twice with different shapes" if existing && existing != plan

      @models[plan.constant] = plan
    end

    def reuse_or_component(name)
      if @reuse.key?(name)
        constant = @reuse.fetch(name)
        return Ref.new(constant: constant, kind: ruby_kind(constant))
      end

      component(name)
    end

    def ruby_kind(constant)
      value = Object.const_get(constant)
      return :model if value.is_a?(Class) && value <= XTwitterScraper::Internal::Type::BaseModel
      return :enum if value.singleton_class <= XTwitterScraper::Internal::Type::Enum
      return :union if value.singleton_class <= XTwitterScraper::Internal::Type::Union

      raise PlanError, "#{constant} is no model, enum or union"
    rescue NameError
      raise PlanError, "#{constant} does not exist, so it cannot stand for a component"
    end

    def component(name)
      constant = "#{MODELS}::#{name}"
      return Ref.new(constant: constant, kind: @kinds.fetch(constant)) if @kinds.key?(constant)

      schema = @schemas.fetch(name)
      kind = classify(schema)
      return nil unless kind

      @kinds[constant] = kind
      type, nested, = typed(schema, MODELS, name)
      expected = Ref.new(constant: constant, kind: kind)
      raise PlanError, "#{name} planned #{type.inspect}, not #{expected.inspect}" unless type == expected

      nested.each { add_top(_1) }
      type
    end

    def classify(schema)
      variants = union_variants(schema)
      if variants
        return nil if variants.length <= 1

        return variants.all? { _1.keys == ["$ref"] } ? :union : :model
      end
      flat = flatten(schema)
      return :enum if flat.key?("enum") && string_enum?(flat)
      return :model if flat["properties"].is_a?(Hash)

      nil
    end

    def string_enum?(schema)
      types = Array(schema["type"]) - ["null"]
      types == ["string"] && schema.fetch("enum").compact.all?(String)
    end

    def union_variants(schema)
      key = %w[oneOf anyOf].find { schema.key?(_1) }
      return nil unless key

      schema.fetch(key).reject { _1["type"] == "null" }
    end

    def typed(schema, owner, name, request: false)
      nullable = nullable?(schema)
      if schema["$ref"].is_a?(String)
        target = schema.fetch("$ref").split("/").last
        ref = reuse_or_component(target)
        return [ref, [], nullable] if ref

        type, nested, inner = typed(@schemas.fetch(target), owner, name, request: request)
        return [type, nested, nullable || inner]
      end

      key = %w[oneOf anyOf].find { schema.key?(_1) }
      if key
        nullable ||= schema.fetch(key).any? { _1["type"] == "null" }
        return union(schema.except(key), union_variants(schema), owner, name, nullable, request)
      end
      return typed(flatten(schema), owner, name, request: request) if schema.key?("allOf")

      if schema.key?("const")
        value = schema.fetch("const")
        return [value.is_a?(String) ? Literal.new(value: value) : scalar(schema), [], nullable]
      end
      if schema.key?("enum") && string_enum?(schema)
        constant = top_or_nested(owner, name)
        enum = Enum.new(constant: constant, doc: text(schema["description"]), values: schema.fetch("enum").compact)
        return [Ref.new(constant: constant, kind: :enum), [enum], nullable || schema.fetch("enum").include?(nil)]
      end
      return object(schema, owner, name, nullable, request) if schema["properties"].is_a?(Hash)

      types = Array(schema["type"]) - ["null"]
      if types == ["array"]
        items, nested, = typed(schema.fetch("items", {}), owner, Names.singular(name), request: request)
        return [List.new(items: items), nested, nullable]
      end
      if types == ["object"]
        extra = schema["additionalProperties"]
        return [Map.new(values: UNKNOWN), [], nullable] unless extra.is_a?(Hash)

        values, nested, = typed(extra, owner, Names.singular(name), request: request)
        return [Map.new(values: values), nested, nullable]
      end
      if types.length > 1
        return [UNKNOWN, [], nullable] if types.intersect?(%w[array object])

        return scalar_union(types.map { scalar({"type" => _1}) }, owner, name, nullable, schema)
      end
      type = scalar(schema)
      return scalar_union([STRING, TIME], owner, name, nullable, schema) if request && type == TIME

      [type, [], nullable]
    end

    def top_or_nested(owner, name)
      owner == MODELS ? "#{MODELS}::#{Names.camel(name)}" : Names.nested(owner, name)
    end

    def nullable?(schema)
      types = schema["type"]
      schema["nullable"] == true || types == "null" || (types.is_a?(Array) && types.include?("null"))
    end

    def scalar(schema)
      types = Array(schema["type"]) - ["null"]
      case types
      when ["string"]
        return DATE if schema["format"] == "date"
        return TIME if schema["format"] == "date-time"

        STRING
      when ["integer"] then INTEGER
      when ["number"] then FLOAT
      when ["boolean"] then BOOLEAN
      else UNKNOWN
      end
    end

    def scalar_union(variants, owner, name, nullable, schema)
      constant = top_or_nested(owner, name)
      union = Union.new(constant: constant, doc: text(schema["description"]), variants: variants, nested: [])
      [Ref.new(constant: constant, kind: :union), [union], nullable]
    end

    def union(schema, variants, owner, name, nullable, request)
      if variants.length == 1
        type, nested, inner = typed(schema.merge(variants.first), owner, name, request: request)
        return [type, nested, nullable || inner]
      end
      if variants.all? { _1.keys == ["$ref"] }
        refs = variants.map do |variant|
          reuse_or_component(variant.fetch("$ref").split("/").last) ||
            raise(PlanError, "#{owner}::#{name} unites #{variant.fetch('$ref')}, which is no model")
        end
        constant = top_or_nested(owner, name)
        union = Union.new(constant: constant, doc: text(schema["description"]), variants: refs, nested: [])
        return [Ref.new(constant: constant, kind: :union), [union], nullable]
      end

      merged = merge_objects(variants.map { flatten(resolve_ref(_1)) })
      object(merged.merge("description" => schema["description"]), owner, name, nullable, request)
    end

    def resolve_ref(schema)
      return schema unless schema["$ref"].is_a?(String)

      resolve_ref(dig(schema.fetch("$ref")))
    end

    def merge_objects(schemas)
      unless schemas.all? { _1["properties"].is_a?(Hash) }
        raise PlanError, "A union mixes objects with other types: #{schemas.map(&:keys).inspect}"
      end

      names = schemas.flat_map { _1.fetch("properties").keys }.uniq
      required = names.select { |key| schemas.all? { _1.fetch("required", []).include?(key) } }
      properties = names.to_h do |key|
        have = schemas.filter_map { _1.fetch("properties")[key] }
        [key, have.length == 1 ? have.first : merge_property(have)]
      end
      {"type" => "object", "properties" => properties, "required" => required}
    end

    def merge_property(schemas)
      return schemas.first if schemas.uniq { strip_docs(_1) }.length == 1

      {"anyOf" => schemas, "description" => schemas.filter_map { _1["description"] }.first}
    end

    def object(schema, owner, name, nullable, request)
      constant = top_or_nested(owner, name)
      required = schema.fetch("required", [])
      nested = []
      fields = schema.fetch("properties").map do |key, property|
        type, inner, field_nullable = typed(property, constant, key, request: request)
        nested.concat(inner)
        Field.new(
          name: Names.field(key),
          api_name: key,
          type: type,
          required: required.include?(key),
          nullable: field_nullable,
          doc: text(property["description"] || referenced_doc(property))
        )
      end
      check_unique(constant, fields, nested)
      model = Model.new(constant: constant, doc: text(schema["description"]), fields: fields, nested: nested, see: nil)
      [Ref.new(constant: constant, kind: :model), [model], nullable]
    end

    def check_unique(constant, fields, nested)
      names = fields.map(&:name)
      duplicate = names.tally.find { _2 > 1 }&.first
      raise PlanError, "#{constant} has 2 fields named #{duplicate}" if duplicate

      constants = nested.map(&:constant)
      duplicate = constants.tally.find { _2 > 1 }&.first
      raise PlanError, "#{constant} nests #{duplicate} twice" if duplicate
    end

    def referenced_doc(property)
      return nil unless property["$ref"].is_a?(String)

      dig(property.fetch("$ref"))["description"]
    end

    def flatten(schema)
      return schema unless schema.key?("allOf")

      parts = schema.fetch("allOf").map { flatten(resolve_ref(_1)) }
      rest = schema.except("allOf")
      parts << flatten(rest) if rest.key?("properties")
      properties = parts.each_with_object({}) { |part, all| all.merge!(part.fetch("properties", {})) }
      required = [*parts, rest].flat_map { _1.fetch("required", []) }.uniq
      merged = {"type" => "object", "properties" => properties, "required" => required}
      merged["description"] = schema["description"] || parts.filter_map { _1["description"] }.first
      merged["nullable"] = true if nullable?(schema)
      merged
    end

    def strip_docs(value)
      case value
      when Hash then value.except("description", "example", "examples").transform_values { strip_docs(_1) }
      when Array then value.map { strip_docs(_1) }
      else value
      end
    end

    def dig(reference)
      reference.delete_prefix("#/").split("/").reduce(@document) { _1.fetch(_2) }
    end

    def text(value)
      return nil if value.nil?

      value.to_s.gsub(/\s+/, " ").strip.then { _1.empty? ? nil : _1 }
    end
  end
end
