# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraperTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  def before_all
    super
    WebMock.enable!
  end

  def setup
    super
    Thread.current.thread_variable_set(:mock_sleep, [])
  end

  def teardown
    Thread.current.thread_variable_set(:mock_sleep, nil)
    WebMock.reset!
    super
  end

  [
    ["default_request_default", {}, {}, 3],
    ["given_request_default", {max_retries: 3}, {}, 4],
    ["default_request_given", {}, {request_options: {max_retries: 3}}, 4],
    ["given_request_given", {max_retries: 3}, {request_options: {max_retries: 4}}, 5]
  ].each do |name, client_options, request_arguments, attempts|
    define_method("test_client_#{name}_retry_attempts") do
      stub_request(:get, "http://localhost/account").to_return_json(status: 500, body: {})
      client = sdk_client(**client_options)
      assert_raises(XTwitterScraper::Errors::InternalServerError) do
        client.account.retrieve(**request_arguments)
      end
      assert_requested(:get, "http://localhost/account", times: attempts)
    end
  end

  [
    ["seconds", {"retry-after" => "1.3"}],
    ["ms", {"retry-after-ms" => "1300"}]
  ].each do |name, headers|
    define_method("test_client_retry_after_#{name}") do
      stub_request(:get, "http://localhost/account").to_return_json(status: 500, headers: headers, body: {})
      client = sdk_client(max_retries: 1)
      assert_raises(XTwitterScraper::Errors::InternalServerError) { client.account.retrieve }
      assert_requested(:get, "http://localhost/account", times: 2)
      assert_equal(1.3, Thread.current.thread_variable_get(:mock_sleep).last)
    end
  end

  def test_client_retry_after_date
    time_now = Time.now

    stub_request(:get, "http://localhost/account").to_return_json(
      status: 500,
      headers: {"retry-after" => (time_now + 10).httpdate},
      body: {}
    )

    x_twitter_scraper = sdk_client(max_retries: 1)

    Thread.current.thread_variable_set(:time_now, time_now)
    assert_raises(XTwitterScraper::Errors::InternalServerError) do
      x_twitter_scraper.account.retrieve
    end
    Thread.current.thread_variable_set(:time_now, nil)

    assert_requested(:any, /./, times: 2)
    assert_in_delta(10, Thread.current.thread_variable_get(:mock_sleep).last, 1.0)
  end

  [
    ["retry_count_header", {}, %w[0 1 2]],
    [
      "omit_retry_count_header",
      {request_options: {extra_headers: {"x-stainless-retry-count" => nil}}},
      [:absent, :absent, :absent]
    ],
    [
      "overwrite_retry_count_header",
      {request_options: {extra_headers: {"x-stainless-retry-count" => "42"}}},
      %w[42 42 42]
    ]
  ].each do |name, request_arguments, expected|
    define_method("test_#{name}") do
      received = []
      stub_request(:get, "http://localhost/account").to_return do |request|
        received << request.headers.transform_keys(&:downcase).fetch("x-stainless-retry-count", :absent)
        {status: 500, body: "{}", headers: {"content-type" => "application/json"}}
      end
      client = sdk_client
      assert_raises(XTwitterScraper::Errors::InternalServerError) do
        client.account.retrieve(**request_arguments)
      end
      assert_equal(expected, received)
    end
  end

  def test_client_redirect_307
    stub_request(:get, "http://localhost/account").to_return_json(
      status: 307,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:any, "http://localhost/redirected").to_return(
      status: 307,
      headers: {"location" => "/redirected"}
    )

    x_twitter_scraper = sdk_client

    assert_raises(XTwitterScraper::Errors::APIConnectionError) do
      x_twitter_scraper.account.retrieve(request_options: {extra_headers: {}})
    end

    recorded, = WebMock::RequestRegistry.instance.requested_signatures.hash.first

    assert_requested(:any, "http://localhost/redirected", times: 20) do
      assert_equal(recorded.method, _1.method)
      assert_nil(recorded.body)
      assert_nil(_1.body)
      assert_nil(recorded.headers.transform_keys(&:downcase)["content-type"])
      assert_nil(_1.headers.transform_keys(&:downcase)["content-type"])
    end
  end

  def test_client_redirect_303
    stub_request(:get, "http://localhost/account").to_return_json(
      status: 303,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:get, "http://localhost/redirected").to_return(
      status: 303,
      headers: {"location" => "/redirected"}
    )

    x_twitter_scraper = sdk_client

    assert_raises(XTwitterScraper::Errors::APIConnectionError) do
      x_twitter_scraper.account.retrieve(request_options: {extra_headers: {}})
    end

    assert_requested(:get, "http://localhost/redirected", times: 20) do
      headers = _1.headers.keys.map(&:downcase)
      refute_includes(headers, "content-type")
      assert_nil(_1.body)
    end
  end

  def test_client_redirect_auth_keep_same_origin
    stub_request(:get, "http://localhost/account").to_return_json(
      status: 307,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:any, "http://localhost/redirected").to_return(
      status: 307,
      headers: {"location" => "/redirected"}
    )

    x_twitter_scraper = sdk_client

    assert_raises(XTwitterScraper::Errors::APIConnectionError) do
      x_twitter_scraper.account.retrieve(request_options: {extra_headers: {"authorization" => "Bearer xyz"}})
    end

    recorded, = WebMock::RequestRegistry.instance.requested_signatures.hash.first
    auth_header = recorded.headers.transform_keys(&:downcase).fetch("authorization")

    assert_equal("Bearer xyz", auth_header)
    assert_requested(:any, "http://localhost/redirected", times: 20) do
      auth_header = _1.headers.transform_keys(&:downcase).fetch("authorization")
      assert_equal("Bearer xyz", auth_header)
    end
  end

  def test_client_redirect_auth_strip_cross_origin
    stub_request(:get, "http://localhost/account").to_return_json(
      status: 307,
      headers: {"location" => "https://example.com/redirected"},
      body: {}
    )
    stub_request(:any, "https://example.com/redirected").to_return(
      status: 307,
      headers: {"location" => "https://example.com/redirected"}
    )

    x_twitter_scraper = sdk_client

    assert_raises(XTwitterScraper::Errors::APIConnectionError) do
      x_twitter_scraper.account.retrieve(request_options: {extra_headers: {"authorization" => "Bearer xyz"}})
    end

    assert_requested(:any, "https://example.com/redirected", times: 20) do
      headers = _1.headers.keys.map(&:downcase)
      refute_includes(headers, "authorization")
    end
  end

  def test_default_headers
    stub_request(:get, "http://localhost/account").to_return_json(status: 200, body: {})

    x_twitter_scraper = sdk_client

    x_twitter_scraper.account.retrieve

    assert_requested(:any, /./) do |req|
      headers = req.headers.transform_keys(&:downcase)
      expected = req.body.nil? ? ["accept"] : %w[accept content-type]
      headers.fetch_values(*expected).each { refute_empty(_1) }
    end
  end

  private

  def sdk_client(**options)
    XTwitterScraper::Client.new(
      base_url: "http://localhost",
      api_key: "My API Key",
      bearer_token: "My Bearer Token",
      **options
    )
  end
end
