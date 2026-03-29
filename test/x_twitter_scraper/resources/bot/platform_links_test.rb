# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::Bot::PlatformLinksTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.bot.platform_links.create(platform: :telegram, platform_user_id: "platformUserId")

    assert_pattern do
      response => XTwitterScraper::Models::Bot::PlatformLinkCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        platform: String,
        platform_user_id: String
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.bot.platform_links.delete(platform: :telegram, platform_user_id: "platformUserId")

    assert_pattern do
      response => XTwitterScraper::Models::Bot::PlatformLinkDeleteResponse
    end

    assert_pattern do
      response => {
        success: XTwitterScraper::Internal::Type::Boolean | nil
      }
    end
  end

  def test_lookup_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.bot.platform_links.lookup(platform: "platform", platform_user_id: "platformUserId")

    assert_pattern do
      response => XTwitterScraper::Models::Bot::PlatformLinkLookupResponse
    end

    assert_pattern do
      response => {
        user_id: String
      }
    end
  end
end
