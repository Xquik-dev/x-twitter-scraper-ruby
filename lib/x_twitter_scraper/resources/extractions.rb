# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Bulk data extraction (20 tool types)
    class Extractions
      # Get extraction results
      #
      # @overload retrieve(id, after: nil, limit: nil, request_options: {})
      #
      # @param id [String] Extraction public ID (UUID)
      #
      # @param after [String] Cursor for pagination
      #
      # @param limit [Integer]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::ExtractionRetrieveResponse]
      #
      # @see XTwitterScraper::Models::ExtractionRetrieveParams
      def retrieve(id, params = {})
        parsed, options = XTwitterScraper::ExtractionRetrieveParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["extractions/%1$s", id],
          query: query,
          model: XTwitterScraper::Models::ExtractionRetrieveResponse,
          options: options
        )
      end

      # List extraction jobs
      #
      # @overload list(after: nil, limit: nil, status: nil, tool_type: nil, request_options: {})
      #
      # @param after [String] Cursor for pagination
      #
      # @param limit [Integer]
      #
      # @param status [Symbol, XTwitterScraper::Models::ExtractionListParams::Status]
      #
      # @param tool_type [Symbol, XTwitterScraper::Models::ExtractionListParams::ToolType]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::ExtractionListResponse]
      #
      # @see XTwitterScraper::Models::ExtractionListParams
      def list(params = {})
        parsed, options = XTwitterScraper::ExtractionListParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "extractions",
          query: query.transform_keys(tool_type: "toolType"),
          model: XTwitterScraper::Models::ExtractionListResponse,
          options: options
        )
      end

      # Estimate extraction cost
      #
      # @overload estimate_cost(tool_type:, advanced_query: nil, exact_phrase: nil, exclude_words: nil, search_query: nil, target_community_id: nil, target_list_id: nil, target_space_id: nil, target_tweet_id: nil, target_username: nil, request_options: {})
      #
      # @param tool_type [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::ToolType]
      #
      # @param advanced_query [String] Raw advanced search query appended as-is (tweet_search_extractor)
      #
      # @param exact_phrase [String] Exact phrase to match (tweet_search_extractor)
      #
      # @param exclude_words [String] Words to exclude from results (tweet_search_extractor)
      #
      # @param search_query [String]
      #
      # @param target_community_id [String]
      #
      # @param target_list_id [String]
      #
      # @param target_space_id [String]
      #
      # @param target_tweet_id [String]
      #
      # @param target_username [String]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::ExtractionEstimateCostResponse]
      #
      # @see XTwitterScraper::Models::ExtractionEstimateCostParams
      def estimate_cost(params)
        parsed, options = XTwitterScraper::ExtractionEstimateCostParams.dump_request(params)
        @client.request(
          method: :post,
          path: "extractions/estimate",
          body: parsed,
          model: XTwitterScraper::Models::ExtractionEstimateCostResponse,
          options: options
        )
      end

      # Export extraction results
      #
      # @overload export_results(id, format_: nil, request_options: {})
      #
      # @param id [String] Extraction public ID
      #
      # @param format_ [Symbol, XTwitterScraper::Models::ExtractionExportResultsParams::Format]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see XTwitterScraper::Models::ExtractionExportResultsParams
      def export_results(id, params = {})
        parsed, options = XTwitterScraper::ExtractionExportResultsParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["extractions/%1$s/export", id],
          query: query.transform_keys(format_: "format"),
          headers: {"accept" => "application/octet-stream"},
          model: StringIO,
          options: options
        )
      end

      # Run extraction
      #
      # @overload run(tool_type:, advanced_query: nil, exact_phrase: nil, exclude_words: nil, search_query: nil, target_community_id: nil, target_list_id: nil, target_space_id: nil, target_tweet_id: nil, target_username: nil, request_options: {})
      #
      # @param tool_type [Symbol, XTwitterScraper::Models::ExtractionRunParams::ToolType]
      #
      # @param advanced_query [String] Raw advanced search query appended as-is (tweet_search_extractor)
      #
      # @param exact_phrase [String] Exact phrase to match (tweet_search_extractor)
      #
      # @param exclude_words [String] Words to exclude from results (tweet_search_extractor)
      #
      # @param search_query [String]
      #
      # @param target_community_id [String]
      #
      # @param target_list_id [String]
      #
      # @param target_space_id [String]
      #
      # @param target_tweet_id [String]
      #
      # @param target_username [String]
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::ExtractionRunResponse]
      #
      # @see XTwitterScraper::Models::ExtractionRunParams
      def run(params)
        parsed, options = XTwitterScraper::ExtractionRunParams.dump_request(params)
        @client.request(
          method: :post,
          path: "extractions",
          body: parsed,
          model: XTwitterScraper::Models::ExtractionRunResponse,
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
