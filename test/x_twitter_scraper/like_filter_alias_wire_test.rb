# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::LikeFilterAliasWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  PAGE = {tweets: [], has_next_page: false, next_cursor: ""}.freeze
  CALLS = {
    "tweets/search" => [:tweets, :search],
    "tweets/42/quotes" => [:tweets, :get_quotes, "42"],
    "tweets/42/replies" => [:tweets, :get_replies, "42"],
    "tweets/42/thread" => [:tweets, :get_thread, "42"],
    "users/42/likes" => [:users, :retrieve_likes, "42"],
    "users/42/media" => [:users, :retrieve_media, "42"],
    "users/42/mentions" => [:users, :retrieve_mentions, "42"],
    "users/42/replies" => [:users, :retrieve_replies, "42"],
    "users/42/tweets" => [:users, :retrieve_tweets, "42"]
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

  def test_min_faves_is_sent_as_min_likes
    CALLS.each do |path, (resource, method, *id)|
      url = "http://localhost/x/#{path}"
      stub_request(:get, url).with(query: hash_including({})).to_return_json(status: 200, body: PAGE)

      client.x.public_send(resource).public_send(method, *id, min_faves: 5)

      assert_requested(:get, url, query: {"minLikes" => "5"})
    end
  end
end
