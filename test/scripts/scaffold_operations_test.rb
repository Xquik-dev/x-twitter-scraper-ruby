# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "script_support"
require_relative "../../scripts/scaffold_operations"

class ScaffoldOperationsTest < Minitest::Test
  include ScriptSupport

  COPIED = %w[
    lib/x_twitter_scraper.rb
    lib/x_twitter_scraper/models.rb
    rbi/x_twitter_scraper/models.rbi
    sig/x_twitter_scraper/models.rbs
    lib/x_twitter_scraper/client.rb
    rbi/x_twitter_scraper/client.rbi
    sig/x_twitter_scraper/client.rbs
  ].freeze
  RESOURCE = "lib/x_twitter_scraper/resources/scaffold_gadgets.rb"
  OPERATION = "GET /api/v1/scaffold-gadgets/{gadgetId}/parts/{id}"

  Recorder = Struct.new(:requests) do
    def request(req)
      requests << req
      :answered
    end
  end

  def setup
    @root = Dir.mktmpdir("scaffold-operations-test-")
    COPIED.each { write_file(File.join(@root, _1), File.read(File.join(ScriptSupport::ROOT, _1))) }
    write_file(File.join(@root, ApiFieldsCheck::ACCEPTED_FILE), "[]")
    write_file(File.join(@root, ApiFieldsCheck::EXCLUDED_FILE), "[]")
  end

  def teardown
    FileUtils.remove_entry(@root)
  end

  def document
    {
      "openapi" => "3.1.0",
      "servers" => [{"url" => "https://xquik.com"}],
      "paths" => {
        "/api/v1/scaffold-gadgets/{gadgetId}/parts/{id}" => {
          "get" => {
            "description" => "Reads 1 part of a gadget.",
            "parameters" => [
              {"name" => "gadgetId", "in" => "path", "required" => true, "schema" => {"type" => "string"}},
              {"name" => "id", "in" => "path", "required" => true, "schema" => {"type" => "string"}},
              {"name" => "pageSize", "in" => "query", "schema" => {"type" => "integer"}},
              {
                "name" => "kind",
                "in" => "query",
                "schema" => {"type" => "string", "enum" => %w[small large]}
              },
              {
                "name" => "Idempotency-Key",
                "in" => "header",
                "required" => true,
                "schema" => {"type" => "string"}
              }
            ],
            "responses" => {
              "200" => {"content" => {"application/json" => {"schema" => {"$ref" => "#/components/schemas/ScaffoldPart"}}}}
            }
          }
        }
      },
      "components" => {
        "schemas" => {
          "ScaffoldPart" => {
            "type" => "object",
            "required" => %w[id createdAt],
            "properties" => {
              "id" => {"type" => "string"},
              "createdAt" => {"type" => "string", "format" => "date-time"},
              "note" => {"type" => %w[string null]},
              "status" => {"type" => "string", "enum" => %w[ready broken]},
              "owner" => {"$ref" => "#/components/schemas/ScaffoldOwner"},
              "tags" => {"type" => "array", "items" => {"type" => "string"}}
            }
          },
          "ScaffoldOwner" => {"type" => "object", "properties" => {"name" => {"type" => "string"}}}
        }
      }
    }
  end

  def table(reuse = {})
    {
      "reuse" => reuse,
      "operations" => [{"operation" => OPERATION, "resource" => "scaffold_gadgets", "method" => "part"}]
    }
  end

  def scaffold(spec = document, reuse: {})
    Scaffold::Run.new(spec, root: @root, table: table(reuse), format: false).call
  end

  def read(path) = File.read(File.join(@root, path))

  def test_it_writes_the_method_its_models_their_types_and_a_wire_test
    run = scaffold

    expected = %w[
      lib/x_twitter_scraper/models/scaffold_gadget_part_params.rb
      lib/x_twitter_scraper/models/scaffold_owner.rb
      lib/x_twitter_scraper/models/scaffold_part.rb
      rbi/x_twitter_scraper/models/scaffold_part.rbi
      sig/x_twitter_scraper/models/scaffold_part.rbs
      rbi/x_twitter_scraper/resources/scaffold_gadgets.rbi
      sig/x_twitter_scraper/resources/scaffold_gadgets.rbs
      test/x_twitter_scraper/resources/scaffold_gadgets_wire_test.rb
    ]

    assert_empty(expected - run.changed)
    assert_includes(read(RESOURCE), "def part(id, params)")
    assert_includes(
      read("lib/x_twitter_scraper.rb"),
      'require_relative "x_twitter_scraper/resources/scaffold_gadgets"'
    )
    assert_includes(read("lib/x_twitter_scraper/models.rb"), "ScaffoldPart = XTwitterScraper::Models::ScaffoldPart")
    assert_includes(read("sig/x_twitter_scraper/models.rbs"), "class ScaffoldOwner = XTwitterScraper::Models::ScaffoldOwner")
    assert_includes(read("lib/x_twitter_scraper/client.rb"), "@scaffold_gadgets = XTwitterScraper::Resources::ScaffoldGadgets.new(client: self)")
  end

  def test_a_rerun_on_its_own_output_changes_nothing
    scaffold

    assert_empty(scaffold.changed)
  end

  def test_the_method_sends_each_parameter_under_its_api_name_and_the_check_finds_no_difference
    scaffold
    %w[scaffold_owner scaffold_part scaffold_gadget_part_params].each do |name|
      load(File.join(@root, "lib/x_twitter_scraper/models/#{name}.rb"))
    end
    load(File.join(@root, RESOURCE))
    recorder = Recorder.new([])

    answer = XTwitterScraper::Resources::ScaffoldGadgets.new(client: recorder)
                                                        .part("p1", gadget_id: "g1", page_size: 5, kind: :large, idempotency_key: "k1")

    request = recorder.requests.fetch(0)
    assert_equal(:answered, answer)
    assert_equal(["scaffold-gadgets/%1$s/parts/%2$s", "g1", "p1"], request.fetch(:path))
    assert_equal({pageSize: "5", kind: "large"}, request.fetch(:query))
    assert_equal({"idempotency-key" => "k1"}, request.fetch(:headers))
    assert_equal(XTwitterScraper::Models::ScaffoldPart, request.fetch(:model))
    spec_path = File.join(@root, "openapi.json")
    write_file(spec_path, JSON.generate(document))
    result = ApiFieldsCheck.check(
      source: spec_path,
      root: @root,
      resources: File.join(
        @root,
        "lib/x_twitter_scraper/resources"
      ),
      ceiling: 0
    )

    assert_match(/match the API for 1 operation/, result)
  ensure
    XTwitterScraper::Resources.send(:remove_const, :ScaffoldGadgets) if XTwitterScraper::Resources.const_defined?(
      :ScaffoldGadgets, false
    )
  end

  def test_a_reused_component_keeps_its_class_and_gets_no_file
    run = scaffold(reuse: {"ScaffoldPart" => "XTwitterScraper::Models::UserProfile"})

    refute_includes(run.changed, "lib/x_twitter_scraper/models/scaffold_part.rb")
    refute_includes(run.changed, "lib/x_twitter_scraper/models/scaffold_owner.rb")
    assert_includes(read(RESOURCE), "model: XTwitterScraper::Models::UserProfile")
  end

  def test_a_reuse_that_names_no_class_fails
    error = assert_raises(Scaffold::PlanError) { scaffold(reuse: {"ScaffoldPart" => "XTwitterScraper::Models::NoSuchModel"}) }

    assert_match(/NoSuchModel does not exist/, error.message)
  end

  def test_an_existing_resource_keeps_its_methods_and_gains_the_new_one
    hand = <<~RUBY
      module XTwitterScraper
        module Resources
          class ScaffoldGadgets
            def list(params = {})
              @client.request(method: :get, path: "scaffold-gadgets", model: NilClass, options: params[:request_options])
            end

            # @api private
            def initialize(client:)
              @client = client
            end
          end
        end
      end
    RUBY
    write_file(File.join(@root, RESOURCE), hand)
    write_file(File.join(@root, "rbi/x_twitter_scraper/resources/scaffold_gadgets.rbi"), <<~RUBY)
      module XTwitterScraper
        module Resources
          class ScaffoldGadgets
            sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
            def self.new(client:)
            end
          end
        end
      end
    RUBY
    write_file(File.join(@root, "sig/x_twitter_scraper/resources/scaffold_gadgets.rbs"), <<~RBS)
      module XTwitterScraper
        module Resources
          class ScaffoldGadgets
            def initialize: (client: XTwitterScraper::Client) -> void
          end
        end
      end
    RBS
    XTwitterScraper::Resources.const_set(:ScaffoldGadgets, Class.new { def list = nil })
    scaffold
    source = read(RESOURCE)

    assert_includes(source, "def list(params = {})")
    assert_includes(source, "def part(id, params)")
    assert_operator(source.index("def part("), :<, source.index("def initialize("))
    assert_includes(
      read("sig/x_twitter_scraper/resources/scaffold_gadgets.rbs"),
      "def part: (String id, gadget_id: String"
    )
    assert_empty(scaffold.changed)
  ensure
    XTwitterScraper::Resources.send(:remove_const, :ScaffoldGadgets) if XTwitterScraper::Resources.const_defined?(
      :ScaffoldGadgets, false
    )
  end

  def test_the_repository_table_names_each_operation_once
    rows = JSON.parse(File.read(Scaffold::TABLE)).fetch("operations")
    names = rows.map { [_1.fetch("resource"), _1.fetch("method")] }

    assert_equal(names.uniq.length, names.length)
  end
end
