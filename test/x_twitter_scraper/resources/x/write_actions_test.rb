# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::WriteActionsTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.write_actions.retrieve("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::WriteActionRetrieveResponse
    end

    assert_pattern do
      response => {
        action: String,
        charged: XTwitterScraper::Internal::Type::Boolean,
        charged_credits: String,
        created_at: Time,
        media: XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media,
        retryable: true | false,
        send_dispatched: XTwitterScraper::Internal::Type::Boolean,
        status: XTwitterScraper::Models::X::WriteActionRetrieveResponse::Status,
        write_action_id: String,
        confirmation_attempts: Integer | nil,
        confirmation_checked_at: Time | nil,
        confirmation_source: String | nil,
        confirmed_at: Time | nil,
        message: String | nil,
        message_id: String | nil,
        send_dispatched_at: Time | nil,
        target_id: String | nil,
        tweet_id: String | nil
      }
    end
  end
end
