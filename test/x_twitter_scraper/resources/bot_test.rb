# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::BotTest < XTwitterScraper::Test::ResourceTest
  def test_track_usage_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.bot.track_usage(
        input_tokens: 0,
        output_tokens: 0,
        platform_user_id: "platformUserId"
      )

    assert_pattern do
      response => XTwitterScraper::Models::BotTrackUsageResponse
    end

    assert_pattern do
      response => {
        success: XTwitterScraper::Internal::Type::Boolean | nil
      }
    end
  end
end
