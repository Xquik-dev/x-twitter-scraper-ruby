# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::XDmWireTest < Minitest::Test
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

  def test_delete_message
    stub = stub_request(:delete, "http://localhost/x/dm/user_id/messages/message_id").with(query: {"account" => "account"}, headers: {"Idempotency-Key" => "idempotency_key", "Prefer" => "prefer"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::WriteActionRetrieveResponse))

    response = client.x.dm.delete_message(
      "message_id",
      user_id: "user_id",
      account: "account",
      idempotency_key: "idempotency_key",
      prefer: "prefer"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::WriteActionRetrieveResponse, response)
  end
end
