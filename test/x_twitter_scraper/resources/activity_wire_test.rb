# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::ActivityWireTest < Minitest::Test
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

  def test_list
    stub = stub_request(:get, "http://localhost/activity").with(query: {"format" => "json", "limit" => "1", "category" => "category", "status" => "status", "q" => "q", "since" => "2026-01-02T03:04:05Z", "until" => "2026-01-02T03:04:05Z"}).to_return_json(body: [XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::ActivityLogRow)])

    response = client.activity.list(
      format_: :json,
      limit: 1,
      category: "category",
      status: "status",
      q: "q",
      since: Time.utc(2026, 1, 2, 3, 4, 5),
      until_: Time.utc(2026, 1, 2, 3, 4, 5)
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::ActivityLogRow, response.first)
  end

  def test_export
    stub = stub_request(:get, "http://localhost/activity").with(query: {"format" => "json", "limit" => "1", "category" => "category", "status" => "status", "q" => "q", "since" => "2026-01-02T03:04:05Z", "until" => "2026-01-02T03:04:05Z"}, headers: {"Accept" => "application/octet-stream"}).to_return(
      body: "time,activity\n", headers: {"content-type" => "text/csv"}
    )

    response = client.activity.export(
      format_: :json,
      limit: 1,
      category: "category",
      status: "status",
      q: "q",
      since: Time.utc(2026, 1, 2, 3, 4, 5),
      until_: Time.utc(2026, 1, 2, 3, 4, 5)
    )

    assert_requested(stub)
    assert_equal("time,activity\n", response.read)
  end

  def test_retrieve
    stub = stub_request(:get, "http://localhost/activity/id").to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::ActivityRecord))

    response = client.activity.retrieve("id")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::ActivityRecord, response)
  end
end
