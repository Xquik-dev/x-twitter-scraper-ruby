# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::Monitors::KeywordsTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.monitors.keywords.create(event_types: [:"tweet.new"], query: "xquik OR \"x api\"")

    assert_pattern do
      response => XTwitterScraper::Models::Monitors::KeywordCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType]),
        is_active: XTwitterScraper::Internal::Type::Boolean,
        next_billing_at: Time,
        query: String
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.monitors.keywords.retrieve("id")

    assert_pattern do
      response => XTwitterScraper::Models::Monitors::KeywordRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType]),
        is_active: XTwitterScraper::Internal::Type::Boolean,
        next_billing_at: Time,
        query: String
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.monitors.keywords.update("id")

    assert_pattern do
      response => XTwitterScraper::Models::Monitors::KeywordUpdateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType]),
        is_active: XTwitterScraper::Internal::Type::Boolean,
        next_billing_at: Time,
        query: String
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.monitors.keywords.list

    assert_pattern do
      response => XTwitterScraper::Models::Monitors::KeywordListResponse
    end

    assert_pattern do
      response => {
        monitors: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Monitors::KeywordListResponse::Monitor]),
        total: Integer
      }
    end
  end

  def test_deactivate
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.monitors.keywords.deactivate("id")

    assert_pattern do
      response => XTwitterScraper::Models::Monitors::KeywordDeactivateResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end
end
