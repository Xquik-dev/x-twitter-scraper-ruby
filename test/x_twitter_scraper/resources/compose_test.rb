# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::ComposeTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.compose.create(step: :compose)

    assert_pattern do
      response => ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown])
    end
  end
end
