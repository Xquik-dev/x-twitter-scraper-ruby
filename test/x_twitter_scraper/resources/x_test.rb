# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::XTest < XTwitterScraper::Test::ResourceTest
  def test_get_article
    response = @x_twitter_scraper.x.get_article("tweetId")

    assert_pattern do
      response => XTwitterScraper::Models::XGetArticleResponse
    end

    assert_pattern do
      response => {
        article: XTwitterScraper::Models::XGetArticleResponse::Article,
        author: XTwitterScraper::Models::XGetArticleResponse::Author | nil
      }
    end
  end

  def test_get_home_timeline
    response = @x_twitter_scraper.x.get_home_timeline

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

  def test_get_notifications
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
    response = @x_twitter_scraper.x.get_trends

    assert_pattern do
      response => XTwitterScraper::Models::XGetTrendsResponse
    end

    assert_pattern do
      response => {
        count: Integer,
        trends: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XGetTrendsResponse::Trend]),
        woeid: Integer
      }
    end
  end
end
