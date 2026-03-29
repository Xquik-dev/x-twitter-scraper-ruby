# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::UsersTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve("username")

    assert_pattern do
      response => XTwitterScraper::Models::X::UserRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        username: String,
        created_at: String | nil,
        description: String | nil,
        followers: Integer | nil,
        following: Integer | nil,
        location: String | nil,
        profile_picture: String | nil,
        statuses_count: Integer | nil,
        verified: XTwitterScraper::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve_batch_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_batch(ids: "ids")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_followers
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_followers("id")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_followers_you_know
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_followers_you_know("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::UserRetrieveFollowersYouKnowResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        users: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Internal::Type::Unknown])
      }
    end
  end

  def test_retrieve_following
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_following("id")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_likes
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_likes("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::UserRetrieveLikesResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::UserRetrieveLikesResponse::Tweet])
      }
    end
  end

  def test_retrieve_media
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_media("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::UserRetrieveMediaResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::UserRetrieveMediaResponse::Tweet])
      }
    end
  end

  def test_retrieve_mentions
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_mentions("id")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_search_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_search(q: "q")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_tweets
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_tweets("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::UserRetrieveTweetsResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::UserRetrieveTweetsResponse::Tweet])
      }
    end
  end

  def test_retrieve_verified_followers
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.retrieve_verified_followers("id")

    assert_pattern do
      response => nil
    end
  end
end
