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
        automated_by: String | nil,
        can_dm: XTwitterScraper::Internal::Type::Boolean | nil,
        community_role: String | nil,
        cover_picture: String | nil,
        created_at: String | nil,
        description: String | nil,
        favourites_count: Integer | nil,
        followers: Integer | nil,
        following: Integer | nil,
        has_custom_timelines: XTwitterScraper::Internal::Type::Boolean | nil,
        is_automated: XTwitterScraper::Internal::Type::Boolean | nil,
        is_blue_verified: XTwitterScraper::Internal::Type::Boolean | nil,
        is_translator: XTwitterScraper::Internal::Type::Boolean | nil,
        is_verified: XTwitterScraper::Internal::Type::Boolean | nil,
        location: String | nil,
        media_count: Integer | nil,
        pinned_tweet_ids: ^(XTwitterScraper::Internal::Type::ArrayOf[String]) | nil,
        possibly_sensitive: XTwitterScraper::Internal::Type::Boolean | nil,
        profile_bio: ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]) | nil,
        profile_banner_url: String | nil,
        profile_picture: String | nil,
        protected: XTwitterScraper::Internal::Type::Boolean | nil,
        statuses_count: Integer | nil,
        unavailable: XTwitterScraper::Internal::Type::Boolean | nil,
        unavailable_reason: String | nil,
        url: String | nil,
        verified: XTwitterScraper::Internal::Type::Boolean | nil,
        verified_type: String | nil,
        viewer_followed_by: XTwitterScraper::Internal::Type::Boolean | nil,
        viewer_following: XTwitterScraper::Internal::Type::Boolean | nil,
        withheld_in_countries: ^(XTwitterScraper::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_remove_follower_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.remove_follower("id", account: "@elonmusk")

    assert_pattern do
      response => XTwitterScraper::Models::X::UserRemoveFollowerResponse
    end

    assert_pattern do
      response => {
        success: true | false
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
end
