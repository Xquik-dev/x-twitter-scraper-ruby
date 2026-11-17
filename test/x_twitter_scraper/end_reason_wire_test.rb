# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::EndReasonWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  TWEET_PAGES = {
    "x/timeline" => lambda(&:get_home_timeline),
    "x/bookmarks" => ->(x) { x.bookmarks.list },
    "x/tweets/1/quotes" => ->(x) { x.tweets.get_quotes("1") },
    "x/tweets/1/replies" => ->(x) { x.tweets.get_replies("1") },
    "x/users/1/likes" => ->(x) { x.users.retrieve_likes("1") },
    "x/users/1/tweets" => ->(x) { x.users.retrieve_tweets("1") }
  }.freeze
  USER_PAGES = {
    "x/tweets/1/favoriters" => ->(x) { x.tweets.get_favoriters("1") },
    "x/users/1/followers-you-know" => ->(x) { x.users.retrieve_followers_you_know("1") },
    "x/users/1/followers" => ->(x) { x.users.retrieve_followers("1") }
  }.freeze
  PAGES = {
    XTwitterScraper::PaginatedTweets => [TWEET_PAGES, {tweets: [], has_next_page: false, next_cursor: ""}],
    XTwitterScraper::PaginatedUsers => [USER_PAGES, {users: [], has_next_page: false, next_cursor: ""}]
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

  def read_each_page(extra)
    PAGES.each do |type, (routes, page)|
      routes.each do |path, call|
        stub_request(:get, "http://localhost/#{path}").to_return_json(body: page.merge(extra))

        response = call.call(client.x)

        assert_kind_of(type, response, path)
        yield(response, path)
      end
    end
  end

  def test_each_page_x_cut_short_reads_its_end_reason
    read_each_page(endReason: "stalled") do |page, path|
      assert_equal(XTwitterScraper::CoverageEndReason::STALLED, page.end_reason, path)
    end
  end

  def test_each_page_x_did_not_cut_short_has_no_end_reason
    read_each_page({}) do |page, path|
      assert_nil(page.end_reason, path)
    end
  end

  def test_stalled_is_the_only_end_reason
    assert_equal([:stalled], XTwitterScraper::CoverageEndReason.values)
  end
end
