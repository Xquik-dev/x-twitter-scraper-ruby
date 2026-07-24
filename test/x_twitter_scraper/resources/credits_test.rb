# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::CreditsTest < XTwitterScraper::Test::ResourceTest
  def test_redirect_topup_checkout_required_params
    response = @x_twitter_scraper.credits.redirect_topup_checkout(session_id: "session_id")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_balance
    response = @x_twitter_scraper.credits.retrieve_balance

    assert_pattern do
      response => XTwitterScraper::Models::CreditRetrieveBalanceResponse
    end

    assert_pattern do
      response => {
        auto_topup_amount_dollars: Float,
        auto_topup_enabled: XTwitterScraper::Internal::Type::Boolean,
        auto_topup_threshold: String,
        balance: String,
        lifetime_purchased: String,
        lifetime_used: String
      }
    end
  end

  def test_retrieve_topup_status_required_params
    response = @x_twitter_scraper.credits.retrieve_topup_status(session_id: "session_id")

    assert_pattern do
      response => XTwitterScraper::Models::CreditRetrieveTopupStatusResponse
    end

    assert_pattern do
      response => {
        status: XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status,
        amount_dollars: Integer | nil,
        credits: String | nil
      }
    end
  end

  def test_topup_balance_required_params
    response = @x_twitter_scraper.credits.topup_balance(dollars: 10)

    assert_pattern do
      response => XTwitterScraper::Models::CreditTopupBalanceResponse
    end

    assert_pattern do
      response => {
        redirect_url: String,
        url: String
      }
    end
  end
end
