# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::TrendsTest < XTwitterScraper::Test::ResourceTest
  def test_list
    response = @x_twitter_scraper.trends.list

    assert_pattern do
      response => XTwitterScraper::Models::TrendListResponse
    end

    assert_pattern do
      response => {
        total: Integer,
        trends: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::TrendListResponse::Trend]),
        woeid: Integer
      }
    end
  end
end
