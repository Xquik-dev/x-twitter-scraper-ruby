# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Trending topics and hashtags by region
    class Trends
      # Some parameter documentations has been truncated, see
      # {XTwitterScraper::Models::TrendListParams} for more details.
      #
      # Get trending hashtags and topics by region (alias)
      #
      # @overload list(count: nil, woeid: nil, request_options: {})
      #
      # @param count [Integer] Number of trending topics returned (1-50, default 30)
      #
      # @param woeid [Integer] Region Yahoo WOEID code (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::TrendListResponse]
      #
      # @see XTwitterScraper::Models::TrendListParams
      def list(params = {})
        parsed, options = XTwitterScraper::TrendListParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "trends",
          query: query,
          model: XTwitterScraper::Models::TrendListResponse,
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
