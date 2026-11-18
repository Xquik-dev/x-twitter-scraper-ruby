# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module Scaffold
  class TestText
    BASE_URL = "http://localhost"
    PAYLOAD = "#{ROOT_MODULE}::Test::MockPayload.example".freeze
    BINARY_BODY = "time,activity\\n"

    def initialize(types, plans)
      @types = types
      @plans = plans
    end

    def path(resource) = File.join("test", "x_twitter_scraper", "resources", *resource[...-1], "#{resource.last}_wire_test.rb")

    def render(resource, operations)
      name = "#{ROOT_MODULE}::Test::#{resource.map { Names.camel(_1) }.join}WireTest"
      helper = "#{'../' * resource.length}test_helper"
      body = [
        "extend Minitest::Serial",
        "include WebMock::API",
        "",
        "def before_all",
        "  super",
        "  WebMock.enable!",
        "end",
        "",
        "def teardown",
        "  WebMock.reset!",
        "  super",
        "end",
        "",
        "def client",
        "  #{ROOT_MODULE}::Client.new(base_url: #{BASE_URL.dump}, api_key: \"My API Key\", " \
        "bearer_token: \"My Bearer Token\", max_retries: 0)",
        "end"
      ]
      operations.each { body.push("", *test(_1)) }
      lines = [
        *HEADER.lines(chomp: true),
        "",
        "# frozen_string_literal: true",
        "",
        "require_relative #{helper.dump}",
        "",
        "class #{name} < Minitest::Test",
        *Text.indent(body, 1),
        "end"
      ]
      "#{lines.join("\n")}\n"
    end

    private

    def test(operation)
      positional = operation.positional && sample(operation.positional.type, operation.positional.name)
      keywords = [*operation.keyword_path, *operation.query, *operation.body, *operation.headers].to_h do |field|
        [field, sample(field.type, field.name)]
      end
      path_values = [*operation.keyword_path.map { keywords.fetch(_1).last }, positional&.last].compact
      url = "#{BASE_URL}/#{path_values.reduce(operation.request_path) { _1.sub(/\{[^}]+\}/, _2) }}"
      matcher = []
      unless operation.query.empty?
        matcher << "query: #{hash_text(operation.query.to_h { [_1.api_name, query_value(keywords.fetch(_1).last)] })}"
      end
      headers = operation.headers.to_h { [_1.api_name, keywords.fetch(_1).last.to_s] }
      headers["Accept"] = operation.accept if operation.accept
      matcher << "headers: #{hash_text(headers)}" unless headers.empty?
      matcher << "body: #{hash_text(operation.body.to_h { [_1.api_name, keywords.fetch(_1).last] })}" unless operation.body.empty?
      arguments = [positional&.first, *keywords.map { |field, (literal, _)| "#{field.name}: #{literal}" }].compact
      chain = [*operation.resource, operation.name].join(".")
      stub = "stub_request(:#{operation.verb}, #{url.dump})"
      stub += ".with(#{matcher.join(', ')})" unless matcher.empty?
      [
        "def test_#{operation.name}",
        *Text.indent(arrange(operation, stub), 1),
        "",
        "  response = client.#{chain}(#{arguments.join(', ')})",
        "",
        "  assert_requested(stub)",
        *Text.indent(assertions(operation), 1),
        "end"
      ]
    end

    def arrange(operation, stub)
      if operation.binary?
        return ["stub = #{stub}.to_return(body: \"#{BINARY_BODY}\", headers: {\"content-type\" => \"text/csv\"})"]
      end
      if operation.stream?
        item = operation.response.fetch(:stream).constant
        return [
          "data = JSON.generate(#{PAYLOAD}(#{item}))",
          "stream = \"id: 1\\nevent: message\\ndata: \#{data}\\n\\n: idle\\n\\n\"",
          "stub = #{stub}.to_return(body: stream, headers: {\"content-type\" => \"text/event-stream\"})"
        ]
      end

      ["stub = #{stub}.to_return_json(body: #{payload(operation.response)})"]
    end

    def payload(type)
      plan = type.kind == :alias ? @plans.fetch(type.constant) : nil
      return "[#{PAYLOAD}(#{plan.type.items.constant})]" if plan

      "#{PAYLOAD}(#{type.constant})"
    end

    def assertions(operation)
      return ["assert_equal(\"#{BINARY_BODY}\", response.read)"] if operation.binary?
      if operation.stream?
        item = operation.response.fetch(:stream).constant
        return ["events = response.to_a", "assert_equal(1, events.length)", "assert_instance_of(#{item}, events.first)"]
      end

      type = operation.response
      plan = type.kind == :alias ? @plans.fetch(type.constant) : nil
      return ["assert_instance_of(#{plan.type.items.constant}, response.first)"] if plan

      ["assert_instance_of(#{type.constant}, response)"]
    end

    def sample(type, name)
      case type
      when Literal then [@types.symbol(type.value), type.value]
      when Ref
        return sample(TIME, name) if takes_time?(type)
        raise PlanError, "#{name} takes #{type.constant}, which the test cannot fill" unless type.kind == :enum

        value = enum_values(type.constant).first
        [@types.symbol(value), value]
      when List
        literal, wire = sample(type.items, name)
        ["[#{literal}]", [wire]]
      else scalar_sample(type, name)
      end
    end

    def scalar_sample(type, name)
      case type.name
      when :string then [name.dump, name]
      when :integer then ["1", 1]
      when :float then ["1.5", 1.5]
      when :boolean then ["true", true]
      when :date then ["Date.new(2026, 1, 2)", "2026-01-02"]
      when :time then ["Time.utc(2026, 1, 2, 3, 4, 5)", "2026-01-02T03:04:05Z"]
      else raise PlanError, "#{name} takes a #{type.name}, which the test cannot fill"
      end
    end

    def takes_time?(type)
      plan = @plans[type.constant]
      plan.is_a?(Union) && plan.variants.include?(TIME)
    end

    def enum_values(constant)
      plan = @plans[constant]
      plan ? plan.values : Object.const_get(constant).values.map(&:to_s).sort
    end

    def query_value(value) = value.is_a?(Array) ? value.join(",") : value.to_s

    def hash_text(hash)
      "{#{hash.map { |key, value| "#{key.dump} => #{literal(value)}" }.join(', ')}}"
    end

    def literal(value)
      case value
      when String then value.dump
      when Array then "[#{value.map { literal(_1) }.join(', ')}]"
      else value.to_s
      end
    end
  end
end
