# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::DrawsTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.draws.retrieve("id")

    assert_pattern do
      response => XTwitterScraper::Models::DrawRetrieveResponse
    end

    assert_pattern do
      response => {
        draw: XTwitterScraper::Models::DrawRetrieveResponse::Draw,
        winners: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::DrawRetrieveResponse::Winner])
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.draws.list

    assert_pattern do
      response => XTwitterScraper::Models::DrawListResponse
    end

    assert_pattern do
      response => {
        draws: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::DrawListResponse::Draw]),
        has_more: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String | nil
      }
    end
  end

  def test_export
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.draws.export("id")

    assert_pattern do
      response => StringIO
    end
  end

  def test_run_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.draws.run(tweet_url: "https://example.com")

    assert_pattern do
      response => XTwitterScraper::Models::DrawRunResponse
    end

    assert_pattern do
      response => {
        id: String,
        total_entries: Integer,
        tweet_id: String,
        valid_entries: Integer,
        winners: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::DrawRunResponse::Winner])
      }
    end
  end
end
