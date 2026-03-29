# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::TrendsTest < XTwitterScraper::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.trends.list

    assert_pattern do
      response => XTwitterScraper::Models::TrendListResponse
    end

    assert_pattern do
      response => {
        total: Integer,
        trends: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::TrendListResponse::Trend]),
        woeid: Integer
      }
    end
  end
end
