# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::MonitorsTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    response =
      @x_twitter_scraper.monitors.create(event_types: [:"tweet.new", :"tweet.reply"], username: "elonmusk")

    assert_pattern do
      response => XTwitterScraper::Models::MonitorCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType]),
        is_active: XTwitterScraper::Internal::Type::Boolean,
        next_billing_at: Time,
        username: String,
        x_user_id: String
      }
    end
  end

  def test_retrieve
    response = @x_twitter_scraper.monitors.retrieve("id")

    assert_pattern do
      response => XTwitterScraper::Monitor
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType]),
        is_active: XTwitterScraper::Internal::Type::Boolean,
        next_billing_at: Time,
        username: String,
        x_user_id: String
      }
    end
  end

  def test_update
    response = @x_twitter_scraper.monitors.update("id")

    assert_pattern do
      response => XTwitterScraper::Monitor
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        event_types: ^(XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType]),
        is_active: XTwitterScraper::Internal::Type::Boolean,
        next_billing_at: Time,
        username: String,
        x_user_id: String
      }
    end
  end

  def test_list
    response = @x_twitter_scraper.monitors.list

    assert_pattern do
      response => XTwitterScraper::Models::MonitorListResponse
    end

    assert_pattern do
      response => {
        monitors: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Monitor]),
        total: Integer
      }
    end
  end

  def test_deactivate
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
