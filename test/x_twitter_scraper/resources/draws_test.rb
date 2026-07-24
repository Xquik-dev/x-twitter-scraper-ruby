# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::DrawsTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve
    response = @x_twitter_scraper.draws.retrieve("f4bd00a2-7b4e-4e59-8e1b-72e2c9f12345")

    assert_pattern do
      response => XTwitterScraper::Models::DrawRetrieveResponse
    end

    assert_pattern do
      response => {
        draw: XTwitterScraper::DrawDetail,
        winners: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Winner])
      }
    end
  end

  def test_list
    response = @x_twitter_scraper.draws.list

    assert_pattern do
      response => XTwitterScraper::Models::DrawListResponse
    end

    assert_pattern do
      response => {
        draws: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::DrawListItem]),
        has_more: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String | nil
      }
    end
  end

  def test_export_required_params
    response = @x_twitter_scraper.draws.export("f4bd00a2-7b4e-4e59-8e1b-72e2c9f12345", format_: :csv)

    assert_pattern do
      response => StringIO
    end
  end

  def test_run_required_params
    response = @x_twitter_scraper.draws.run(tweet_url: "https://x.com/elonmusk/status/1234567890")

    assert_pattern do
      response => XTwitterScraper::Models::DrawRunResponse
    end

    assert_pattern do
      response => {
        id: String,
        total_entries: Integer,
        tweet_id: String,
        valid_entries: Integer,
        winners: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Winner])
      }
    end
  end
end
