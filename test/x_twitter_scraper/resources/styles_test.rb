# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::StylesTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.styles.retrieve("username")

    assert_pattern do
      response => XTwitterScraper::Models::StyleRetrieveResponse
    end

    assert_pattern do
      response => {
        fetched_at: Time,
        is_own_account: XTwitterScraper::Internal::Type::Boolean,
        tweet_count: Integer,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::StyleRetrieveResponse::Tweet]),
        x_username: String
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.styles.update("username", label: "label", tweets: [{text: "text"}])

    assert_pattern do
      response => XTwitterScraper::Models::StyleUpdateResponse
    end

    assert_pattern do
      response => {
        fetched_at: Time,
        is_own_account: XTwitterScraper::Internal::Type::Boolean,
        tweet_count: Integer,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::StyleUpdateResponse::Tweet]),
        x_username: String
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.styles.list

    assert_pattern do
      response => XTwitterScraper::Models::StyleListResponse
    end

    assert_pattern do
      response => {
        styles: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::StyleListResponse::Style])
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.styles.delete("username")

    assert_pattern do
      response => nil
    end
  end

  def test_analyze_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.styles.analyze(username: "username")

    assert_pattern do
      response => XTwitterScraper::Models::StyleAnalyzeResponse
    end

    assert_pattern do
      response => {
        fetched_at: Time,
        is_own_account: XTwitterScraper::Internal::Type::Boolean,
        tweet_count: Integer,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::StyleAnalyzeResponse::Tweet]),
        x_username: String
      }
    end
  end

  def test_compare_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.styles.compare(username1: "username1", username2: "username2")

    assert_pattern do
      response => XTwitterScraper::Models::StyleCompareResponse
    end

    assert_pattern do
      response => {
        style1: XTwitterScraper::Models::StyleCompareResponse::Style1,
        style2: XTwitterScraper::Models::StyleCompareResponse::Style2
      }
    end
  end

  def test_get_performance
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.styles.get_performance("username")

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
