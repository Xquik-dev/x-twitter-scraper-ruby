# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::XSpacesWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  def before_all
    super
    WebMock.enable!
  end

  def teardown
    WebMock.reset!
    super
  end

  def client
    XTwitterScraper::Client.new(
      base_url: "http://localhost",
      api_key: "My API Key",
      bearer_token: "My Bearer Token",
      max_retries: 0
    )
  end

  def test_search
    stub = stub_request(:get, "http://localhost/x/spaces/search").with(query: {"q" => "q", "queryType" => "Latest", "cursor" => "cursor", "pageSize" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::SpaceSearchResponse))

    response = client.x.spaces.search(
      q: "q",
      query_type: :Latest,
      cursor: "cursor",
      page_size: 1,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::SpaceSearchResponse, response)
  end

  def test_retrieve
    stub = stub_request(:get, "http://localhost/x/spaces/id").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::SpaceRetrieveResponse))

    response = client.x.spaces.retrieve("id", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::SpaceRetrieveResponse, response)
  end

  def test_retrieve_replay
    stub = stub_request(:get, "http://localhost/x/spaces/id/replay").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::SpaceRetrieveReplayResponse))

    response = client.x.spaces.retrieve_replay("id", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::SpaceRetrieveReplayResponse, response)
  end
end
