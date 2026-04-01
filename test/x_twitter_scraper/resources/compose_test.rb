# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::ComposeTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.compose.create(step: :compose)

    assert_pattern do
      response => XTwitterScraper::Models::ComposeCreateResponse
    end

    assert_pattern do
      response => {
        feedback: String | nil,
        score: Float | nil,
        suggestions: ^(XTwitterScraper::Internal::Type::ArrayOf[String]) | nil,
        text: String | nil
      }
    end
  end
end
