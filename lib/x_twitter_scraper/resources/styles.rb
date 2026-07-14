# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # AI tweet composition, drafts, writing styles, and radar
    class Styles
      # Get cached style profile
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Style profile ID or X username
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::StyleProfile]
      #
      # @see XTwitterScraper::Models::StyleRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["styles/%1$s", id],
          model: XTwitterScraper::StyleProfile,
          options: params[:request_options]
        )
      end

      # Save style profile with custom tweets
      #
      # @overload update(id, label:, tweets:, request_options: {})
      #
      # @param id [String] Style profile ID or X username
      #
      # @param label [String] Display label for the style
      #
      # @param tweets [Array<XTwitterScraper::Models::StyleUpdateParams::Tweet>] Array of tweet objects
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::StyleProfile]
      #
      # @see XTwitterScraper::Models::StyleUpdateParams
      def update(id, params)
        parsed, options = XTwitterScraper::StyleUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["styles/%1$s", id],
          body: parsed,
          model: XTwitterScraper::StyleProfile,
          options: options
        )
      end

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

      # Delete a style profile
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] Style profile ID or X username
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see XTwitterScraper::Models::StyleDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["styles/%1$s", id],
          model: NilClass,
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
      # @return [XTwitterScraper::Models::StyleProfile]
      #
      # @see XTwitterScraper::Models::StyleAnalyzeParams
      def analyze(params)
        parsed, options = XTwitterScraper::StyleAnalyzeParams.dump_request(params)
        @client.request(
          method: :post,
          path: "styles",
          body: parsed,
          model: XTwitterScraper::StyleProfile,
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

      # Get engagement metrics for style tweets
      #
      # @overload get_performance(id, request_options: {})
      #
      # @param id [String] Style profile ID or X username
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::StyleGetPerformanceResponse]
      #
      # @see XTwitterScraper::Models::StyleGetPerformanceParams
      def get_performance(id, params = {})
        @client.request(
          method: :get,
          path: ["styles/%1$s/performance", id],
          model: XTwitterScraper::Models::StyleGetPerformanceResponse,
          options: params[:request_options]
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
