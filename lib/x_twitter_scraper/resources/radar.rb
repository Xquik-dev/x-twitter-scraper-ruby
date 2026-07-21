# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # AI tweet composition, drafts, writing styles, and radar
    class Radar
      # Some parameter documentations has been truncated, see
      # {XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams} for more details.
      #
      # Get trending topics from curated sources
      #
      # @overload retrieve_trending_topics(after: nil, category: nil, hours: nil, limit: nil, region: nil, source: nil, request_options: {})
      #
      # @param after [String] Cursor for pagination (from prior response nextCursor).
      #
      # @param category [Symbol, XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams::Category] Filter by category.
      #
      # @param hours [Integer] Lookback window in hours (1-72, default 6).
      #
      # @param limit [Integer] Number of items to return (1-100, default 50).
      #
      # @param region [String] Region filter. Use `global` or a region code such as `US`, `GB`, `TR`, or `ES`.
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
