# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::ExtractionsWireTest < Minitest::Test
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

  def test_cancel
    stub = stub_request(:delete, "http://localhost/extractions/id").to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::ExtractionCancelResponse))

    response = client.extractions.cancel("id")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::ExtractionCancelResponse, response)
  end
end
