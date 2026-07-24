# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    # AI tweet composition, drafts, writing styles, and radar
    class Radar
      # Get trending topics from curated sources
      sig do
        params(
          after: String,
          category:
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category::OrSymbol,
          hours: Integer,
          limit: Integer,
          region: String,
          source:
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse)
      end
      def retrieve_trending_topics(
        # Cursor for pagination (from prior response nextCursor).
        after: nil,
        # Filter by category.
        category: nil,
        # Lookback window in hours (1-72, default 6).
        hours: nil,
        # Number of items to return (1-100, default 50).
        limit: nil,
        # Region filter. Use `global` or a region code such as `US`, `GB`, `TR`, or `ES`.
        region: nil,
        # Source filter. One of: github, google_trends, hacker_news, polymarket, reddit,
        # trustmrr, wikipedia
        source: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
