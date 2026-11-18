# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::BatchUnavailableIdsWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  USERS = "http://localhost/x/users/batch"
  TWEETS = "http://localhost/x/users/batch/tweets"

  def before_all
    super
    WebMock.enable!
  end

  def teardown
    WebMock.reset!
    super
  end

  def client
    XTwitterScraper::Client.new(base_url: "http://localhost", api_key: "My API Key", max_retries: 0)
  end

  def test_a_user_batch_splits_its_unavailable_ids_by_what_x_answered
    stub_request(:get, USERS).with(query: {"ids" => "1,2,3"}).to_return_json(
      body: {
        users: [],
        has_next_page: false,
        next_cursor: "",
        requested_count: 3,
        processed_count: 3,
        returned_count: 0,
        unavailable_ids: %w[1 2],
        not_found_ids: ["1"],
        suspended_ids: ["2"],
        failed_ids: ["3"],
        unprocessed_ids: []
      }
    )

    page = client.x.users.retrieve_batch(ids: "1,2,3")

    assert_equal([%w[1 2], ["1"], ["2"]], [page.unavailable_ids, page.not_found_ids, page.suspended_ids])
  end

  def test_a_post_batch_also_names_the_protected_accounts
    stub_request(:get, TWEETS).with(query: {"ids" => "1,2,3,4"}).to_return_json(
      body: {
        tweets: [],
        has_next_page: false,
        next_cursor: "",
        unavailable_ids: %w[1 2],
        not_found_ids: ["1"],
        suspended_ids: ["2"],
        protected_ids: ["3"],
        unprocessed_ids: ["4"]
      }
    )

    page = client.x.users.retrieve_batch_tweets(ids: "1,2,3,4")

    assert_instance_of(XTwitterScraper::Models::BatchUserTweets, page)
    assert_equal(
      [["1"], ["2"], ["3"], ["4"]],
      [page.not_found_ids, page.suspended_ids, page.protected_ids, page.unprocessed_ids]
    )
  end
end
