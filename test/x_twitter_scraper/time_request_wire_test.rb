# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::TimeRequestWireTest < Minitest::Test
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
    XTwitterScraper::Client.new(base_url: "http://localhost", api_key: "My API Key", max_retries: 0)
  end

  def test_a_time_query_value_is_sent_as_iso_8601
    stub = stub_request(:get, "http://localhost/activity").with(
      query: {"since" => "2026-10-21T00:00:00Z", "until" => "2026-10-28T03:00:00+03:00"}
    ).to_return_json(body: [])

    client.activity.list(since: Time.utc(2026, 10, 21), until_: Time.new(2026, 10, 28, 3, 0, 0, "+03:00"))

    assert_requested(stub)
  end

  def test_a_time_query_value_keeps_its_fraction_of_a_second
    stub = stub_request(:get, "http://localhost/activity").with(
      query: {"since" => "2026-10-21T00:00:00.123456789Z"}
    ).to_return_json(body: [])

    client.activity.list(since: Time.utc(2026, 10, 21, 0, 0, Rational(123_456_789, 1_000_000_000)))

    assert_requested(stub)
  end

  def test_a_string_query_value_is_sent_as_given
    stub = stub_request(:get, "http://localhost/activity").with(
      query: {"since" => "2026-10-21T00:00:00Z"}
    ).to_return_json(body: [])

    client.activity.list(since: "2026-10-21T00:00:00Z")

    assert_requested(stub)
  end

  def test_a_time_in_a_json_body_is_sent_as_iso_8601
    url = "http://localhost/extractions/estimate"
    stub_request(:post, url).to_return_json(body: {})

    client.extractions.estimate_cost(
      tool_type: :reply_extractor,
      since_time: Time.utc(2026, 9, 24, 22),
      until_time: 1_790_000_000
    )

    assert_requested(:post, url) do |request|
      assert_equal(
        ["2026-09-24T22:00:00Z", 1_790_000_000],
        JSON.parse(request.body).values_at("sinceTime", "untilTime")
      )
    end
  end
end
