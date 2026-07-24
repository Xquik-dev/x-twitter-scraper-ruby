# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::ExtractionsTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve
    response = @x_twitter_scraper.extractions.retrieve("id")

    assert_pattern do
      response => XTwitterScraper::Models::ExtractionRetrieveResponse
    end

    assert_pattern do
      response => {
        has_more: XTwitterScraper::Internal::Type::Boolean,
        job: ^(XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]),
        results: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]]),
        next_cursor: String | nil
      }
    end
  end

  def test_list
    response = @x_twitter_scraper.extractions.list

    assert_pattern do
      response => XTwitterScraper::Models::ExtractionListResponse
    end

    assert_pattern do
      response => {
        extractions: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::ExtractionJob]),
        has_more: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String | nil
      }
    end
  end

  def test_estimate_cost_required_params
    response = @x_twitter_scraper.extractions.estimate_cost(tool_type: :follower_explorer)

    assert_pattern do
      response => XTwitterScraper::Models::ExtractionEstimateCostResponse
    end

    assert_pattern do
      response => {
        allowed: XTwitterScraper::Internal::Type::Boolean,
        credits_available: String,
        credits_required: String,
        estimated_results: Integer,
        source: XTwitterScraper::Models::ExtractionEstimateCostResponse::Source,
        resolved_x_user_id: String | nil
      }
    end
  end

  def test_export_results_required_params
    response = @x_twitter_scraper.extractions.export_results("id", format_: :csv)

    assert_pattern do
      response => StringIO
    end
  end

  def test_run_required_params
    response = @x_twitter_scraper.extractions.run(tool_type: :follower_explorer)

    assert_pattern do
      response => XTwitterScraper::Models::ExtractionRunResponse
    end

    assert_pattern do
      response => {
        id: String,
        status: Symbol,
        tool_type: XTwitterScraper::Models::ExtractionRunResponse::ToolType
      }
    end
  end
end
