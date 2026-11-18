# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::XCommunitiesWireTest < Minitest::Test
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

  def test_find
    stub = stub_request(:get, "http://localhost/x/communities/find").with(query: {"q" => "q", "cursor" => "cursor", "pageSize" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::CommunityPage))

    response = client.x.communities.find(
      q: "q",
      cursor: "cursor",
      page_size: 1,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::CommunityPage, response)
  end

  def test_list_popular
    stub = stub_request(:get, "http://localhost/x/communities/popular").with(query: {"topicId" => "topic_id", "topic" => "topic", "cursor" => "cursor", "pageSize" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::CommunityPage))

    response = client.x.communities.list_popular(
      topic_id: "topic_id",
      topic: "topic",
      cursor: "cursor",
      page_size: 1,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::CommunityPage, response)
  end

  def test_list_suggested
    stub = stub_request(:get, "http://localhost/x/communities/suggested").with(query: {"limit" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::CommunityListSuggestedResponse))

    response = client.x.communities.list_suggested(limit: 1, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::CommunityListSuggestedResponse, response)
  end

  def test_list_topics
    stub = stub_request(:get, "http://localhost/x/communities/topics").with(query: {"limit" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::CommunityListTopicsResponse))

    response = client.x.communities.list_topics(limit: 1, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::CommunityListTopicsResponse, response)
  end

  def test_retrieve_analytics
    stub = stub_request(:get, "http://localhost/x/communities/id/analytics").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::CommunityAnalytics))

    response = client.x.communities.retrieve_analytics("id", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::CommunityAnalytics, response)
  end

  def test_search_members
    stub = stub_request(:get, "http://localhost/x/communities/id/members/search").with(query: {"q" => "q", "minFollowers" => "1", "maxFollowers" => "1", "minFollowing" => "1", "maxFollowing" => "1", "minStatuses" => "1", "maxStatuses" => "1", "minAccountAgeDays" => "1", "verifiedOnly" => "true", "blueVerifiedOnly" => "true", "verifiedType" => "verified_type", "hasWebsite" => "true", "hasLocation" => "true", "hasEmail" => "true", "businessEmailOnly" => "true", "emailDomains" => "email_domains", "bioContains" => "bio_contains", "locationContains" => "location_contains", "usernameContains" => "username_contains", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedUsers))

    response = client.x.communities.search_members(
      "id",
      q: "q",
      min_followers: 1,
      max_followers: 1,
      min_following: 1,
      max_following: 1,
      min_statuses: 1,
      max_statuses: 1,
      min_account_age_days: 1,
      verified_only: true,
      blue_verified_only: true,
      verified_type: "verified_type",
      has_website: true,
      has_location: true,
      has_email: true,
      business_email_only: true,
      email_domains: "email_domains",
      bio_contains: "bio_contains",
      location_contains: "location_contains",
      username_contains: "username_contains",
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedUsers, response)
  end
end
