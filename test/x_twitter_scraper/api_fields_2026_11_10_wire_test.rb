# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::APIFields20261110WireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  PAGE = {tweets: [], has_next_page: false, next_cursor: ""}.freeze

  def before_all
    super
    WebMock.enable!
  end

  def teardown
    WebMock.reset!
    super
  end

  def client
    XTwitterScraper::Client.new(base_url: "http://localhost", api_key: "My API Key")
  end

  def test_bookmarks_and_home_timeline_send_page_size
    stub_request(:get, "http://localhost/x/bookmarks?pageSize=50").to_return_json(status: 200, body: PAGE)
    stub_request(:get, "http://localhost/x/timeline?pageSize=100").to_return_json(status: 200, body: PAGE)

    client.x.bookmarks.list(page_size: 50)
    client.x.get_home_timeline(page_size: 100)

    assert_requested(:get, "http://localhost/x/bookmarks?pageSize=50")
    assert_requested(:get, "http://localhost/x/timeline?pageSize=100")
  end

  def test_media_download_returns_the_posts_it_skipped
    stub_request(:post, "http://localhost/x/media/download").to_return_json(
      status: 200,
      body: {noMediaTweetIds: ["1234567893"], failedTweetIds: ["1234567894"]}
    )

    response = client.x.media.download(tweet_ids: %w[1234567893 1234567894])

    assert_equal(["1234567893"], response.no_media_tweet_ids)
    assert_equal(["1234567894"], response.failed_tweet_ids)
  end
end
