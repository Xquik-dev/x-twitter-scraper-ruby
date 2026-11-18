# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::MonitorsPostsWireTest < Minitest::Test
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

  def test_delete
    stub = stub_request(:delete, "http://localhost/monitors/posts/id").to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::Monitors::PostDeleteResponse))

    response = client.monitors.posts.delete("id")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::Monitors::PostDeleteResponse, response)
  end

  def test_list
    stub = stub_request(:get, "http://localhost/monitors/posts").with(query: {"limit" => "1", "cursor" => "cursor"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::Monitors::PostListResponse))

    response = client.monitors.posts.list(limit: 1, cursor: "cursor")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::Monitors::PostListResponse, response)
  end

  def test_retrieve
    stub = stub_request(:get, "http://localhost/monitors/posts/id").to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PostMonitor))

    response = client.monitors.posts.retrieve("id")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PostMonitor, response)
  end

  def test_retrieve_metrics
    stub = stub_request(:get, "http://localhost/monitors/posts/id/metrics").with(query: {"hours" => "1"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PostMonitorMetrics))

    response = client.monitors.posts.retrieve_metrics("id", hours: 1)

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PostMonitorMetrics, response)
  end

  def test_update
    stub = stub_request(:patch, "http://localhost/monitors/posts/id").with(body: {"eventTypes" => ["post.reply.new"], "isActive" => true, "name" => "name"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PostMonitor))

    response = client.monitors.posts.update(
      "id",
      event_types: [:"post.reply.new"],
      is_active: true,
      name: "name"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PostMonitor, response)
  end

  def test_create
    stub = stub_request(:post, "http://localhost/monitors/posts").with(body: {"post" => "post", "name" => "name", "eventTypes" => ["post.reply.new"], "isActive" => true}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PostMonitor))

    response = client.monitors.posts.create(
      post: "post",
      name: "name",
      event_types: [:"post.reply.new"],
      is_active: true
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PostMonitor, response)
  end
end
