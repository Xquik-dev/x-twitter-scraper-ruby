# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Tweet composition, drafts, writing styles & radar
    class Radar
      # Some parameter documentations has been truncated, see
      # {XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams} for more details.
      #
      # Get trending topics from curated sources
      #
      # @overload retrieve_trending_topics(category: nil, count: nil, hours: nil, region: nil, source: nil, request_options: {})
      #
      # @param category [String] Filter by category (general, tech, dev, etc.)
      #
      # @param count [Integer] Number of items to return
      #
      # @param hours [Integer] Lookback window in hours
      #
      # @param region [String] Region filter (us, global, etc.)
      #
      # @param source [Symbol, XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams::Source] Source filter. One of: github, google_trends, hacker_news, polymarket, reddit, t
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse]
      #
      # @see XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams
      def retrieve_trending_topics(params = {})
        parsed, options = XTwitterScraper::RadarRetrieveTrendingTopicsParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "radar",
          query: query,
          model: XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [XTwitterScraper::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
