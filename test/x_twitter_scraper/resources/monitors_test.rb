# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::MonitorsTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.monitors.create(
        event_types: [:"tweet.new", :"follower.gained"],
        username: "elonmusk"
      )

    assert_pattern do
      response => XTwitterScraper::Models::MonitorCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::MonitorCreateResponse::EventType]),
        username: String,
        x_user_id: String
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.monitors.retrieve("id")

    assert_pattern do
      response => XTwitterScraper::Models::MonitorRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::MonitorRetrieveResponse::EventType]),
        is_active: XTwitterScraper::Internal::Type::Boolean,
        username: String,
        x_user_id: String
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.monitors.update("id")

    assert_pattern do
      response => XTwitterScraper::Models::MonitorUpdateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::MonitorUpdateResponse::EventType]),
        is_active: XTwitterScraper::Internal::Type::Boolean,
        username: String,
        x_user_id: String
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.monitors.list

    assert_pattern do
      response => XTwitterScraper::Models::MonitorListResponse
    end

    assert_pattern do
      response => {
        monitors: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::MonitorListResponse::Monitor]),
        total: Integer
      }
    end
  end

  def test_deactivate
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.monitors.deactivate("id")

    assert_pattern do
      response => XTwitterScraper::Models::MonitorDeactivateResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end
end
