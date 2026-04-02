# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::TweetsTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.tweets.create(account: "account", text: "text")

    assert_pattern do
      response => XTwitterScraper::Models::X::TweetCreateResponse
    end

    assert_pattern do
      response => {
        success: true | false,
        tweet_id: String
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.tweets.list(ids: "ids")

    assert_pattern do
      response => nil
    end
  end

  def test_get_favoriters
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.tweets.get_favoriters("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::TweetGetFavoritersResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        users: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::TweetGetFavoritersResponse::User])
      }
    end
  end

  def test_get_quotes
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.tweets.get_quotes("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::TweetGetQuotesResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::TweetGetQuotesResponse::Tweet])
      }
    end
  end

  def test_get_replies
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.tweets.get_replies("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::TweetGetRepliesResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::TweetGetRepliesResponse::Tweet])
      }
    end
  end

  def test_get_retweeters
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.tweets.get_retweeters("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::TweetGetRetweetersResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        users: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::TweetGetRetweetersResponse::User])
      }
    end
  end

  def test_get_thread
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.tweets.get_thread("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::TweetGetThreadResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::TweetGetThreadResponse::Tweet])
      }
    end
  end

  def test_search_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.tweets.search(q: "q")

    assert_pattern do
      response => XTwitterScraper::Models::X::TweetSearchResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::TweetSearchResponse::Tweet])
      }
    end
  end
end
