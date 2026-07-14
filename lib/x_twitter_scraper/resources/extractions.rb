# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Bulk data extraction (23 tool types)
    class Extractions
      # Get extraction results
      #
      # @overload retrieve(id, cursor: nil, limit: nil, request_options: {})
      #
      # @param id [String] Extraction public ID (UUID)
      #
      # @param cursor [String] Cursor for keyset pagination from prior response next_cursor
      #
      # @param limit [Integer] Maximum number of results to return (1-1000, default 100)
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

      # Some parameter documentations has been truncated, see
      # {XTwitterScraper::Models::ExtractionListParams} for more details.
      #
      # List extraction jobs
      #
      # @overload list(cursor: nil, limit: nil, status: nil, tool_type: nil, request_options: {})
      #
      # @param cursor [String] Cursor for keyset pagination from prior response next_cursor
      #
      # @param limit [Integer] Maximum number of items to return (1-100, default 50). For paid per-result endpo
      #
      # @param status [Symbol, XTwitterScraper::Models::ExtractionListParams::Status] Filter by job status
      #
      # @param tool_type [Symbol, XTwitterScraper::Models::ExtractionListParams::ToolType] Filter by extraction tool type
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

      # Some parameter documentations has been truncated, see
      # {XTwitterScraper::Models::ExtractionEstimateCostParams} for more details.
      #
      # Estimate extraction cost
      #
      # @overload estimate_cost(tool_type:, advanced_query: nil, any_words: nil, bounding_box: nil, cashtags: nil, conversation_id: nil, exact_phrase: nil, exclude_words: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, list_id: nil, media_type: nil, mentioning: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, place: nil, place_country: nil, point_radius: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, results_limit: nil, retweets: nil, retweets_of_tweet_id: nil, search_query: nil, since_date: nil, target_community_id: nil, target_list_id: nil, target_space_id: nil, target_tweet_id: nil, target_username: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, request_options: {})
      #
      # @param tool_type [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::ToolType] Identifier for the extraction tool used to run a job.
      #
      # @param advanced_query [String] Raw advanced query string appended to the estimate (tweet_search_extractor)
      #
      # @param any_words [String] Alternative words or quoted phrases for estimated results. Separate with spaces,
      #
      # @param bounding_box [String] Geo bounding box used for estimation, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_e
      #
      # @param cashtags [String] Cashtags applied to the estimate, separated by spaces, commas, or lines.
      #
      # @param conversation_id [String] Conversation ID filter used for estimation (tweet_search_extractor)
      #
      # @param exact_phrase [String] Exact phrase filter for search estimation
      #
      # @param exclude_words [String] Words or quoted phrases excluded from estimated results. Separate with spaces, c
      #
      # @param from_user [String] Estimate only tweets from this author username (tweet_search_extractor)
      #
      # @param hashtags [String] Hashtags applied to the estimate, separated by spaces, commas, or lines.
      #
      # @param in_reply_to_tweet_id [String] Estimate only replies to this tweet ID (tweet_search_extractor)
      #
      # @param language [String] Language code used for estimate filtering (tweet_search_extractor)
      #
      # @param list_id [String] Estimate search results within this list ID (tweet_search_extractor)
      #
      # @param media_type [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::MediaType] Media type used for estimate filtering (tweet_search_extractor)
      #
      # @param mentioning [String] Estimate tweets mentioning this username (tweet_search_extractor)
      #
      # @param min_faves [Integer] Minimum likes threshold for estimated results (tweet_search_extractor)
      #
      # @param min_quotes [Integer] Minimum quote count threshold for estimated results (tweet_search_extractor)
      #
      # @param min_replies [Integer] Minimum replies threshold for estimated results (tweet_search_extractor)
      #
      # @param min_retweets [Integer] Minimum retweets threshold for estimated results (tweet_search_extractor)
      #
      # @param place [String] Estimate search results within this place ID (tweet_search_extractor)
      #
      # @param place_country [String] Estimate search results within this country code (tweet_search_extractor)
      #
      # @param point_radius [String] Geo point radius used for estimation, e.g. -73.99 40.73 25mi (tweet_search_extra
      #
      # @param quotes [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Quotes] Quote mode used for estimation (tweet_search_extractor)
      #
      # @param quotes_of_tweet_id [String] Estimate only quotes of this tweet ID (tweet_search_extractor)
      #
      # @param replies [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Replies] Reply mode used for estimation (tweet_search_extractor)
      #
      # @param results_limit [Integer] Maximum number of results to estimate. When set, the estimate caps projected res
      #
      # @param retweets [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Retweets] Retweet mode used for estimation (tweet_search_extractor)
      #
      # @param retweets_of_tweet_id [String] Estimate only retweets of this tweet ID (tweet_search_extractor)
      #
      # @param search_query [String] Required for tweet_search_extractor & community_search.
      #
      # @param since_date [Date] Estimate start date in YYYY-MM-DD format (tweet_search_extractor)
      #
      # @param target_community_id [String] Required for community_post_extractor & community_search.
      #
      # @param target_list_id [String] Required for list_follower_explorer, list_member_extractor & list_post_extractor
      #
      # @param target_space_id [String] Required for space_explorer.
      #
      # @param target_tweet_id [String]
      #
      # @param target_username [String]
      #
      # @param to_user [String] Estimate replies sent to this username (tweet_search_extractor)
      #
      # @param until_date [Date] Estimate end date in YYYY-MM-DD format (tweet_search_extractor)
      #
      # @param url [String] URL substring or domain filter used for estimation (tweet_search_extractor)
      #
      # @param verified_only [Boolean] Estimate only verified authors (tweet_search_extractor)
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
      # @overload export_results(id, format_:, request_options: {})
      #
      # @param id [String] Extraction public ID
      #
      # @param format_ [Symbol, XTwitterScraper::Models::ExtractionExportResultsParams::Format] Export file format
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see XTwitterScraper::Models::ExtractionExportResultsParams
      def export_results(id, params)
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

      # Some parameter documentations has been truncated, see
      # {XTwitterScraper::Models::ExtractionRunParams} for more details.
      #
      # Run extraction
      #
      # @overload run(tool_type:, advanced_query: nil, any_words: nil, bounding_box: nil, cashtags: nil, conversation_id: nil, exact_phrase: nil, exclude_words: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, list_id: nil, media_type: nil, mentioning: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, place: nil, place_country: nil, point_radius: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, results_limit: nil, retweets: nil, retweets_of_tweet_id: nil, search_query: nil, since_date: nil, target_community_id: nil, target_list_id: nil, target_space_id: nil, target_tweet_id: nil, target_username: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, request_options: {})
      #
      # @param tool_type [Symbol, XTwitterScraper::Models::ExtractionRunParams::ToolType] Identifier for the extraction tool used to run a job.
      #
      # @param advanced_query [String] Raw advanced search query appended as-is (tweet_search_extractor)
      #
      # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
      #
      # @param bounding_box [String] Geo bounding box, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_extractor)
      #
      # @param cashtags [String] Cashtags separated by spaces, commas, or lines. (tweet_search_extractor)
      #
      # @param conversation_id [String] Conversation ID filter (tweet_search_extractor)
      #
      # @param exact_phrase [String] Exact phrase to match (tweet_search_extractor)
      #
      # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines. (twe
      #
      # @param from_user [String] Filter by author username (tweet_search_extractor)
      #
      # @param hashtags [String] Hashtags separated by spaces, commas, or lines. (tweet_search_extractor)
      #
      # @param in_reply_to_tweet_id [String] Only replies to this tweet ID (tweet_search_extractor)
      #
      # @param language [String] Language code filter (tweet_search_extractor)
      #
      # @param list_id [String] Search within a list ID (tweet_search_extractor)
      #
      # @param media_type [Symbol, XTwitterScraper::Models::ExtractionRunParams::MediaType] Media type filter (tweet_search_extractor)
      #
      # @param mentioning [String] Filter tweets mentioning a username (tweet_search_extractor)
      #
      # @param min_faves [Integer] Minimum likes threshold (tweet_search_extractor)
      #
      # @param min_quotes [Integer] Minimum quote count threshold (tweet_search_extractor)
      #
      # @param min_replies [Integer] Minimum replies threshold (tweet_search_extractor)
      #
      # @param min_retweets [Integer] Minimum retweets threshold (tweet_search_extractor)
      #
      # @param place [String] Search within a place ID (tweet_search_extractor)
      #
      # @param place_country [String] Search within a country code (tweet_search_extractor)
      #
      # @param point_radius [String] Geo point radius, e.g. -73.99 40.73 25mi (tweet_search_extractor)
      #
      # @param quotes [Symbol, XTwitterScraper::Models::ExtractionRunParams::Quotes] Quote mode (tweet_search_extractor)
      #
      # @param quotes_of_tweet_id [String] Only quotes of this tweet ID (tweet_search_extractor)
      #
      # @param replies [Symbol, XTwitterScraper::Models::ExtractionRunParams::Replies] Reply mode (tweet_search_extractor)
      #
      # @param results_limit [Integer] Maximum number of results to extract. When set, the extraction stops after reach
      #
      # @param retweets [Symbol, XTwitterScraper::Models::ExtractionRunParams::Retweets] Retweet mode (tweet_search_extractor)
      #
      # @param retweets_of_tweet_id [String] Only retweets of this tweet ID (tweet_search_extractor)
      #
      # @param search_query [String] Required for tweet_search_extractor & community_search.
      #
      # @param since_date [Date] Start date YYYY-MM-DD (tweet_search_extractor)
      #
      # @param target_community_id [String] Required for community_post_extractor & community_search.
      #
      # @param target_list_id [String] Required for list_follower_explorer, list_member_extractor & list_post_extractor
      #
      # @param target_space_id [String] Required for space_explorer.
      #
      # @param target_tweet_id [String]
      #
      # @param target_username [String]
      #
      # @param to_user [String] Filter replies sent to a username (tweet_search_extractor)
      #
      # @param until_date [Date] End date YYYY-MM-DD (tweet_search_extractor)
      #
      # @param url [String] URL substring or domain filter (tweet_search_extractor)
      #
      # @param verified_only [Boolean] Only verified authors (tweet_search_extractor)
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
