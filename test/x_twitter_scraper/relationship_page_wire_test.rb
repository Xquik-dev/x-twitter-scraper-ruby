# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::RelationshipPageWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  ROUTES = {
    "x/users/1/followers" => ->(x) { x.users.retrieve_followers("1") },
    "x/users/1/following" => ->(x) { x.users.retrieve_following("1") },
    "x/users/1/verified-followers" => ->(x) { x.users.retrieve_verified_followers("1") },
    "x/lists/1/followers" => ->(x) { x.lists.retrieve_followers("1") },
    "x/lists/1/members" => ->(x) { x.lists.retrieve_members("1") }
  }.freeze

  PAGE = {users: [], has_next_page: false, next_cursor: ""}.freeze
  SCAN_LIMIT = {limit: 100_000, message: "Stopped at 100000 profiles.", rowsRead: 100_250}.freeze
  DIAGNOSTIC = {
    complete: true,
    cursorFailureCount: 0,
    deadlineReached: false,
    duplicateCount: 3,
    failedStrategyCount: 0,
    malformedCount: 0,
    pagesFetched: 2,
    responseTruncated: false,
    resultLimitReached: false,
    returnedUsers: 40,
    stalledStrategyCount: 0,
    strategies: [{duplicateCount: 3, pagesFetched: 2, stopReason: "exhausted", strategy: 1, uniqueAdded: 40}],
    strategyCount: 1,
    uniqueUsers: 40
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

  def test_each_route_reads_the_scan_limit_on_the_last_page
    ROUTES.each do |path, call|
      stub_request(:get, "http://localhost/#{path}").to_return_json(body: PAGE.merge(scanLimit: SCAN_LIMIT))

      page = call.call(client.x)

      assert_kind_of(XTwitterScraper::UserListPage, page, path)
      assert_kind_of(XTwitterScraper::PaginatedUsers, page, path)
      assert_equal([100_000, 100_250], [page.scan_limit.limit, page.scan_limit.rows_read], path)
    end
  end

  def test_each_route_reads_the_coverage_diagnostic
    ROUTES.each do |path, call|
      stub_request(:get, "http://localhost/#{path}").to_return_json(body: PAGE.merge(diagnostic: DIAGNOSTIC))

      page = call.call(client.x)

      assert_equal(40, page.diagnostic.unique_users, path)
      assert_equal(:exhausted, page.diagnostic.strategies.first.stop_reason, path)
    end
  end

  def test_each_route_reads_a_page_with_neither_field
    ROUTES.each do |path, call|
      stub_request(:get, "http://localhost/#{path}").to_return_json(body: PAGE)

      page = call.call(client.x)

      assert_kind_of(XTwitterScraper::UserListPage, page, path)
      assert_nil(page.scan_limit, path)
    end
  end
end
