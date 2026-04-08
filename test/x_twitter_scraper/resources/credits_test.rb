# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::CreditsTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve_balance
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.credits.retrieve_balance

    assert_pattern do
      response => XTwitterScraper::Models::CreditRetrieveBalanceResponse
    end

    assert_pattern do
      response => {
        auto_topup_enabled: XTwitterScraper::Internal::Type::Boolean,
        balance: Integer,
        lifetime_purchased: Integer,
        lifetime_used: Integer
      }
    end
  end

  def test_topup_balance_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.credits.topup_balance(amount: 10_000)

    assert_pattern do
      response => XTwitterScraper::Models::CreditTopupBalanceResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end
end
