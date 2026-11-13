# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::AnalysisTest < XTwitterScraper::Test::ResourceTest
  [:brand, :classify, :market_signals, :news, :sentiment, :viral_score].each do |method|
    define_method(:"test_#{method}") do
      response = @x_twitter_scraper.x.analysis.public_send(method, topic: "the Rust programming language")

      assert_pattern do
        response => XTwitterScraper::Models::TweetAnalysisPage
      end

      assert_pattern do
        response => {
          results: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetAnalysisPage::Result]),
          unanalyzed: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetAnalysisPage::Unanalyzed]),
          analysis_summary: XTwitterScraper::TweetAnalysisPage::AnalysisSummary,
          has_next_page: XTwitterScraper::Internal::Type::Boolean,
          next_cursor: String,
          topic_filter: XTwitterScraper::TopicFilterSummary | nil,
          image_filter: XTwitterScraper::ImageFilterSummary | nil
        }
      end
    end
  end
end
