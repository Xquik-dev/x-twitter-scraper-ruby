# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::EventsWireTest < Minitest::Test
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

  def test_stream
    data = JSON.generate(XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::Event))
    stream = "id: 1\nevent: message\ndata: #{data}\n\n: idle\n\n"
    stub = stub_request(:get, "http://localhost/events/stream").with(query: {"include" => "post_metrics", "lookBack" => "true"}, headers: {"Last-Event-ID" => "last_event_id", "Accept" => "text/event-stream"}).to_return(
      body: stream, headers: {"content-type" => "text/event-stream"}
    )

    response = client.events.stream(include: :post_metrics, look_back: true, last_event_id: "last_event_id")

    assert_requested(stub)
    events = response.to_a
    assert_equal(1, events.length)
    assert_instance_of(XTwitterScraper::Models::Event, events.first)
  end
end
