# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::AccountConnectionLinkWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  LINKS = "http://localhost/x/account-connection-links"
  LINK_ID = "xlink_AAAAAAAAAAAAAAAA"
  PAGE_URL = "https://xquik.com/connect-x#token=CONNECT_LINK_TOKEN"
  LINK = {
    object: "x_account_connection_link",
    id: LINK_ID,
    purpose: "connect",
    status: "pending",
    reference: "crm-user-7",
    returnUrl: "https://app.example.com/connected",
    apiKeyId: "17",
    accountId: nil,
    xUserId: nil,
    xUsername: nil,
    health: nil,
    failure: nil,
    createdAt: "2026-11-08T12:00:00Z",
    expiresAt: "2026-11-08T12:30:00Z",
    completedAt: nil
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

  def test_create_sends_each_field_under_its_api_name_and_reads_the_page_url
    stub_request(:post, LINKS).to_return_json(status: 201, body: LINK.merge(url: PAGE_URL))

    link = client.x.account_connection_links.create(
      reference: "crm-user-7",
      return_url: "https://app.example.com/connected",
      account_id: "42"
    )

    assert_requested(
      :post,
      LINKS,
      body: {"reference" => "crm-user-7", "returnUrl" => "https://app.example.com/connected", "accountId" => "42"}
    )
    assert_instance_of(XTwitterScraper::Models::X::AccountConnectionLinkCreateResponse, link)
    assert_equal([PAGE_URL, "17", :connect, :pending], [link.url, link.api_key_id, link.purpose, link.status])
    assert_equal(Time.utc(2026, 11, 8, 12, 30), link.expires_at)
  end

  def test_create_takes_no_fields
    stub_request(:post, LINKS).to_return_json(status: 201, body: LINK.merge(url: PAGE_URL))

    link = client.x.account_connection_links.create

    assert_requested(:post, LINKS, body: {})
    assert_equal(PAGE_URL, link.url)
  end

  def test_retrieve_reads_a_connected_link_a_dashboard_session_made
    connected = LINK.merge(
      status: "connected",
      apiKeyId: nil,
      xUserId: "9876543210",
      xUsername: "your_x_username",
      health: "healthy",
      completedAt: "2026-11-08T12:02:00Z"
    )
    stub_request(:get, "#{LINKS}/#{LINK_ID}").to_return_json(status: 200, body: connected)

    link = client.x.account_connection_links.retrieve(LINK_ID)

    assert_instance_of(XTwitterScraper::X::XAccountConnectionLink, link)
    assert_nil(link.api_key_id)
    assert_nil(link.url)
    assert_equal(
      [:connected, "your_x_username", "healthy", Time.utc(2026, 11, 8, 12, 2)],
      [link.status, link.x_username, link.health, link.completed_at]
    )
  end

  def test_revoke_deletes_the_link
    stub_request(:delete, "#{LINKS}/#{LINK_ID}").to_return_json(status: 200, body: {success: true})

    response = client.x.account_connection_links.revoke(LINK_ID)

    assert_requested(:delete, "#{LINKS}/#{LINK_ID}")
    assert_equal(true, response.success)
  end

  def test_list_sends_the_page_size_and_cursor_and_reads_the_key_behind_each_link
    other = "xlink_BBBBBBBBBBBBBBBB"
    page = {links: [LINK, LINK.merge(id: other, apiKeyId: nil)], hasMore: true, nextCursor: "def456"}
    stub_request(:get, LINKS).with(query: {"limit" => "2", "cursor" => "abc123"}).to_return_json(status: 200, body: page)

    response = client.x.account_connection_links.list(limit: 2, cursor: "abc123")

    assert_instance_of(XTwitterScraper::Models::X::AccountConnectionLinkListResponse, response)
    assert_equal([[LINK_ID, "17"], [other, nil]], response.links.map { [_1.id, _1.api_key_id] })
    assert_equal([true, "def456"], [response.has_more, response.next_cursor])
  end

  def test_list_reads_the_last_page
    stub_request(:get, LINKS).to_return_json(status: 200, body: {links: [], hasMore: false})

    response = client.x.account_connection_links.list

    assert_equal([[], false, nil], [response.links, response.has_more, response.next_cursor])
  end
end
