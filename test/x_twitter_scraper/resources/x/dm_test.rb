# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::DmTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve_history_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.dm.retrieve_history("userId", account: "account")

    assert_pattern do
      response => XTwitterScraper::Models::X::DmRetrieveHistoryResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        messages: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::DmRetrieveHistoryResponse::Message]),
        next_cursor: String
      }
    end
  end

  def test_send__required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.x.dm.send_(
        "userId",
        account: "@elonmusk",
        text: "Example text content",
        idempotency_key: "Idempotency-Key"
      )

    assert_pattern do
      response => XTwitterScraper::Models::X::DmSendResponse
    end

    assert_pattern do
      response => {
        id: String,
        account: XTwitterScraper::Models::X::DmSendResponse::Account | nil,
        action: XTwitterScraper::Models::X::DmSendResponse::Action,
        billing: XTwitterScraper::Models::X::DmSendResponse::Billing,
        charged: XTwitterScraper::Internal::Type::Boolean,
        charged_credits: String,
        next_action: XTwitterScraper::Models::X::DmSendResponse::NextAction | nil,
        object: Symbol,
        poll_after_ms: Integer | nil,
        request: XTwitterScraper::Models::X::DmSendResponse::Request,
        result: XTwitterScraper::Models::X::DmSendResponse::Result | nil,
        retryable: XTwitterScraper::Internal::Type::Boolean,
        safe_to_retry: XTwitterScraper::Internal::Type::Boolean,
        send_dispatched: XTwitterScraper::Internal::Type::Boolean,
        status: XTwitterScraper::Models::X::DmSendResponse::Status,
        status_url: String,
        success: XTwitterScraper::Internal::Type::Boolean,
        target: XTwitterScraper::Models::X::DmSendResponse::Target | nil,
        target_id: String | nil,
        terminal: XTwitterScraper::Internal::Type::Boolean,
        write_action_id: String,
        community_id: String | nil,
        community_name: String | nil,
        completed_at: Time | nil,
        confirmation_attempts: Integer | nil,
        confirmation_checked_at: Time | nil,
        confirmed_at: Time | nil,
        created_at: Time | nil,
        details: ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]) | nil,
        error: String | nil,
        expires_at: Time | nil,
        idempotent: XTwitterScraper::Internal::Type::Boolean | nil,
        media: ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]) | nil,
        media_id: String | nil,
        media_url: String | nil,
        message: String | nil,
        message_id: String | nil,
        request_hash: String | nil,
        request_id: String | nil,
        result_id: String | nil,
        send_dispatched_at: Time | nil,
        tweet_id: String | nil,
        updated_at: Time | nil
      }
    end
  end
end
