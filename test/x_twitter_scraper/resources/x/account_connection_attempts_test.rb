# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::AccountConnectionAttemptsTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.x.account_connection_attempts.retrieve("xatt_0123456789abcdef0123456789abcdef")

    assert_pattern do
      response => XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse
    end

    assert_pattern do
      case response
      in XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptPending
      in XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptSuccess
      in XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionAttemptFailed
      in XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::XAccountConnectionChallenge
      end
    end
  end
end
