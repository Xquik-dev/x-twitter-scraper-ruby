# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::RadarTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve_trending_topics
    response = @x_twitter_scraper.radar.retrieve_trending_topics

    assert_pattern do
      response => XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse
    end

    assert_pattern do
      response => {
        has_more: XTwitterScraper::Internal::Type::Boolean,
        items: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::RadarItem]),
        next_cursor: String | nil
      }
    end
  end
end
