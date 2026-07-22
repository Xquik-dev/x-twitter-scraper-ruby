# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::ComposeTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.compose.create(body: {step: :compose, topic: "PostgreSQL query planning"})

    assert_pattern do
      response => XTwitterScraper::Models::ComposeCreateResponse
    end

    assert_pattern do
      case response
      in XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult
      in XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult
      in XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult
      end
    end
  end
end
