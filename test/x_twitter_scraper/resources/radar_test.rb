# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::RadarTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve_trending_topics
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.radar.retrieve_trending_topics

    assert_pattern do
      response => XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse
    end

    assert_pattern do
      response => {
        items: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse::Item]),
        total: Integer
      }
    end
  end
end
