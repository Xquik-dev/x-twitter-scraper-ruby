# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module Scaffold
  HEADER = <<~TEXT
    # SPDX-FileCopyrightText: 2026 Xquik contributors
    #
    # SPDX-License-Identifier: Apache-2.0
  TEXT
  BASE_MODEL = "#{INTERNAL}::BaseModel".freeze
  REQUEST_OPTIONS_YARD = "#{ROOT_MODULE}::RequestOptions, Hash{Symbol=>Object}".freeze

  module Text
    module_function

    def wrap(text, width = 80)
      return [] if text.nil? || text.empty?

      text.split.each_with_object([+""]) do |word, lines|
        if lines.last.empty?
          lines.last << word
        elsif lines.last.length + word.length + 1 > width
          lines << word.dup
        else
          lines.last << " " << word
        end
      end
    end

    def comment(lines, prefix = "# ")
      lines.map { _1.empty? ? prefix.rstrip : "#{prefix}#{_1}" }
    end

    def indent(lines, depth)
      pad = "  " * depth
      lines.map { _1.empty? ? "" : "#{pad}#{_1}" }
    end

    def short(constant) = constant.split("::").last

    def namespaces(constant) = constant.split("::")[...-1]

    def wrap_modules(constant, body, keyword: ->(_name) { "module" }, preamble: [])
      names = namespaces(constant)
      lines = []
      names.each_with_index { |name, depth| lines << "#{'  ' * depth}#{keyword.call(name)} #{name}" }
      lines.concat(indent(body, names.length))
      names.length.times.reverse_each { lines << "#{'  ' * _1}end" }
      [*HEADER.lines(chomp: true), "", *preamble, *lines].join("\n") << "\n"
    end
  end

  class ModelText
    def initialize(types)
      @types = types
    end

    def lib(plan)
      Text.wrap_modules(plan.constant, lib_plan(plan, top: true), preamble: ["# frozen_string_literal: true", ""])
    end

    def rbi(plan)
      Text.wrap_modules(plan.constant, rbi_plan(plan), preamble: ["# typed: strong", ""])
    end

    def rbs(plan)
      Text.wrap_modules(plan.constant, rbs_plan(plan))
    end

    private

    def params?(plan) = plan.is_a?(Params)

    def ordered(fields)
      plain = fields.reject { _1.type.is_a?(Literal) }
      [*plain.select(&:required), *plain.reject(&:required), *fields.select { _1.type.is_a?(Literal) }]
    end

    def lib_plan(plan, top: false)
      see = top && plan.respond_to?(:see) && plan.see ? ["# @see #{plan.see}"] : []
      case plan
      when Model, Params then [*see, *lib_model(plan)]
      when Enum then [*Text.comment(Text.wrap(plan.doc)), *see, *lib_enum(plan)]
      when Union then [*Text.comment(Text.wrap(plan.doc)), *see, *lib_union(plan)]
      when Alias then [*see, "# @type [#{INTERNAL}::Converter]", "#{Text.short(plan.constant)} = #{lib_alias(plan.type)}"]
      end
    end

    def lib_alias(type)
      case type
      when List then "#{INTERNAL}::ArrayOf[-> { #{@types.lib_inner(type.items)} }]"
      when Map then "#{INTERNAL}::HashOf[-> { #{@types.lib_inner(type.values)} }]"
      else raise PlanError, "A response of #{type.inspect} needs a model"
      end
    end

    def lib_model(plan)
      lines = ["class #{Text.short(plan.constant)} < #{BASE_MODEL}"]
      body = []
      if params?(plan)
        body << "extend #{INTERNAL}::RequestParameters::Converter"
        body << "include #{INTERNAL}::RequestParameters"
        body << ""
      end
      plan.fields.each do |field|
        body << "# @!attribute #{field.name}"
        body.concat(Text.comment(Text.wrap(field.doc), "#   "))
        body << "#"
        nil_text = !field.required || field.nullable ? ", nil" : ""
        body << "#   @return [#{@types.yard(field.type)}#{nil_text}]"
        body << lib_declaration(field)
        body << ""
      end
      body.concat(lib_initialize(plan))
      plan.nested.each do |nested|
        body << ""
        body.concat(lib_plan(nested))
      end
      body.pop while body.last == ""
      [*lines, *Text.indent(body, 1), "end"]
    end

    def lib_declaration(field)
      parts = ["#{field.required ? 'required' : 'optional'} :#{field.name}", @types.lib_field(field.type)]
      parts << "api_name: #{@types.symbol(field.api_name)}" if field.api_name != field.name
      parts << "nil?: true" if field.nullable
      parts.join(", ")
    end

    def lib_initialize(plan)
      fields = ordered(plan.fields)
      arguments = fields.map do |field|
        if field.type.is_a?(Literal)
          "#{field.name}: #{@types.symbol(field.type.value)}"
        else
          field.required ? "#{field.name}:" : "#{field.name}: nil"
        end
      end
      arguments << "request_options: {}" if params?(plan)
      lines = ["# @!method initialize(#{arguments.join(', ')})"]
      doc = Text.wrap(plan.doc)
      lines.concat(Text.comment(doc, "#   "))
      params = fields.map do |field|
        nil_text = field.nullable ? ", nil" : ""
        "@param #{field.name} [#{@types.yard(field.type)}#{nil_text}]#{" #{field.doc}" if field.doc}"
      end
      params << "@param request_options [#{REQUEST_OPTIONS_YARD}]" if params?(plan)
      unless params.empty?
        lines << "#" unless doc.empty?
        params.each_with_index do |param, index|
          lines << "#" if index.positive?
          lines << "#   #{param}"
        end
      end
      lines
    end

    def lib_enum(plan)
      names = plan.values.map { Names.enum_constant(_1) }
      duplicate = names.tally.find { _2 > 1 }&.first
      raise PlanError, "#{plan.constant} has 2 values named #{duplicate}" if duplicate

      body = ["extend #{INTERNAL}::Enum", ""]
      plan.values.zip(names) { |value, name| body << "#{name} = #{@types.symbol(value)}" }
      body.push("", "# @!method self.values", "#   @return [Array<Symbol>]")
      ["module #{Text.short(plan.constant)}", *Text.indent(body, 1), "end"]
    end

    def lib_union(plan)
      body = ["extend #{INTERNAL}::Union", ""]
      plan.variants.each { body.push("variant #{@types.lib_variant(_1)}", "") }
      body.push("# @!method self.variants", "#   @return [Array(#{plan.variants.map { @types.yard(_1) }.join(', ')})]")
      ["module #{Text.short(plan.constant)}", *Text.indent(body, 1), "end"]
    end

    def rbi_plan(plan)
      case plan
      when Model, Params then rbi_model(plan)
      when Enum then [*Text.comment(Text.wrap(plan.doc)), *rbi_enum(plan)]
      when Union then [*Text.comment(Text.wrap(plan.doc)), *rbi_union(plan)]
      when Alias
        ["#{Text.short(plan.constant)} =", "  T.let(#{@types.lib_inner(plan.type)}, #{INTERNAL}::Converter)"]
      end
    end

    def rbi_model(plan)
      body = []
      if params?(plan)
        body << "extend #{INTERNAL}::RequestParameters::Converter"
        body << "include #{INTERNAL}::RequestParameters"
        body << ""
      end
      body << "OrHash = T.type_alias { T.any(#{plan.constant}, #{ROOT_MODULE}::Internal::AnyHash) }"
      body << ""
      plan.fields.each do |field|
        body.concat(Text.comment(Text.wrap(field.doc)))
        out = @types.nilable_rbi(@types.rbi_out(field.type), field.nullable)
        input = @types.nilable_rbi(@types.rbi_in(field.type), field.nullable)
        if field.required && out == input
          body.push("sig { returns(#{out}) }", "attr_accessor :#{field.name}", "")
        else
          reader = field.required ? out : "T.nilable(#{@types.rbi_out(field.type)})"
          body.push("sig { returns(#{reader}) }", "attr_reader :#{field.name}", "")
          body.push("sig { params(#{field.name}: #{input}).void }", "attr_writer :#{field.name}", "")
        end
      end
      body.concat(rbi_new(plan))
      body << ""
      body.concat(rbi_to_hash(plan))
      plan.nested.each do |nested|
        body << ""
        body.concat(rbi_plan(nested))
      end
      ["class #{Text.short(plan.constant)} < #{BASE_MODEL}", *Text.indent(body, 1), "end"]
    end

    def rbi_new(plan)
      fields = ordered(plan.fields)
      types = fields.map { "#{_1.name}: #{@types.nilable_rbi(@types.rbi_in(_1.type), _1.nullable)}" }
      types << "request_options: #{ROOT_MODULE}::RequestOptions::OrHash" if params?(plan)
      sig = types.empty? ? ["sig { returns(T.attached_class) }"] : ["sig do", "  params(#{types.join(', ')}).returns(T.attached_class)", "end"]
      arguments = fields.flat_map do |field|
        value = if field.type.is_a?(Literal)
          "#{field.name}: #{@types.symbol(field.type.value)}"
        else
          field.required ? "#{field.name}:" : "#{field.name}: nil"
        end
        [*Text.comment(Text.wrap(field.doc)), value]
      end
      arguments << "request_options: {}" if params?(plan)
      return [*sig, "def self.new", "end"] if arguments.empty?

      last = arguments.rindex { !_1.start_with?("#") }
      arguments = arguments.each_with_index.map { |line, index| line.start_with?("#") || index == last ? line : "#{line}," }
      [*sig, "def self.new(", *Text.indent(arguments, 1), ")", "end"]
    end

    def rbi_to_hash(plan)
      pairs = plan.fields.map do |field|
        out = @types.rbi_out(field.type)
        "#{field.name}: #{field.required ? @types.nilable_rbi(out, field.nullable) : out}"
      end
      pairs << "request_options: #{ROOT_MODULE}::RequestOptions" if params?(plan)
      ["sig { override.returns({ #{pairs.join(', ')} }) }", "def to_hash", "end"]
    end

    def rbi_enum(plan)
      constant = plan.constant
      body = [
        "extend #{INTERNAL}::Enum",
        "",
        "TaggedSymbol = T.type_alias { T.all(Symbol, #{constant}) }",
        "OrSymbol = T.type_alias { T.any(Symbol, String) }",
        ""
      ]
      body.concat(plan.values.map { "#{Names.enum_constant(_1)} = T.let(#{@types.symbol(_1)}, #{constant}::TaggedSymbol)" })
      body.push("", "sig { override.returns(T::Array[#{constant}::TaggedSymbol]) }", "def self.values", "end")
      ["module #{Text.short(constant)}", *Text.indent(body, 1), "end"]
    end

    def rbi_union(plan)
      constant = plan.constant
      variants = plan.variants.map { @types.rbi_out(_1) }.uniq
      body = [
        "extend #{INTERNAL}::Union",
        "",
        "Variants = T.type_alias { T.any(#{variants.join(', ')}) }",
        "",
        "sig { override.returns(T::Array[#{constant}::Variants]) }",
        "def self.variants",
        "end"
      ]
      ["module #{Text.short(constant)}", *Text.indent(body, 1), "end"]
    end

    def rbs_plan(plan)
      name = Names.type_alias(plan.constant)
      case plan
      when Model, Params
        record = "{ #{plan.fields.map { "#{_1.name}: #{rbs_value(_1)}" }.join(', ')} }"
        record = "#{record} & #{INTERNAL}::request_parameters" if params?(plan)
        ["type #{name} = #{record}", "", *rbs_model(plan)]
      when Enum
        ["type #{name} = #{plan.values.map { @types.symbol(_1) }.join(' | ')}", "", *rbs_enum(plan)]
      when Union
        ["type #{name} = #{plan.variants.map { @types.rbs(_1) }.uniq.join(' | ')}", "", *rbs_union(plan)]
      when Alias
        ["type #{name} = #{@types.rbs(plan.type)}", "", "#{Text.short(plan.constant)}: #{INTERNAL}::Converter"]
      end
    end

    def rbs_value(field)
      text = @types.rbs(field.type)
      field.required ? @types.nilable_rbs(text, field.nullable) : text
    end

    def rbs_model(plan)
      body = []
      if params?(plan)
        body << "extend #{INTERNAL}::RequestParameters::Converter"
        body << "include #{INTERNAL}::RequestParameters"
        body << ""
      end
      plan.fields.each do |field|
        text = @types.rbs(field.type)
        if field.required
          body.push("attr_accessor #{field.name}: #{@types.nilable_rbs(text, field.nullable)}", "")
        else
          input = @types.nilable_rbs(text, field.nullable)
          body.push("attr_reader #{field.name}: #{@types.nilable_rbs(text, true)}", "")
          body.push("def #{field.name}=: (#{input}) -> #{input}", "")
        end
      end
      arguments = ordered(plan.fields).map do |field|
        text = @types.nilable_rbs(@types.rbs(field.type), field.nullable)
        field.required && !field.type.is_a?(Literal) ? "#{field.name}: #{text}" : "?#{field.name}: #{text}"
      end
      arguments << "?request_options: #{ROOT_MODULE}::request_opts" if params?(plan)
      body << "def initialize: (#{arguments.join(', ')}) -> void"
      body << ""
      pairs = plan.fields.map { "#{_1.name}: #{rbs_value(_1)}" }
      pairs << "request_options: #{ROOT_MODULE}::RequestOptions" if params?(plan)
      body << "def to_hash: -> { #{pairs.join(', ')} }"
      plan.nested.each do |nested|
        body << ""
        body.concat(rbs_plan(nested))
      end
      ["class #{Text.short(plan.constant)} < #{BASE_MODEL}", *Text.indent(body, 1), "end"]
    end

    def rbs_enum(plan)
      alias_type = "#{plan.constant.rpartition('::').first}::#{Names.type_alias(plan.constant)}"
      body = ["extend #{INTERNAL}::Enum", ""]
      body.concat(plan.values.map { "#{Names.enum_constant(_1)}: #{@types.symbol(_1)}" })
      body.push("", "def self?.values: -> ::Array[#{alias_type}]")
      ["module #{Text.short(plan.constant)}", *Text.indent(body, 1), "end"]
    end

    def rbs_union(plan)
      alias_type = "#{plan.constant.rpartition('::').first}::#{Names.type_alias(plan.constant)}"
      body = ["extend #{INTERNAL}::Union", "", "def self?.variants: -> ::Array[#{alias_type}]"]
      ["module #{Text.short(plan.constant)}", *Text.indent(body, 1), "end"]
    end
  end
end
