# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::CommunitiesTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.x.communities.create(
        account: "@elonmusk",
        name: "Example Name",
        idempotency_key: "Idempotency-Key"
      )

    assert_pattern do
      response => XTwitterScraper::Models::X::CommunityCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        account: XTwitterScraper::Models::X::CommunityCreateResponse::Account | nil,
        action: XTwitterScraper::Models::X::CommunityCreateResponse::Action,
        billing: XTwitterScraper::Models::X::CommunityCreateResponse::Billing,
        charged: XTwitterScraper::Internal::Type::Boolean,
        charged_credits: String,
        next_action: XTwitterScraper::Models::X::CommunityCreateResponse::NextAction | nil,
        object: Symbol,
        poll_after_ms: Integer | nil,
        request: XTwitterScraper::Models::X::CommunityCreateResponse::Request,
        result: XTwitterScraper::Models::X::CommunityCreateResponse::Result | nil,
        retryable: XTwitterScraper::Internal::Type::Boolean,
        safe_to_retry: XTwitterScraper::Internal::Type::Boolean,
        send_dispatched: XTwitterScraper::Internal::Type::Boolean,
        status: XTwitterScraper::Models::X::CommunityCreateResponse::Status,
        status_url: String,
        success: XTwitterScraper::Internal::Type::Boolean,
        target: XTwitterScraper::Models::X::CommunityCreateResponse::Target | nil,
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

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.x.communities.delete(
        "id",
        account: "@elonmusk",
        community_name: "Tesla Fans",
        idempotency_key: "Idempotency-Key"
      )

    assert_pattern do
      response => XTwitterScraper::Models::X::CommunityDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        account: XTwitterScraper::Models::X::CommunityDeleteResponse::Account | nil,
        action: XTwitterScraper::Models::X::CommunityDeleteResponse::Action,
        billing: XTwitterScraper::Models::X::CommunityDeleteResponse::Billing,
        charged: XTwitterScraper::Internal::Type::Boolean,
        charged_credits: String,
        next_action: XTwitterScraper::Models::X::CommunityDeleteResponse::NextAction | nil,
        object: Symbol,
        poll_after_ms: Integer | nil,
        request: XTwitterScraper::Models::X::CommunityDeleteResponse::Request,
        result: XTwitterScraper::Models::X::CommunityDeleteResponse::Result | nil,
        retryable: XTwitterScraper::Internal::Type::Boolean,
        safe_to_retry: XTwitterScraper::Internal::Type::Boolean,
        send_dispatched: XTwitterScraper::Internal::Type::Boolean,
        status: XTwitterScraper::Models::X::CommunityDeleteResponse::Status,
        status_url: String,
        success: XTwitterScraper::Internal::Type::Boolean,
        target: XTwitterScraper::Models::X::CommunityDeleteResponse::Target | nil,
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

  def test_retrieve_info
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.retrieve_info("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::CommunityRetrieveInfoResponse
    end

    assert_pattern do
      response => {
        community: XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community
      }
    end
  end

  def test_retrieve_members
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.retrieve_members("id")

    assert_pattern do
      response => XTwitterScraper::PaginatedUsers
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        users: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::UserProfile])
      }
    end
  end

  def test_retrieve_moderators
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.retrieve_moderators("id")

    assert_pattern do
      response => XTwitterScraper::PaginatedUsers
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        users: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::UserProfile])
      }
    end
  end

  def test_retrieve_search_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.retrieve_search(community_id: "321669910225", q: "q")

    assert_pattern do
      response => XTwitterScraper::PaginatedTweets
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::SearchTweet])
      }
    end
  end
end
