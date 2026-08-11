# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::UsersTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve("id")

    assert_pattern do
      response => XTwitterScraper::UserProfile
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        username: String,
        affiliates_highlighted_label: XTwitterScraper::UserProfile::AffiliatesHighlightedLabel | nil,
        automated_by: String | nil,
        business_account_affiliates_count: Integer | nil,
        community_role: String | nil,
        cover_picture: String | nil,
        created_at: String | nil,
        creator_subscriptions_count: Integer | nil,
        description: String | nil,
        favourites_count: Integer | nil,
        followers: Integer | nil,
        following: Integer | nil,
        has_custom_timelines: XTwitterScraper::Internal::Type::Boolean | nil,
        has_graduated_access: XTwitterScraper::Internal::Type::Boolean | nil,
        has_hidden_subscriptions_on_profile: XTwitterScraper::Internal::Type::Boolean | nil,
        highlights_info: XTwitterScraper::UserProfile::HighlightsInfo | nil,
        identity_verification: XTwitterScraper::UserProfile::IdentityVerification | nil,
        is_automated: XTwitterScraper::Internal::Type::Boolean | nil,
        is_blue_verified: XTwitterScraper::Internal::Type::Boolean | nil,
        is_profile_translatable: XTwitterScraper::Internal::Type::Boolean | nil,
        is_translator: XTwitterScraper::Internal::Type::Boolean | nil,
        is_verified: XTwitterScraper::Internal::Type::Boolean | nil,
        location: String | nil,
        media_count: Integer | nil,
        parody_commentary_fan_label: String | nil,
        pinned_tweet_ids: ^(XTwitterScraper::Internal::Type::ArrayOf[String]) | nil,
        possibly_sensitive: XTwitterScraper::Internal::Type::Boolean | nil,
        profile_bio: ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]) | nil,
        profile_banner_url: String | nil,
        profile_description_language: String | nil,
        profile_image_shape: String | nil,
        profile_interstitial_type: String | nil,
        profile_picture: String | nil,
        profile_sort_enabled: XTwitterScraper::Internal::Type::Boolean | nil,
        profile_translator_type: String | nil,
        protected: XTwitterScraper::Internal::Type::Boolean | nil,
        statuses_count: Integer | nil,
        super_follow_eligible: XTwitterScraper::Internal::Type::Boolean | nil,
        unavailable: XTwitterScraper::Internal::Type::Boolean | nil,
        unavailable_reason: String | nil,
        url: String | nil,
        verified: XTwitterScraper::Internal::Type::Boolean | nil,
        verified_type: String | nil,
        withheld_in_countries: ^(XTwitterScraper::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_remove_follower_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.x.users.remove_follower(
        "id",
        account: "@elonmusk",
        idempotency_key: "Idempotency-Key"
      )

    assert_pattern do
      response => XTwitterScraper::Models::X::UserRemoveFollowerResponse
    end

    assert_pattern do
      response => {
        id: String,
        account: XTwitterScraper::Models::X::UserRemoveFollowerResponse::Account | nil,
        action: XTwitterScraper::Models::X::UserRemoveFollowerResponse::Action,
        billing: XTwitterScraper::Models::X::UserRemoveFollowerResponse::Billing,
        charged: XTwitterScraper::Internal::Type::Boolean,
        charged_credits: String,
        next_action: XTwitterScraper::Models::X::UserRemoveFollowerResponse::NextAction | nil,
        object: Symbol,
        poll_after_ms: Integer | nil,
        request: XTwitterScraper::Models::X::UserRemoveFollowerResponse::Request,
        result: XTwitterScraper::Models::X::UserRemoveFollowerResponse::Result | nil,
        retryable: XTwitterScraper::Internal::Type::Boolean,
        safe_to_retry: XTwitterScraper::Internal::Type::Boolean,
        send_dispatched: XTwitterScraper::Internal::Type::Boolean,
        status: XTwitterScraper::Models::X::UserRemoveFollowerResponse::Status,
        status_url: String,
        success: XTwitterScraper::Internal::Type::Boolean,
        target: XTwitterScraper::Models::X::UserRemoveFollowerResponse::Target | nil,
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

  def test_retrieve_batch_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_batch(ids: "ids")

    assert_pattern do
      response => XTwitterScraper::Models::X::UserRetrieveBatchResponse
    end

    assert_pattern do
      response => {
        has_next_page: true | false,
        next_cursor: String,
        processed_count: Integer,
        requested_count: Integer,
        returned_count: Integer,
        unavailable_ids: ^(XTwitterScraper::Internal::Type::ArrayOf[String]),
        unprocessed_ids: ^(XTwitterScraper::Internal::Type::ArrayOf[String]),
        users: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::UserProfile])
      }
    end
  end

  def test_retrieve_followers
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_followers("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::UserRetrieveFollowersResponse
    end

    assert_pattern do
      case response
      in XTwitterScraper::PaginatedUsers
      in XTwitterScraper::Models::X::UserRetrieveFollowersResponse::UserListCoverageResponse
      end
    end
  end

  def test_retrieve_followers_you_know
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_followers_you_know("id")

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

  def test_retrieve_following
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_following("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::UserRetrieveFollowingResponse
    end

    assert_pattern do
      case response
      in XTwitterScraper::PaginatedUsers
      in XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse
      end
    end
  end

  def test_retrieve_likes
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_likes("id")

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

  def test_retrieve_media
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_media("id")

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

  def test_retrieve_mentions
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_mentions("id")

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

  def test_retrieve_replies
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_replies("id")

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

  def test_retrieve_search_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_search(q: "q")

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

  def test_retrieve_tweets
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_tweets("id")

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

  def test_retrieve_verified_followers
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_verified_followers("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersResponse
    end

    assert_pattern do
      case response
      in XTwitterScraper::PaginatedUsers
      in XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersResponse::UserListCoverageResponse
      end
    end
  end
end
