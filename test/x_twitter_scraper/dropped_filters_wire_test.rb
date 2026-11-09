# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::DroppedFiltersWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  DROPPED = {
    card_name: "promo",
    exclude_source: "bot",
    geocode: "37.78,-122.41,1mi",
    near: "Paris",
    news: true,
    safe: true,
    source: "web",
    within: "10mi"
  }.freeze
  PAGE = {tweets: [], has_next_page: false, next_cursor: ""}.freeze
  CALLS = {
    "tweets/42/replies" => [XTwitterScraper::X::TweetGetRepliesParams, :tweets, :get_replies],
    "users/42/likes" => [XTwitterScraper::X::UserRetrieveLikesParams, :users, :retrieve_likes],
    "users/42/media" => [XTwitterScraper::X::UserRetrieveMediaParams, :users, :retrieve_media],
    "users/42/mentions" => [XTwitterScraper::X::UserRetrieveMentionsParams, :users, :retrieve_mentions]
  }.freeze

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
      bearer_token: "My Bearer Token"
    )
  end

  def test_params_no_longer_name_the_filters_the_api_ignores
    CALLS.each do |path, (params, *)|
      assert_empty(params.known_fields.keys & DROPPED.keys, path)
    end
  end

  def test_an_old_call_passing_a_dropped_filter_still_reads_the_page
    CALLS.each do |path, (_params, resource, method)|
      url = "http://localhost/x/#{path}"
      stub_request(:get, url).with(query: hash_including({})).to_return_json(status: 200, body: PAGE)

      page = client.x.public_send(resource).public_send(method, "42", any_words: "rust", **DROPPED)

      assert_instance_of(XTwitterScraper::PaginatedTweets, page, path)
      assert_requested(
        :get,
        url,
        query: hash_including("anyWords" => "rust", "card_name" => "promo", "near" => "Paris")
      )
    end
  end
end
