# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::WebhooksTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.webhooks.create(
        event_types: [:"tweet.new", :"tweet.reply"],
        url: "https://example.com/webhook"
      )

    assert_pattern do
      response => XTwitterScraper::Models::WebhookCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType]),
        secret: String,
        url: String
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.webhooks.update("id")

    assert_pattern do
      response => XTwitterScraper::Webhook
    end

    assert_pattern do
      response => {
        id: String,
        consecutive_failures: Integer,
        created_at: Time,
        delivery_status: XTwitterScraper::Webhook::DeliveryStatus,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType]),
        failure_hard_cap: Integer,
        is_active: XTwitterScraper::Internal::Type::Boolean,
        url: String
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.webhooks.list

    assert_pattern do
      response => XTwitterScraper::Models::WebhookListResponse
    end

    assert_pattern do
      response => {
        webhooks: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Webhook])
      }
    end
  end

  def test_deactivate
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.webhooks.deactivate("id")

    assert_pattern do
      response => XTwitterScraper::Models::WebhookDeactivateResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end

  def test_list_deliveries
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.webhooks.list_deliveries("id")

    assert_pattern do
      response => XTwitterScraper::Models::WebhookListDeliveriesResponse
    end

    assert_pattern do
      response => {
        deliveries: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Delivery])
      }
    end
  end

  def test_resume
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.webhooks.resume("id")

    assert_pattern do
      response => XTwitterScraper::Models::WebhookResumeResponse
    end

    assert_pattern do
      response => {
        status_code: Integer,
        success: XTwitterScraper::Internal::Type::Boolean,
        webhook: XTwitterScraper::Webhook
      }
    end
  end

  def test_test_
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.webhooks.test_("id")

    assert_pattern do
      response => XTwitterScraper::Models::WebhookTestResponse
    end

    assert_pattern do
      response => {
        status_code: Integer,
        success: XTwitterScraper::Internal::Type::Boolean,
        error: String | nil
      }
    end
  end
end
