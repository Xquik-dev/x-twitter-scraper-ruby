# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::AccountConnectionLinksTest < XTwitterScraper::Test::ResourceTest
  LINK_ID = "xlink_AAAAAAAAAAAAAAAA"

  def assert_link(link)
    assert_pattern do
      link => {
        object: :x_account_connection_link,
        id: String,
        purpose: XTwitterScraper::X::XAccountConnectionLink::Purpose,
        status: XTwitterScraper::X::XAccountConnectionLink::Status,
        reference: String | nil,
        return_url: String | nil,
        api_key_id: String | nil,
        account_id: String | nil,
        x_user_id: String | nil,
        x_username: String | nil,
        health: String | nil,
        failure: String | nil,
        created_at: Time,
        expires_at: Time,
        completed_at: Time | nil
      }
    end
  end

  def test_create
    response = @x_twitter_scraper.x.account_connection_links.create(
      reference: "crm-user-7",
      return_url: "https://app.example.com/connected",
      account_id: "42"
    )

    assert_pattern do
      response => XTwitterScraper::Models::X::AccountConnectionLinkCreateResponse
    end
    assert_link(response)
    assert_pattern do
      response => {url: String}
    end
  end

  def test_retrieve
    response = @x_twitter_scraper.x.account_connection_links.retrieve(LINK_ID)

    assert_pattern do
      response => XTwitterScraper::X::XAccountConnectionLink
    end
    assert_link(response)
  end

  def test_revoke
    response = @x_twitter_scraper.x.account_connection_links.revoke(LINK_ID)

    assert_pattern do
      response => XTwitterScraper::Models::X::AccountConnectionLinkRevokeResponse
    end
    assert_pattern do
      response => {success: true}
    end
  end

  def test_list
    response = @x_twitter_scraper.x.account_connection_links.list(limit: 50, cursor: "abc123")

    assert_pattern do
      response => XTwitterScraper::Models::X::AccountConnectionLinkListResponse
    end
    assert_pattern do
      response => {
        links: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::XAccountConnectionLink]),
        has_more: true | false,
        next_cursor: String | nil
      }
    end
  end

  def test_the_enums_name_every_purpose_and_status
    assert_equal([:connect, :reconnect], XTwitterScraper::X::XAccountConnectionLink::Purpose.values.sort)
    assert_equal(
      [:connected, :connecting, :expired, :failed, :pending, :requires_email_code, :revoked],
      XTwitterScraper::X::XAccountConnectionLink::Status.values.sort
    )
  end
end
