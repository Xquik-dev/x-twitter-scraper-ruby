# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::IntegrationsTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.integrations.create(
        config: {chatId: "chatId"},
        event_types: [:"tweet.new"],
        name: "name",
        type: :telegram
      )

    assert_pattern do
      response => XTwitterScraper::Models::IntegrationCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        config: ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]),
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::IntegrationCreateResponse::EventType]),
        is_active: XTwitterScraper::Internal::Type::Boolean,
        name: String,
        type: XTwitterScraper::Models::IntegrationCreateResponse::Type,
        filters: ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]) | nil,
        message_template: String | nil,
        scope_all_monitors: XTwitterScraper::Internal::Type::Boolean | nil,
        silent_push: XTwitterScraper::Internal::Type::Boolean | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.integrations.retrieve("id")

    assert_pattern do
      response => XTwitterScraper::Models::IntegrationRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        config: ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]),
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::IntegrationRetrieveResponse::EventType]),
        is_active: XTwitterScraper::Internal::Type::Boolean,
        name: String,
        type: XTwitterScraper::Models::IntegrationRetrieveResponse::Type,
        filters: ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]) | nil,
        message_template: String | nil,
        scope_all_monitors: XTwitterScraper::Internal::Type::Boolean | nil,
        silent_push: XTwitterScraper::Internal::Type::Boolean | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.integrations.update("id")

    assert_pattern do
      response => XTwitterScraper::Models::IntegrationUpdateResponse
    end

    assert_pattern do
      response => {
        id: String,
        config: ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]),
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::IntegrationUpdateResponse::EventType]),
        is_active: XTwitterScraper::Internal::Type::Boolean,
        name: String,
        type: XTwitterScraper::Models::IntegrationUpdateResponse::Type,
        filters: ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]) | nil,
        message_template: String | nil,
        scope_all_monitors: XTwitterScraper::Internal::Type::Boolean | nil,
        silent_push: XTwitterScraper::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.integrations.list

    assert_pattern do
      response => XTwitterScraper::Models::IntegrationListResponse
    end

    assert_pattern do
      response => {
        integrations: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::IntegrationListResponse::Integration])
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.integrations.delete("id")

    assert_pattern do
      response => XTwitterScraper::Models::IntegrationDeleteResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end

  def test_list_deliveries
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.integrations.list_deliveries("id")

    assert_pattern do
      response => XTwitterScraper::Models::IntegrationListDeliveriesResponse
    end

    assert_pattern do
      response => {
        deliveries: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::IntegrationListDeliveriesResponse::Delivery])
      }
    end
  end

  def test_send_test
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.integrations.send_test("id")

    assert_pattern do
      response => XTwitterScraper::Models::IntegrationSendTestResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end
end
