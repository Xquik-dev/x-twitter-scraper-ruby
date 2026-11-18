# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::MonitorsWireTest < Minitest::Test
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

  def test_upsert_by_username
    stub = stub_request(:put, "http://localhost/monitors/username/username").with(body: {"eventTypes" => ["broadcast.started"], "name" => "name"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::MonitorUpsertByUsernameResponse))

    response = client.monitors.upsert_by_username(
      "username",
      event_types: [:"broadcast.started"],
      name: "name"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::MonitorUpsertByUsernameResponse, response)
  end
end
