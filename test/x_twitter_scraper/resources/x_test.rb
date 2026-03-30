# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::XTest < XTwitterScraper::Test::ResourceTest
  def test_get_article
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.get_article("tweetId")

    assert_pattern do
      response => XTwitterScraper::Models::XGetArticleResponse
    end

    assert_pattern do
      response => {
        article: XTwitterScraper::Models::XGetArticleResponse::Article,
        author: XTwitterScraper::X::TweetAuthor | nil
      }
    end
  end

  def test_get_home_timeline
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.get_home_timeline

    assert_pattern do
      response => XTwitterScraper::PaginatedTweets
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::SearchTweet])
      }
    end
  end

  def test_get_notifications
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.get_notifications

    assert_pattern do
      response => XTwitterScraper::Models::XGetNotificationsResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        notifications: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XGetNotificationsResponse::Notification])
      }
    end
  end

  def test_get_trends
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.get_trends

    assert_pattern do
      response => nil
    end
  end
end
