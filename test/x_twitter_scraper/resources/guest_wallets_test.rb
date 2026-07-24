# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::GuestWalletsTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    response =
      @x_twitter_scraper.guest_wallets.create(
        amount_minor: 1000,
        currency: :usd,
        idempotency_key: "e1cb97D8-dDF3-4AaA-ad0a-49E4A0d1CfAa"
      )

    assert_pattern do
      response => XTwitterScraper::Models::GuestWalletCreateResponse
    end

    assert_pattern do
      response => {
        account_required: true | false,
        amount: XTwitterScraper::GuestWalletAmount,
        api_key: String,
        authorization: XTwitterScraper::Models::GuestWalletCreateResponse::Authorization,
        checkout_url: String,
        credential_notice: Symbol,
        credits: String,
        expires_at: Time,
        instructions: Symbol,
        poll_after_seconds: Numeric,
        purchase_id: String,
        requires_user_interaction: true | false,
        status: XTwitterScraper::Models::GuestWalletCreateResponse::Status,
        status_url: Symbol,
        wallet_id: String
      }
    end
  end

  def test_retrieve_status
    response = @x_twitter_scraper.guest_wallets.retrieve_status

    assert_pattern do
      response => XTwitterScraper::Models::GuestWalletRetrieveStatusResponse
    end

    assert_pattern do
      response => {
        balance: String,
        latest_purchase: XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase | nil,
        poll_after_seconds: XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::PollAfterSeconds | nil,
        scope: Symbol,
        status: XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status,
        top_up: XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::TopUp | nil,
        usable: XTwitterScraper::Internal::Type::Boolean,
        wallet_id: String
      }
    end
  end

  def test_topup_required_params
    response =
      @x_twitter_scraper.guest_wallets.topup(
        amount_minor: 1000,
        currency: :usd,
        idempotency_key: "e1cb97D8-dDF3-4AaA-ad0a-49E4A0d1CfAa"
      )

    assert_pattern do
      response => XTwitterScraper::Models::GuestWalletTopupResponse
    end

    assert_pattern do
      response => {
        account_required: true | false,
        amount: XTwitterScraper::GuestWalletAmount,
        checkout_url: String,
        credits: String,
        expires_at: Time,
        instructions: Symbol,
        poll_after_seconds: Numeric,
        purchase_id: String,
        requires_user_interaction: true | false,
        status: XTwitterScraper::Models::GuestWalletTopupResponse::Status,
        status_url: Symbol,
        wallet_id: String,
        api_key: String | nil,
        authorization: XTwitterScraper::Models::GuestWalletTopupResponse::Authorization | nil,
        credential_notice: XTwitterScraper::Models::GuestWalletTopupResponse::CredentialNotice | nil
      }
    end
  end
end
