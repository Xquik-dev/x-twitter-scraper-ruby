# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "json"

require_relative "test_helper"

class XTwitterScraper::Test::ReadmeQuickstartTest < Minitest::Test
  include WebMock::API

  def setup
    super
    WebMock.enable!
    WebMock.reset!
  end

  def teardown
    WebMock.reset!
    super
  end

  def test_readme_quickstart_contract
    request = stub_request(:get, "http://localhost/x/tweets/search")
              .with(query: {limit: "10", q: "from:elonmusk"})
              .to_return(
                status: 200,
                headers: {"content-type" => "application/json"},
                body: JSON.generate(
                  has_next_page: false,
                  next_cursor: "",
                  tweets: [
                    {
                      id: "1890000000000000000",
                      bookmarkCount: 1,
                      likeCount: 2,
                      quoteCount: 3,
                      replyCount: 4,
                      retweetCount: 5,
                      text: "A deterministic local fixture",
                      viewCount: 6
                    }
                  ]
                )
              )

    x_twitter_scraper = XTwitterScraper::Client.new(api_key: "test_api_key", base_url: "http://localhost")
    paginated_tweets = x_twitter_scraper.x.tweets.search(q: "from:elonmusk", limit: 10)

    assert_requested(request)
    assert_equal(false, paginated_tweets.has_next_page)
    assert_equal("", paginated_tweets.next_cursor)
    assert_equal(["1890000000000000000"], paginated_tweets.tweets.map(&:id))
    assert_equal(["A deterministic local fixture"], paginated_tweets.tweets.map(&:text))
  end
end
