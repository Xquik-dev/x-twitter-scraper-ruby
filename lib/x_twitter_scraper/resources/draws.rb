# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Giveaway draws from tweet replies
    class Draws
      # Get draw details
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::DrawRetrieveResponse]
      #
      # @see XTwitterScraper::Models::DrawRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["draws/%1$s", id],
          model: XTwitterScraper::Models::DrawRetrieveResponse,
          options: params[:request_options]
        )
      end

      # List draws
      #
      # @overload list(after: nil, limit: nil, request_options: {})
      #
      # @param after [String] Cursor for keyset pagination
      #
      # @param limit [Integer] Maximum number of items to return (1-100, default 50)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::DrawListResponse]
      #
      # @see XTwitterScraper::Models::DrawListParams
      def list(params = {})
        parsed, options = XTwitterScraper::DrawListParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "draws",
          query: query,
          model: XTwitterScraper::Models::DrawListResponse,
          options: options
        )
      end

      # Export draw data
      #
      # @overload export(id, format_: nil, type: nil, request_options: {})
      #
      # @param id [String] Resource ID (stringified bigint)
      #
      # @param format_ [Symbol, XTwitterScraper::Models::DrawExportParams::Format] Export output format
      #
      # @param type [Symbol, XTwitterScraper::Models::DrawExportParams::Type] Export winners or all entries
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see XTwitterScraper::Models::DrawExportParams
      def export(id, params = {})
        parsed, options = XTwitterScraper::DrawExportParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["draws/%1$s/export", id],
          query: query.transform_keys(format_: "format"),
          headers: {"accept" => "application/octet-stream"},
          model: StringIO,
          options: options
        )
      end

      # Run giveaway draw
      #
      # @overload run(tweet_url:, backup_count: nil, filter_account_age_days: nil, filter_language: nil, filter_min_followers: nil, must_follow_username: nil, must_retweet: nil, required_hashtags: nil, required_keywords: nil, required_mentions: nil, unique_authors_only: nil, winner_count: nil, request_options: {})
      #
      # @param tweet_url [String]
      # @param backup_count [Integer]
      # @param filter_account_age_days [Integer]
      # @param filter_language [String]
      # @param filter_min_followers [Integer]
      # @param must_follow_username [String]
      # @param must_retweet [Boolean]
      # @param required_hashtags [Array<String>]
      # @param required_keywords [Array<String>]
      # @param required_mentions [Array<String>]
      # @param unique_authors_only [Boolean]
      # @param winner_count [Integer]
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::DrawRunResponse]
      #
      # @see XTwitterScraper::Models::DrawRunParams
      def run(params)
        parsed, options = XTwitterScraper::DrawRunParams.dump_request(params)
        @client.request(
          method: :post,
          path: "draws",
          body: parsed,
          model: XTwitterScraper::Models::DrawRunResponse,
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
