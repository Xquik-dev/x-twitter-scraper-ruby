# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::WebhooksWireTest < Minitest::Test
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

  def test_create_telegram_link
    stub = stub_request(:post, "http://localhost/webhooks/telegram").with(body: {"eventTypes" => ["broadcast.started"]}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::WebhookCreateTelegramLinkResponse))

    response = client.webhooks.create_telegram_link(event_types: [:"broadcast.started"])

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::WebhookCreateTelegramLinkResponse, response)
  end
end
