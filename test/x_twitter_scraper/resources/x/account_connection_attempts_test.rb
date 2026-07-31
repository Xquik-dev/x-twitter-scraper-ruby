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
      in XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Pending
      in XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Success
      in XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Failed
      in XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::RequiresEmailCode
      end
    end

    assert_pattern do
      case response
      in {status: :pending, id: String, object: Symbol, poll_after_ms: Integer}
      in {status: :success, id: String, object: Symbol}
      in {
        status: :failed,
        id: String,
        error: String,
        object: Symbol,
        retryable: XTwitterScraper::Internal::Type::Boolean,
        reason: String | nil
      }
      in {status: :requires_email_code, id: String, expires_at: Time, message: String, object: Symbol, username: String}
      end
    end
  end
end
