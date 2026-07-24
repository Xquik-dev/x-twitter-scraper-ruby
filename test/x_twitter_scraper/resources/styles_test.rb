# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::StylesTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve
    response = @x_twitter_scraper.styles.retrieve("id")

    assert_pattern do
      response => XTwitterScraper::StyleProfile
    end

    assert_pattern do
      response => {
        fetched_at: Time,
        is_own_account: XTwitterScraper::Internal::Type::Boolean,
        tweet_count: Integer,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::StyleProfile::Tweet]),
        x_username: String
      }
    end
  end

  def test_update_required_params
    response =
      @x_twitter_scraper.styles.update(
        "id",
        label: "Professional Voice",
        tweets: [{text: "Excited to share our latest research findings."}]
      )

    assert_pattern do
      response => XTwitterScraper::StyleProfile
    end

    assert_pattern do
      response => {
        fetched_at: Time,
        is_own_account: XTwitterScraper::Internal::Type::Boolean,
        tweet_count: Integer,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::StyleProfile::Tweet]),
        x_username: String
      }
    end
  end

  def test_list
    response = @x_twitter_scraper.styles.list

    assert_pattern do
      response => XTwitterScraper::Models::StyleListResponse
    end

    assert_pattern do
      response => {
        styles: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::StyleProfileSummary])
      }
    end
  end

  def test_delete
    response = @x_twitter_scraper.styles.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_analyze_required_params
    response = @x_twitter_scraper.styles.analyze(username: "elonmusk")

    assert_pattern do
      response => XTwitterScraper::StyleProfile
    end

    assert_pattern do
      response => {
        fetched_at: Time,
        is_own_account: XTwitterScraper::Internal::Type::Boolean,
        tweet_count: Integer,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::StyleProfile::Tweet]),
        x_username: String
      }
    end
  end

  def test_compare_required_params
    response = @x_twitter_scraper.styles.compare(username1: "username1", username2: "username2")

    assert_pattern do
      response => XTwitterScraper::Models::StyleCompareResponse
    end

    assert_pattern do
      response => {
        style1: XTwitterScraper::StyleProfile,
        style2: XTwitterScraper::StyleProfile
      }
    end
  end

  def test_get_performance
    response = @x_twitter_scraper.styles.get_performance("id")

    assert_pattern do
      response => XTwitterScraper::Models::StyleGetPerformanceResponse
    end

    assert_pattern do
      response => {
        tweet_count: Integer,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::StyleGetPerformanceResponse::Tweet]),
        x_username: String
      }
    end
  end
end
