# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::SubscribeTest < XTwitterScraper::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.subscribe.create

    assert_pattern do
      response => XTwitterScraper::Models::SubscribeCreateResponse
    end

    assert_pattern do
      response => {
        message: String,
        status: XTwitterScraper::Models::SubscribeCreateResponse::Status,
        url: String
      }
    end
  end
end
