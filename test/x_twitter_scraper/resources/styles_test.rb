# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::StylesTest < XTwitterScraper::Test::ResourceTest
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

  def test_analyze_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.styles.analyze(username: "elonmusk")

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
end
