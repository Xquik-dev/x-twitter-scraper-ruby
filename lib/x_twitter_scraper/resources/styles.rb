# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Tweet composition, drafts, writing styles & radar
    class Styles
      # List cached style profiles
      #
      # @overload list(request_options: {})
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::StyleListResponse]
      #
      # @see XTwitterScraper::Models::StyleListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "styles",
          model: XTwitterScraper::Models::StyleListResponse,
          options: params[:request_options]
        )
      end

      # Analyze writing style from recent tweets
      #
      # @overload analyze(username:, request_options: {})
      #
      # @param username [String] X username to analyze
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::StyleAnalyzeResponse]
      #
      # @see XTwitterScraper::Models::StyleAnalyzeParams
      def analyze(params)
        parsed, options = XTwitterScraper::StyleAnalyzeParams.dump_request(params)
        @client.request(
          method: :post,
          path: "styles",
          body: parsed,
          model: XTwitterScraper::Models::StyleAnalyzeResponse,
          options: options
        )
      end

      # Compare two style profiles
      #
      # @overload compare(username1:, username2:, request_options: {})
      #
      # @param username1 [String] First username to compare
      #
      # @param username2 [String] Second username to compare
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::StyleCompareResponse]
      #
      # @see XTwitterScraper::Models::StyleCompareParams
      def compare(params)
        parsed, options = XTwitterScraper::StyleCompareParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "styles/compare",
          query: query,
          model: XTwitterScraper::Models::StyleCompareResponse,
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
