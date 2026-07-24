# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::AccountTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve
    response = @x_twitter_scraper.account.retrieve

    assert_pattern do
      response => XTwitterScraper::Models::AccountRetrieveResponse
    end

    assert_pattern do
      response => {
        monitor_billing: XTwitterScraper::Models::AccountRetrieveResponse::MonitorBilling,
        monitors_allowed: Integer,
        monitors_used: Integer,
        plan: XTwitterScraper::Models::AccountRetrieveResponse::Plan,
        credit_info: XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo | nil,
        x_username: String | nil
      }
    end
  end

  def test_set_x_username_required_params
    response = @x_twitter_scraper.account.set_x_username(username: "elonmusk")

    assert_pattern do
      response => XTwitterScraper::Models::AccountSetXUsernameResponse
    end

    assert_pattern do
      response => {
        success: true | false,
        x_username: String
      }
    end
  end

  def test_update_locale_required_params
    response = @x_twitter_scraper.account.update_locale(locale: :en)

    assert_pattern do
      response => XTwitterScraper::Models::AccountUpdateLocaleResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end
end
