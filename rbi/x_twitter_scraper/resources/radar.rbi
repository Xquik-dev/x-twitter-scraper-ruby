# typed: strong

module XTwitterScraper
  module Resources
    # Tweet composition, drafts, writing styles & radar
    class Radar
      # Get trending topics from curated sources
      sig do
        params(
          category: String,
          count: Integer,
          hours: Integer,
          region: String,
          source:
            XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse)
      end
      def retrieve_trending_topics(
        # Filter by category (general, tech, dev, etc.)
        category: nil,
        # Number of items to return
        count: nil,
        # Lookback window in hours
        hours: nil,
        # Region filter (us, global, etc.)
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
