# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module Scaffold
  STREAM = "#{ROOT_MODULE}::Internal::Stream".freeze
  CLIENT = "#{ROOT_MODULE}::Client".freeze

  class MethodText
    def initialize(types)
      @types = types
    end

    def resource_constant(path) = "#{RESOURCES}::#{path.map { Names.camel(_1) }.join('::')}"

    def returns_yard(operation)
      return "StringIO" if operation.binary?
      return "#{STREAM}<#{operation.response.fetch(:stream).constant}>" if operation.stream?

      @types.yard(operation.response)
    end

    def returns_rbi(operation)
      return "StringIO" if operation.binary?
      return "#{STREAM}[#{operation.response.fetch(:stream).constant}]" if operation.stream?

      @types.rbi_out(operation.response)
    end

    def returns_rbs(operation)
      return "StringIO" if operation.binary?
      return "#{STREAM}[#{operation.response.fetch(:stream).constant}]" if operation.stream?

      @types.rbs(operation.response)
    end

    def keywords(operation)
      [*operation.keyword_path, *operation.query, *operation.body, *operation.headers]
    end

    def required_params?(operation) = keywords(operation).any?(&:required)

    def lib(operation)
      fields = keywords(operation)
      overload = [
        operation.positional&.name,
        *fields.map { _1.required ? "#{_1.name}:" : "#{_1.name}: nil" },
        "request_options: {}"
      ].compact
      lines = Text.comment(Text.wrap(operation.doc))
      lines << "#" unless lines.empty?
      lines << "# @overload #{operation.name}(#{overload.join(', ')})"
      [operation.positional, *fields].compact.each do |field|
        lines << "#"
        lines << "# @param #{field.name} [#{@types.yard(field.type)}]#{" #{field.doc}" if field.doc}"
      end
      lines.push("#", "# @param request_options [#{REQUEST_OPTIONS_YARD}, nil]", "#")
      lines.push("# @return [#{returns_yard(operation)}]", "#", "# @see #{operation.params.constant}")
      signature = [operation.positional&.name, required_params?(operation) ? "params" : "params = {}"].compact
      lines << "def #{operation.name}(#{signature.join(', ')})"
      lines.concat(Text.indent(lib_body(operation, fields), 1))
      lines << "end"
    end

    def lib_body(operation, fields)
      positional = operation.positional&.name
      path_values = [*operation.keyword_path.map(&:name), positional].compact
      template = operation.request_path.gsub(/\{[^}]+\}/).with_index(1) { |_, index| "%#{index}$s" }
      path = path_values.empty? ? template.dump : "[#{template.dump}, #{path_values.join(', ')}]"
      request = ["method: :#{operation.verb}", "path: #{path}"]
      if fields.empty?
        request.concat(response_arguments(operation, nil))
        request << "options: params[:request_options]"
        return ["@client.request(", *Text.indent(request.join(",\n").lines(chomp: true), 1), ")"]
      end

      body = ["parsed, options = #{operation.params.constant}.dump_request(params)"]
      operation.keyword_path.each do |field|
        body << "#{field.name} = parsed.delete(:#{field.name}) do"
        body << "  raise ArgumentError.new(\"missing required path argument #{field.name}\")"
        body << "end"
      end
      headers = operation.headers.to_h { [_1.name, _1.api_name.downcase] }
      unless headers.empty?
        body << "header_params = {#{headers.map { |name, api| "#{name}: #{api.dump}" }.join(', ')}}"
      end
      except_headers = headers.empty? ? [] : ["*header_params.keys"]
      query_names = operation.query.map { @types.symbol(_1.api_name) }
      body_names = operation.body.map { @types.symbol(_1.api_name) }
      unless operation.query.empty?
        source = if operation.body.empty?
          except_headers.empty? ? "parsed" : "parsed.except(#{except_headers.join(', ')})"
        else
          "parsed.slice(#{query_names.join(', ')})"
        end
        body << "query = #{ROOT_MODULE}::Internal::Util.encode_query_params(#{source})"
        request << "query: query"
      end
      header_text = headers.empty? ? nil : "parsed.slice(*header_params.keys).transform_keys(header_params)"
      if operation.accept
        accept = "\"accept\" => #{operation.accept.dump}"
        request << "headers: #{header_text ? "{#{accept}, **#{header_text}}" : "{#{accept}}"}"
      elsif header_text
        request << "headers: #{header_text}"
      end
      unless operation.body.empty?
        excluded = [*(operation.query.empty? ? [] : query_names), *except_headers]
        request << "body: #{excluded.empty? ? 'parsed' : "parsed.except(#{excluded.join(', ')})"}"
      end
      request.concat(response_arguments(operation, body_names))
      request << "options: options"
      [*body, "@client.request(", *Text.indent(request.join(",\n").lines(chomp: true), 1), ")"]
    end

    def response_arguments(operation, _names)
      return ["model: StringIO"] if operation.binary?
      return ["stream: #{STREAM}", "model: #{operation.response.fetch(:stream).constant}"] if operation.stream?

      ["model: #{operation.response.constant}"]
    end

    def rbi(operation)
      fields = keywords(operation)
      types = [operation.positional, *fields].compact.map { "#{_1.name}: #{@types.rbi_in(_1.type)}" }
      types << "request_options: #{ROOT_MODULE}::RequestOptions::OrHash"
      arguments = []
      if operation.positional
        arguments.concat(Text.comment(Text.wrap(operation.positional.doc)))
        arguments << "#{operation.positional.name},"
      end
      fields.each do |field|
        arguments.concat(Text.comment(Text.wrap(field.doc)))
        arguments << (field.required ? "#{field.name}:," : "#{field.name}: nil,")
      end
      arguments << "request_options: {}"
      [
        *Text.comment(Text.wrap(operation.doc)),
        "sig do",
        "  params(#{types.join(', ')}).returns(#{returns_rbi(operation)})",
        "end",
        "def #{operation.name}(",
        *Text.indent(arguments, 1),
        ")",
        "end"
      ]
    end

    def rbs(operation)
      fields = keywords(operation)
      arguments = []
      arguments << "#{@types.rbs(operation.positional.type)} #{operation.positional.name}" if operation.positional
      fields.each { arguments << "#{'?' unless _1.required}#{_1.name}: #{@types.rbs(_1.type)}" }
      arguments << "?request_options: #{ROOT_MODULE}::request_opts"
      ["def #{operation.name}: (#{arguments.join(', ')}) -> #{returns_rbs(operation)}"]
    end

    def accessor_lib(child)
      ["# @return [#{child}]", "attr_reader :#{Names.snake(Text.short(child))}"]
    end

    def accessor_rbi(child)
      ["sig { returns(#{child}) }", "attr_reader :#{Names.snake(Text.short(child))}"]
    end

    def accessor_rbs(child)
      ["attr_reader #{Names.snake(Text.short(child))}: #{child}"]
    end

    def assignment(child, owner)
      "@#{Names.snake(Text.short(child))} = #{child}.new(client: #{owner == CLIENT ? 'self' : 'client'})"
    end

    def resource_lib(constant, operations, children)
      body = []
      children.each { body.push(*accessor_lib(_1), "") }
      operations.each { body.push(*lib(_1), "") }
      body.push("# @api private", "#", "# @param client [#{CLIENT}]", "def initialize(client:)", "  @client = client")
      children.each { body << "  #{assignment(_1, constant)}" }
      body << "end"
      Text.wrap_modules(
        constant,
        ["class #{Text.short(constant)}", *Text.indent(body, 1), "end"],
        keyword: ->(name) { name == "Resources" || name == ROOT_MODULE ? "module" : "class" },
        preamble: ["# frozen_string_literal: true", ""]
      )
    end

    def resource_rbi(constant, operations, children)
      body = []
      children.each { body.push(*accessor_rbi(_1), "") }
      operations.each { body.push(*rbi(_1), "") }
      body.push(
        "# @api private",
        "sig { params(client: #{CLIENT}).returns(T.attached_class) }",
        "def self.new(client:)",
        "end"
      )
      Text.wrap_modules(
        constant,
        ["class #{Text.short(constant)}", *Text.indent(body, 1), "end"],
        keyword: ->(name) { name == "Resources" || name == ROOT_MODULE ? "module" : "class" },
        preamble: ["# typed: strong", ""]
      )
    end

    def resource_rbs(constant, operations, children)
      body = []
      children.each { body.push(*accessor_rbs(_1), "") }
      operations.each { body.push(*rbs(_1), "") }
      body << "def initialize: (client: #{CLIENT}) -> void"
      Text.wrap_modules(
        constant,
        ["class #{Text.short(constant)}", *Text.indent(body, 1), "end"],
        keyword: ->(name) { name == "Resources" || name == ROOT_MODULE ? "module" : "class" }
      )
    end
  end
end
