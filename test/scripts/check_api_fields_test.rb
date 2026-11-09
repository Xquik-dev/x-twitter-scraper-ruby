# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "json"
require "rbconfig"
require "socket"

require_relative "script_support"
require_relative "../../scripts/check_api_fields"

module ApiFieldsFixture
  module Kind
    extend XTwitterScraper::Internal::Type::Enum

    FIRST = :first
    SECOND = :second
  end

  module Value
    extend XTwitterScraper::Internal::Type::Union

    variant String
    variant Integer
  end

  class Owner < XTwitterScraper::Internal::Type::BaseModel
    required :display_name, String, api_name: :displayName
    optional :parent, -> { ApiFieldsFixture::Owner }
  end

  class Item < XTwitterScraper::Internal::Type::BaseModel
    required :id, String
    required :kind, enum: -> { ApiFieldsFixture::Kind }
    required :object, const: :item
    required :owner, -> { ApiFieldsFixture::Owner }
    required :note, String, nil?: true
    optional :tags, XTwitterScraper::Internal::Type::ArrayOf[String]
    optional :owners, -> { XTwitterScraper::Internal::Type::ArrayOf[ApiFieldsFixture::Owner] }
    optional :metadata, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]
    optional :payload, XTwitterScraper::Internal::Type::Unknown
    optional :value, union: -> { ApiFieldsFixture::Value }
  end

  class ItemUpdateParams < XTwitterScraper::Internal::Type::BaseModel
    extend XTwitterScraper::Internal::Type::RequestParameters::Converter
    include XTwitterScraper::Internal::Type::RequestParameters

    required :id, String
    required :title, String
    optional :max_age, Integer
    optional :idempotency_key, String
  end

  class UnreadableModel < XTwitterScraper::Internal::Type::BaseModel
    required :thing, Set
  end
end

