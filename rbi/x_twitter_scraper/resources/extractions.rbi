# typed: strong

module XTwitterScraper
  module Resources
    # Bulk data extraction (20 tool types)
    class Extractions
      # Get extraction results
      sig do
        params(
          id: String,
          after: String,
          limit: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ExtractionRetrieveResponse)
      end
      def retrieve(
        # Extraction public ID (UUID)
        id,
        # Cursor for pagination
        after: nil,
        limit: nil,
        request_options: {}
      )
      end

      # List extraction jobs
      sig do
        params(
          after: String,
          limit: Integer,
          status: XTwitterScraper::ExtractionListParams::Status::OrSymbol,
          tool_type: XTwitterScraper::ExtractionListParams::ToolType::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ExtractionListResponse)
      end
      def list(
        # Cursor for pagination
        after: nil,
        limit: nil,
        status: nil,
        tool_type: nil,
        request_options: {}
      )
      end

      # Estimate extraction cost
      sig do
        params(
          tool_type:
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::OrSymbol,
          advanced_query: String,
          exact_phrase: String,
          exclude_words: String,
          search_query: String,
          target_community_id: String,
          target_list_id: String,
          target_space_id: String,
          target_tweet_id: String,
          target_username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ExtractionEstimateCostResponse)
      end
      def estimate_cost(
        tool_type:,
        # Raw advanced search query appended as-is (tweet_search_extractor)
        advanced_query: nil,
        # Exact phrase to match (tweet_search_extractor)
        exact_phrase: nil,
        # Words to exclude from results (tweet_search_extractor)
        exclude_words: nil,
        search_query: nil,
        target_community_id: nil,
        target_list_id: nil,
        target_space_id: nil,
        target_tweet_id: nil,
        target_username: nil,
        request_options: {}
      )
      end

      # Export extraction results
      sig do
        params(
          id: String,
          format_:
            XTwitterScraper::ExtractionExportResultsParams::Format::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def export_results(
        # Extraction public ID
        id,
        format_: nil,
        request_options: {}
      )
      end

      # Run extraction
      sig do
        params(
          tool_type: XTwitterScraper::ExtractionRunParams::ToolType::OrSymbol,
          advanced_query: String,
          exact_phrase: String,
          exclude_words: String,
          search_query: String,
          target_community_id: String,
          target_list_id: String,
          target_space_id: String,
          target_tweet_id: String,
          target_username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ExtractionRunResponse)
      end
      def run(
        tool_type:,
        # Raw advanced search query appended as-is (tweet_search_extractor)
        advanced_query: nil,
        # Exact phrase to match (tweet_search_extractor)
        exact_phrase: nil,
        # Words to exclude from results (tweet_search_extractor)
        exclude_words: nil,
        search_query: nil,
        target_community_id: nil,
        target_list_id: nil,
        target_space_id: nil,
        target_tweet_id: nil,
        target_username: nil,
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
