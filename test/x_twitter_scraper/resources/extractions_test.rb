# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::ExtractionsTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

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
    skip("Mock server tests are disabled")

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
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.extractions.estimate_cost(tool_type: :article_extractor)

    assert_pattern do
      response => XTwitterScraper::Models::ExtractionEstimateCostResponse
    end

    assert_pattern do
      response => {
        allowed: XTwitterScraper::Internal::Type::Boolean,
        estimated_results: Integer,
        projected_percent: Float,
        source: String,
        usage_percent: Float
      }
    end
  end

  def test_export_results
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.extractions.export_results("id")

    assert_pattern do
      response => StringIO
    end
  end

  def test_run_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.extractions.run(tool_type: :article_extractor)

    assert_pattern do
      response => XTwitterScraper::Models::ExtractionRunResponse
    end

    assert_pattern do
      response => {
        id: String,
        status: XTwitterScraper::Models::ExtractionRunResponse::Status,
        tool_type: XTwitterScraper::Models::ExtractionRunResponse::ToolType
      }
    end
  end
end
