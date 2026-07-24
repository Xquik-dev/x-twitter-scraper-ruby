# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::EventsTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve
    response = @x_twitter_scraper.events.retrieve("id")

    assert_pattern do
      response => XTwitterScraper::EventDetail
    end

    assert_pattern do
      response => {
        id: String,
        data: ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]),
        monitor_id: String,
        monitor_type: XTwitterScraper::EventDetail::MonitorType,
        occurred_at: Time,
        type: XTwitterScraper::EventType,
        keyword_monitor_id: String | nil,
        query: String | nil,
        username: String | nil,
        x_event_id: String | nil
      }
    end
  end

  def test_list
    response = @x_twitter_scraper.events.list

    assert_pattern do
      response => XTwitterScraper::Models::EventListResponse
    end

    assert_pattern do
      response => {
        events: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Event]),
        has_more: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String | nil
      }
    end
  end
end
