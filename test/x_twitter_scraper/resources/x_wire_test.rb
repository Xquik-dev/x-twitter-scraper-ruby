# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::XWireTest < Minitest::Test
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

  def test_get_hashflags
    stub = stub_request(:get, "http://localhost/x/hashflags").with(query: {"q" => "q", "activeOnly" => "true", "limit" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::XGetHashflagsResponse))

    response = client.x.get_hashflags(q: "q", active_only: true, limit: 1, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::XGetHashflagsResponse, response)
  end

  def test_get_news_story_versions
    stub = stub_request(:get, "http://localhost/x/news/id/versions").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::XGetNewsStoryVersionsResponse))

    response = client.x.get_news_story_versions("id", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::XGetNewsStoryVersionsResponse, response)
  end

  def test_search_places
    stub = stub_request(:get, "http://localhost/x/places/search").with(query: {"q" => "q", "limit" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::XSearchPlacesResponse))

    response = client.x.search_places(q: "q", limit: 1, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::XSearchPlacesResponse, response)
  end

  def test_autocomplete_search
    stub = stub_request(:get, "http://localhost/x/search/autocomplete").with(query: {"q" => "q", "types" => "types", "limit" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::SearchSuggestions))

    response = client.x.autocomplete_search(q: "q", types: "types", limit: 1, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::SearchSuggestions, response)
  end

  def test_get_trends_history
    stub = stub_request(:get, "http://localhost/x/trends/history").with(query: {"woeid" => "1", "country" => "country", "location" => "location", "from" => "from", "to" => "to", "every" => "every", "count" => "1", "limit" => "1", "cursor" => "cursor", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::XGetTrendsHistoryResponse))

    response = client.x.get_trends_history(
      woeid: 1,
      country: "country",
      location: "location",
      from: "from",
      to: "to",
      every: "every",
      count: 1,
      limit: 1,
      cursor: "cursor",
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::XGetTrendsHistoryResponse, response)
  end

  def test_get_trend_locations
    stub = stub_request(:get, "http://localhost/x/trends/locations").with(query: {"country" => "country", "placeType" => "country", "q" => "q", "limit" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::XGetTrendLocationsResponse))

    response = client.x.get_trend_locations(
      country: "country",
      place_type: :country,
      q: "q",
      limit: 1,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::XGetTrendLocationsResponse, response)
  end
end