class CheckApiFieldsTest < Minitest::Test
  include ScriptSupport

  SCRIPT = File.join(ScriptSupport::ROOT, "scripts", "check_api_fields.rb")
  OPERATION = "PUT /api/v1/items/{itemId}"
  FIX_NEXT = ApiFieldsCheck::FIX_NEXT
  REMOVE_NEXT = ApiFieldsCheck::REMOVE_NEXT
  TYPE_NEXT = ApiFieldsCheck::UNREADABLE_TYPE_NEXT
  REQUEST_NEXT = ApiFieldsCheck::UNREADABLE_REQUEST_NEXT
  ACCEPTED_FILE = ApiFieldsCheck::ACCEPTED_FILE
  ACCEPTED_INVALID_NEXT = "Fix #{ACCEPTED_FILE} in the format CONTRIBUTING.md shows under API fields.".freeze
  STALE_SORT = "#{ACCEPTED_FILE} lists #{OPERATION} request missing sort, " \
               "which the check no longer finds. Remove it.".freeze

  RESOURCE = <<~RUBY
    module ApiFieldsFixture
      class Items
        def update(id, params)
          query_params = [:max_age]
          header_params = {idempotency_key: "idempotency-key"}
          parsed, options = ApiFieldsFixture::ItemUpdateParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :put,
            path: ["items/%1$s", id],
            query: query.transform_keys(max_age: "maxAge"),
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*query_params, *header_params.keys),
            model: ApiFieldsFixture::Item,
            options: options
          )
        end

        def only_in_the_sdk(params = {})
          @client.request(
            method: :get,
            path: "only-in-sdk",
            model: NilClass,
            options: params[:request_options]
          )
        end
      end
    end
  RUBY

  SENT_BODY = "body: parsed.except(*query_params, *header_params.keys)"

  OWNER_SCHEMA = {
    "type" => "object",
    "required" => ["displayName"],
    "properties" => {
      "displayName" => {"type" => "string"},
      "parent" => {"$ref" => "#/components/schemas/Owner"}
    }
  }.freeze

  ITEM_SCHEMA = {
    "allOf" => [
      {"type" => "object", "required" => ["id"], "properties" => {"id" => {"type" => "string"}}},
      {
        "type" => "object",
        "required" => %w[kind object owner note],
        "properties" => {
          "kind" => {"$ref" => "#/components/schemas/Kind"},
          "object" => {"const" => "item"},
          "owner" => {"$ref" => "#/components/schemas/Owner"},
          "note" => {"type" => %w[string null]},
          "tags" => {"type" => "array", "items" => {"type" => "string"}},
          "owners" => {"type" => "array", "items" => {"$ref" => "#/components/schemas/Owner"}},
          "metadata" => {"type" => "object", "additionalProperties" => true},
          "payload" => {},
          "value" => {"oneOf" => [{"type" => "string"}, {"type" => "integer"}]}
        }
      }
    ]
  }.freeze

  def setup
    super
    @root = Dir.mktmpdir("check-api-fields-test-")
    @spec_path = File.join(@root, "openapi.json")
    @resources = File.join(@root, "resources")
    write_resource(RESOURCE)
    write_accepted([])
  end

  def teardown
    FileUtils.remove_entry(@root)
    super
  end

  def content(schema, media_type = "application/json")
    {"content" => {media_type => {"schema" => schema}}}
  end

  def object_schema(properties, required: [])
    {"type" => "object", "required" => required, "properties" => properties}
  end

  def string_query(name)
    {"name" => name, "in" => "query", "schema" => {"type" => "string"}}
  end

  def path_item
    {
      "parameters" => [{"$ref" => "#/components/parameters/ItemId"}],
      "put" => {
        "parameters" => [
          {"name" => "maxAge", "in" => "query", "schema" => {"type" => "integer"}},
          {"name" => "idempotency-key", "in" => "header", "schema" => {"type" => "string"}}
        ],
        "requestBody" => content(object_schema({"title" => {"type" => "string"}}, required: ["title"])),
        "responses" => {
          "200" => {"$ref" => "#/components/responses/Item"},
          "404" => content(object_schema({"error" => {"type" => "string"}}))
        }
      }
    }
  end

  def document
    {
      "openapi" => "3.1.0",
      "servers" => [{"url" => "https://xquik.com"}],
      "paths" => {
        "/api/v1/items/{itemId}" => path_item,
        "/api/v1/only-in-spec" => {"get" => {"responses" => {"200" => content({"type" => "string"})}}}
      },
      "components" => {
        "parameters" => {
          "ItemId" => {"name" => "id", "in" => "path", "required" => true, "schema" => {"type" => "string"}}
        },
        "responses" => {
          "Item" => content({"$ref" => "#/components/schemas/Item"}, "application/json; charset=utf-8")
        },
        "schemas" => {
          "Kind" => {"type" => "string", "enum" => %w[first second]},
          "Owner" => JSON.parse(JSON.generate(OWNER_SCHEMA)),
          "Item" => JSON.parse(JSON.generate(ITEM_SCHEMA))
        }
      }
    }
  end

  def write_resource(source)
    write_file(File.join(@resources, "items.rb"), source)
  end

  def write_accepted(groups)
    write_file(File.join(@root, ACCEPTED_FILE), JSON.generate(groups))
  end

  def run_check(spec = document, source: nil, resources: @resources)
    write_file(@spec_path, JSON.generate(spec))
    status = nil
    stdout, stderr = capture_io do
      status = ApiFieldsCheck.main(source: source || @spec_path, root: @root, resources: resources)
    end
    [status, stdout, stderr.lines(chomp: true)]
  end

  def operation(spec) = spec.fetch("paths").fetch("/api/v1/items/{itemId}").fetch("put")

  def item(spec) = spec.fetch("components").fetch("schemas").fetch("Item").fetch("allOf").last

  def props(spec) = item(spec).fetch("properties")

  def schemas(spec) = spec.fetch("components").fetch("schemas")

  def parameters(spec) = operation(spec).fetch("parameters")

  def body(spec)
    operation(spec).fetch("requestBody").fetch("content").fetch("application/json").fetch("schema")
  end

  def edited
    spec = document
    yield(spec)
    spec
  end

  def assert_differences(expected, spec)
    status, stdout, lines = run_check(spec)

    assert_equal([1, "", [*expected, FIX_NEXT]], [status, stdout, lines])
  end

  def test_the_matching_spec_passes_and_counts_only_shared_operations
    status, stdout, lines = run_check

    assert_equal(0, status, lines.join("\n"))
    assert_equal(
      "The SDK's fields match the API for 1 operation, and #{ACCEPTED_FILE} lists 0 accepted differences.\n",
      stdout
    )
    assert_empty(lines)
  end

  DIFFERENCES = {
    "response missing score" => ->(test, spec) { test.props(spec)["score"] = {"type" => "integer"} },
    "response extra note" => lambda { |test, spec|
      test.props(spec).delete("note")
      test.item(spec)["required"].delete("note")
    },
    "response enum kind" => ->(test, spec) { test.schemas(spec)["Kind"]["enum"] << "third" },
    "response enum object" => ->(test, spec) { test.props(spec)["object"] = {"const" => "other"} },
    "response required tags" => ->(test, spec) { test.item(spec)["required"] << "tags" },
    "response required id" => ->(test, spec) { test.schemas(spec)["Item"]["allOf"].first["required"] = [] },
    "response nullable note" => ->(test, spec) { test.props(spec)["note"] = {"type" => "string"} },
    "response missing tags" => ->(test, spec) { test.props(spec)["tags"] = {"type" => "string"} },
    "request missing sort" => ->(test, spec) { test.parameters(spec) << test.string_query("sort") },
    "request extra maxAge" => ->(test, spec) { test.parameters(spec).shift },
    "request required maxAge" => ->(test, spec) { test.parameters(spec).first["required"] = true },
    "request missing summary" => lambda { |test, spec|
      test.body(spec)["properties"]["summary"] = {"type" => "string"}
    },
    "request required title" => ->(test, spec) { test.body(spec)["required"] = [] },
    "request extra title" => ->(test, spec) { test.operation(spec).delete("requestBody") }
  }.freeze

  DIFFERENCES.each do |difference, edit|
    define_method("test_prints_#{difference.tr(' ', '_')}") do
      assert_differences(["#{OPERATION} #{difference}"], edited { edit.call(self, _1) })
    end
  end

  def test_a_nested_field_prints_its_full_path_under_each_parent
    spec = edited do
      _1["components"]["schemas"]["Owner"]["properties"]["avatar"] = {"type" => "string"}
    end

    assert_differences(
      ["#{OPERATION} response missing owner.avatar", "#{OPERATION} response missing owners[].avatar"],
      spec
    )
  end

  def test_a_response_of_another_type_prints_the_body
    spec = edited do
      _1["components"]["responses"]["Item"] = content({"type" => "array", "items" => {"type" => "string"}})
    end

    assert_differences(["#{OPERATION} response missing (body)"], spec)
  end

  def test_a_spec_response_the_sdk_does_not_type_prints_each_field
    write_resource(RESOURCE.sub("model: ApiFieldsFixture::Item", "model: StringIO"))
    _, _, lines = run_check

    assert_includes(lines, "#{OPERATION} response missing id")
    assert_includes(lines, "#{OPERATION} response missing kind")
  end

  def test_a_typed_response_the_spec_does_not_list_prints_each_field
    spec = edited { operation(_1)["responses"].delete("200") }
    _, _, lines = run_check(spec)

    assert_includes(lines, "#{OPERATION} response extra id")
    assert_includes(lines, "#{OPERATION} response extra owner")
  end

  def test_an_open_object_takes_extra_sdk_fields
    spec = edited do
      item(_1)["additionalProperties"] = true
      item(_1)["properties"].delete("payload")
    end

    assert_equal(0, run_check(spec).first)
  end

  def test_a_nullable_branch_counts_as_nullable
    spec = edited do
      variants = [{"type" => "string"}, {"type" => "integer"}, {"type" => "null"}]
      item(_1)["properties"]["value"] = {"anyOf" => variants}
    end

    assert_differences(["#{OPERATION} response nullable value"], spec)
  end

  def test_a_path_parameter_in_the_params_type_stays_out_unless_the_spec_lists_it
    assert_equal(0, run_check.first)

    spec = edited { _1["components"]["parameters"]["ItemId"]["name"] = "itemId" }

    assert_differences(["#{OPERATION} request extra id"], spec)
  end

  def test_requests_to_one_operation_merge
    write_resource(RESOURCE.sub("def only_in_the_sdk(params = {})\n", <<~RUBY))
      def again(id, params)
        parsed, options = ApiFieldsFixture::ItemUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["items/%1$s", id],
          body: parsed.slice(:title),
          model: ApiFieldsFixture::Item,
          options: options
        )
      end

      def only_in_the_sdk(params = {})
    RUBY

    status, _, lines = run_check

    assert_equal(0, status, lines.join("\n"))
  end

  def test_a_body_read_from_one_field_compares_that_field
    write_resource(RESOURCE.sub(SENT_BODY, "body: parsed[:title]"))
    spec = edited { operation(_1)["requestBody"] = content({"type" => "string"}) }

    assert_equal(0, run_check(spec).first)

    write_resource(RESOURCE.sub(SENT_BODY, "body: parsed[:absent]"))
    status, _, lines = run_check(spec)

    assert_equal(1, status)
    assert_equal(["resources/items.rb:13 reads absent from params that lack it.", REQUEST_NEXT], lines)
  end

  def test_an_accepted_difference_passes_and_is_counted
    write_accepted([{"reason" => "Kept on purpose.", "differences" => ["#{OPERATION} request missing sort"]}])
    spec = edited { operation(_1)["parameters"] << string_query("sort") }
    status, stdout, = run_check(spec)

    assert_equal(0, status)
    assert_includes(stdout, "lists 1 accepted difference.\n")
  end

  def test_an_accepted_difference_matches_under_any_path_parameter_name
    write_accepted(
      [{"reason" => "Kept on purpose.", "differences" => ["PUT /api/v1/items/{other} request missing sort"]}]
    )
    spec = edited { operation(_1)["parameters"] << string_query("sort") }

    assert_equal(0, run_check(spec).first)
  end

  def test_a_stale_acceptance_fails
    write_accepted([{"reason" => "Kept on purpose.", "differences" => ["#{OPERATION} request missing sort"]}])
    status, stdout, lines = run_check

    assert_equal([1, "", [STALE_SORT, REMOVE_NEXT]], [status, stdout, lines])
  end

  def test_new_and_stale_differences_show_together
    write_accepted([{"reason" => "Kept on purpose.", "differences" => ["#{OPERATION} request missing sort"]}])
    spec = edited { item(_1)["properties"]["score"] = {"type" => "integer"} }

    assert_differences(["#{OPERATION} response missing score", STALE_SORT], spec)
  end

  INVALID_ACCEPTED = {
    "It must be a list of groups, each with a reason and differences." => {"reason" => "x"},
    "Group 1 must hold a reason and differences, and nothing else." => ["text"],
    "Group 2 needs a non-empty reason." => [
      {"reason" => "x", "differences" => ["#{OPERATION} request missing a"]},
      {"reason" => "  ", "differences" => ["#{OPERATION} request missing b"]}
    ],
    "Group 1 needs at least 1 difference." => [{"reason" => "x", "differences" => []}],
    "Group 1 lists \"GET items\". #{ApiFieldsCheck::DIFFERENCE_EXAMPLE}" => [
      {"reason" => "x", "differences" => ["GET items"]}
    ],
    "Group 1 lists 7. #{ApiFieldsCheck::DIFFERENCE_EXAMPLE}" => [{"reason" => "x", "differences" => [7]}],
    "Group 1 lists \"PUT /a request wrong b\". #{ApiFieldsCheck::DIFFERENCE_EXAMPLE}" => [
      {"reason" => "x", "differences" => ["PUT /a request wrong b"]}
    ],
    "PUT /a/{y} request missing b appears more than once." => [
      {"reason" => "x", "differences" => ["PUT /a/{x} request missing b", "PUT /a/{y} request missing b"]}
    ]
  }.freeze

  def test_an_invalid_accepted_file_names_its_problem
    INVALID_ACCEPTED.each do |problem, groups|
      write_accepted(groups)
      status, _, lines = run_check

      assert_equal([1, ["#{ACCEPTED_FILE} is not valid. #{problem}", ACCEPTED_INVALID_NEXT]], [status, lines])
    end
  end

  def test_an_accepted_file_that_is_not_json_fails
    write_file(File.join(@root, ACCEPTED_FILE), "[,")
    status, _, lines = run_check

    assert_equal(
      [1, ["#{ACCEPTED_FILE} is not valid. It breaks the JSON syntax.", ACCEPTED_INVALID_NEXT]],
      [status, lines]
    )
  end

  def test_a_missing_accepted_file_fails
    FileUtils.remove_entry(File.join(@root, ACCEPTED_FILE))
    status, _, lines = run_check

    assert_equal(
      [1, ["#{ACCEPTED_FILE} is not valid. The file cannot be read.", ACCEPTED_INVALID_NEXT]],
      [status, lines]
    )
  end

  def test_a_missing_spec_fails_with_how_to_set_one
    missing = File.join(@root, "absent.json")
    status, _, lines = run_check(source: missing)

    assert_equal(1, status)
    assert_equal(
      [
        "Could not read the API spec from #{missing}. " \
        "Check network access, or set XQUIK_OPENAPI_SPEC to a local copy of https://xquik.com/openapi.json."
      ],
      lines
    )
  end

  def test_a_spec_with_an_unreadable_part_fails
    broken = {
      "no paths" => {"openapi" => "3.1.0"},
      "a path item reference" => edited { _1["paths"]["/x"] = {"$ref" => "#/y"} },
      "a dangling reference" => edited { _1["components"]["schemas"].delete("Kind") },
      "a schema of another type" => edited { item(_1)["properties"]["kind"] = "text" },
      "a list" => [1]
    }

    broken.each do |name, spec|
      status, _, lines = run_check(spec)

      assert_equal(1, status, name)
      assert_equal(
        [
          "The API spec from #{@spec_path} has a part the check cannot read. " \
          "Fix the spec, or set XQUIK_OPENAPI_SPEC to a valid copy of https://xquik.com/openapi.json."
        ],
        lines,
        name
      )
    end
  end

  def test_a_spec_sharing_no_operation_fails
    status, _, lines = run_check({"paths" => {}})

    assert_equal(1, status)
    assert_includes(lines.first, "share no operation")
  end

  def self.request_source(arguments)
    "\ndef list(id, params = {})\n  @client.request(#{arguments})\nend\n"
  end

  UNREADABLE_REQUESTS = {
    "\ndef broken(" => ["resources/items.rb:2 is not valid Ruby.", REQUEST_NEXT],
    request_source('method: :get, path: "a", page: 1, model: NilClass') => [
      "resources/items.rb:3 passes page, which the check cannot read.",
      REQUEST_NEXT
    ],
    request_source('"positional"') => [
      "resources/items.rb:3 passes other than keyword arguments.",
      REQUEST_NEXT
    ],
    request_source('method: "get", path: "a", model: NilClass') => [
      "resources/items.rb:3 passes no method symbol.",
      REQUEST_NEXT
    ],
    request_source("method: :get, path: \"a/\#{id}\", model: NilClass") => [
      "resources/items.rb:3 passes a path the check cannot read.",
      REQUEST_NEXT
    ],
    request_source('method: :get, path: "a"') => [
      "resources/items.rb:3 passes no model.",
      REQUEST_NEXT
    ],
    request_source('method: :get, path: "a", query: params, model: NilClass') => [
      "resources/items.rb:3 names params, which the check cannot read.",
      REQUEST_NEXT
    ],
    request_source('method: :get, path: "a", query: {a: 1}, model: NilClass') => [
      "resources/items.rb:3 builds request fields with {a: 1}, which the check cannot read.",
      REQUEST_NEXT
    ],
    request_source('method: :get, path: "a", model: ApiFieldsFixture::Absent') => [
      "resources/items.rb:3 names ApiFieldsFixture::Absent, which the check cannot find.",
      TYPE_NEXT
    ],
    request_source('method: :get, path: "a", model: compute_model') => [
      "resources/items.rb:3 names compute_model, which the check cannot read.",
      TYPE_NEXT
    ],
    request_source('method: :get, path: "a", model: ApiFieldsFixture::UnreadableModel') => [
      "resources/items.rb:3 uses the type Set, which the check cannot read.",
      TYPE_NEXT
    ]
  }.freeze

  def test_an_unreadable_request_names_its_file_and_line
    UNREADABLE_REQUESTS.each do |source, expected|
      write_resource(source)
      status, _, lines = run_check

      assert_equal([1, expected], [status, lines], source)
    end
  end

  def test_the_spec_source_is_the_variable_or_else_the_served_spec
    assert_equal("https://xquik.com/openapi.json", ApiFieldsCheck.spec_source({}))
    assert_equal("https://xquik.com/openapi.json", ApiFieldsCheck.spec_source({"XQUIK_OPENAPI_SPEC" => ""}))
    assert_equal("/tmp/spec.json", ApiFieldsCheck.spec_source({"XQUIK_OPENAPI_SPEC" => "/tmp/spec.json"}))
  end

  def real_differences(spec)
    _, _, lines = run_check(spec, resources: File.join(ScriptSupport::ROOT, ApiFieldsCheck::RESOURCES))
    lines
  end

  def test_the_sdk_query_fields_use_their_wire_names
    names = %w[cursor eventType keywordMonitorId limit monitorId postMonitorId]
    spec = {
      "paths" => {
        "/api/v1/events" => {
          "get" => {
            "parameters" => names.map { {"name" => _1, "in" => "query", "schema" => {}} },
            "responses" => {"200" => content(object_schema({}))}
          }
        }
      }
    }

    assert_equal(
      [*%w[events hasMore nextCursor].map { "GET /api/v1/events response extra #{_1}" }, FIX_NEXT],
      real_differences(spec)
    )
  end

  def test_the_sdk_body_fields_and_models_use_their_wire_names
    event_types = {"type" => "array", "items" => {"$ref" => "#/components/schemas/EventType"}}
    body = object_schema(
      {"eventTypes" => event_types, "username" => {"type" => "string"}},
      required: %w[eventTypes username]
    )
    spec = {
      "paths" => {
        "/api/v1/monitors" => {"post" => {"requestBody" => content(body), "responses" => {}}},
        "/api/v1/monitors/{id}" => {
          "get" => {"responses" => {"200" => content(object_schema({"createdAt" => {"type" => "string"}}))}}
        }
      },
      "components" => {"schemas" => {"EventType" => {"enum" => ["tweet.new"]}}}
    }

    lines = real_differences(spec)

    assert_includes(lines, "POST /api/v1/monitors request enum eventTypes[]")
    assert_includes(lines, "GET /api/v1/monitors/{id} response required createdAt")
    assert_includes(lines, "GET /api/v1/monitors/{id} response extra eventTypes")
    refute_includes(lines, "GET /api/v1/monitors/{id} response extra createdAt")
    refute_includes(lines, "POST /api/v1/monitors request missing eventTypes")
  end

  def test_the_sdk_reads_a_union_body_and_a_multipart_body
    account = object_schema({"account" => {"type" => "string"}})
    spec = {
      "paths" => {
        "/api/v1/compose" => {
          "post" => {
            "requestBody" => content(object_schema({"step" => {"type" => "string"}})),
            "responses" => {}
          }
        },
        "/api/v1/x/profile/avatar" => {
          "patch" => {"requestBody" => content(account, "multipart/form-data"), "responses" => {}}
        }
      }
    }

    lines = real_differences(spec)

    assert_includes(lines, "POST /api/v1/compose request required step")
    assert_includes(lines, "PATCH /api/v1/x/profile/avatar request extra url")
    refute_includes(lines, "POST /api/v1/compose request missing step")
    refute_includes(lines, "PATCH /api/v1/x/profile/avatar request missing account")
    refute_includes(lines, "PATCH /api/v1/x/profile/avatar request extra idempotency_key")
  end

  def test_the_repository_list_of_accepted_differences_is_valid
    accepted = ApiFieldsCheck.read_accepted(ScriptSupport::ROOT)

    assert_kind_of(Hash, accepted)
    assert_empty(accepted.values.grep_v(ApiFieldsCheck::DIFFERENCE))
  end

  def run_script(source)
    bundled = ENV.to_h.except(*ScriptSupport::RELEASE_VARIABLES).merge("XQUIK_OPENAPI_SPEC" => source)
    run_command(RbConfig.ruby, SCRIPT, env: bundled)
  end

  def test_the_script_reads_the_variable_and_exits_1_on_failure
    missing = File.join(@root, "absent.json")
    result = run_script(missing)

    assert_equal(1, result.status, result.output)
    assert_includes(result.stderr, "Could not read the API spec from #{missing}.")
  end

  def serve_once(status_line, body)
    server = TCPServer.new("127.0.0.1", 0)
    thread = Thread.new do
      client = server.accept
      while (line = client.gets) && line != "\r\n"
      end
      client.write("HTTP/1.1 #{status_line}\r\nContent-Length: #{body.bytesize}\r\n")
      client.write("Connection: close\r\n\r\n#{body}")
      client.close
    end
    thread.report_on_exception = false
    yield("http://127.0.0.1:#{server.addr[1]}/openapi.json")
  ensure
    thread&.join(5)
    server&.close
  end

  def test_the_script_downloads_a_spec_over_http
    serve_once("200 OK", JSON.generate({"paths" => {}})) do |url|
      result = run_script(url)

      assert_equal(1, result.status, result.output)
      assert_includes(
        result.stderr,
        "The API spec from #{url} and lib/x_twitter_scraper/resources share no operation"
      )
    end
  end

  def test_the_script_reports_a_failed_download
    serve_once("404 Not Found", "") do |url|
      result = run_script(url)

      assert_equal(1, result.status, result.output)
      assert_includes(result.stderr, "Could not read the API spec from #{url}.")
    end
  end
end
