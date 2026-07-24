# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    # Bulk data extraction (23 tool types)
    class Extractions
      # Get extraction results
      sig do
        params(
          id: String,
          cursor: String,
          limit: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ExtractionRetrieveResponse)
      end
      def retrieve(
        # Extraction public ID (UUID)
        id,
        # Cursor for keyset pagination from prior response next_cursor
        cursor: nil,
        # Maximum number of results to return (1-1000, default 100)
        limit: nil,
        request_options: {}
      )
      end

      # List extraction jobs
      sig do
        params(
          cursor: String,
          limit: Integer,
          status: XTwitterScraper::ExtractionListParams::Status::OrSymbol,
          tool_type: XTwitterScraper::ExtractionListParams::ToolType::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ExtractionListResponse)
      end
      def list(
        # Cursor for keyset pagination from prior response next_cursor
        cursor: nil,
        # Maximum number of items to return (1-100, default 50). For paid per-result
        # endpoints, the returned count may be lower when remaining credits cannot cover
        # the requested page. If zero paid results are affordable, the endpoint returns
        # 402 insufficient_credits.
        limit: nil,
        # Filter by job status
        status: nil,
        # Filter by extraction tool type
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
          any_words: String,
          bounding_box: String,
          cashtags: String,
          conversation_id: String,
          exact_phrase: String,
          exclude_words: String,
          from_user: String,
          hashtags: String,
          in_reply_to_tweet_id: String,
          language: String,
          list_id: String,
          media_type:
            XTwitterScraper::ExtractionEstimateCostParams::MediaType::OrSymbol,
          mentioning: String,
          min_faves: Integer,
          min_quotes: Integer,
          min_replies: Integer,
          min_retweets: Integer,
          place: String,
          place_country: String,
          point_radius: String,
          quotes:
            XTwitterScraper::ExtractionEstimateCostParams::Quotes::OrSymbol,
          quotes_of_tweet_id: String,
          replies:
            XTwitterScraper::ExtractionEstimateCostParams::Replies::OrSymbol,
          results_limit: Integer,
          retweets:
            XTwitterScraper::ExtractionEstimateCostParams::Retweets::OrSymbol,
          retweets_of_tweet_id: String,
          search_query: String,
          since_date: Date,
          target_community_id: String,
          target_list_id: String,
          target_space_id: String,
          target_tweet_id: String,
          target_username: String,
          to_user: String,
          until_date: Date,
          url: String,
          verified_only: T::Boolean,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ExtractionEstimateCostResponse)
      end
      def estimate_cost(
        # Identifier for the extraction tool used to run a job.
        tool_type:,
        # Raw advanced query string appended to the estimate (tweet_search_extractor)
        advanced_query: nil,
        # Alternative words or quoted phrases for estimated results. Separate with spaces,
        # commas, or lines.
        any_words: nil,
        # Geo bounding box used for estimation, e.g. -74.1 40.6 -73.9 40.8
        # (tweet_search_extractor)
        bounding_box: nil,
        # Cashtags applied to the estimate, separated by spaces, commas, or lines.
        cashtags: nil,
        # Conversation ID filter used for estimation (tweet_search_extractor)
        conversation_id: nil,
        # Exact phrase filter for search estimation
        exact_phrase: nil,
        # Words or quoted phrases excluded from estimated results. Separate with spaces,
        # commas, or lines.
        exclude_words: nil,
        # Estimate only tweets from this author username (tweet_search_extractor)
        from_user: nil,
        # Hashtags applied to the estimate, separated by spaces, commas, or lines.
        hashtags: nil,
        # Estimate only replies to this tweet ID (tweet_search_extractor)
        in_reply_to_tweet_id: nil,
        # Language code used for estimate filtering (tweet_search_extractor)
        language: nil,
        # Estimate search results within this list ID (tweet_search_extractor)
        list_id: nil,
        # Media type used for estimate filtering (tweet_search_extractor)
        media_type: nil,
        # Estimate tweets mentioning this username (tweet_search_extractor)
        mentioning: nil,
        # Minimum likes threshold for estimated results (tweet_search_extractor)
        min_faves: nil,
        # Minimum quote count threshold for estimated results (tweet_search_extractor)
        min_quotes: nil,
        # Minimum replies threshold for estimated results (tweet_search_extractor)
        min_replies: nil,
        # Minimum retweets threshold for estimated results (tweet_search_extractor)
        min_retweets: nil,
        # Estimate search results within this place ID (tweet_search_extractor)
        place: nil,
        # Estimate search results within this country code (tweet_search_extractor)
        place_country: nil,
        # Geo point radius used for estimation, e.g. -73.99 40.73 25mi
        # (tweet_search_extractor)
        point_radius: nil,
        # Quote mode used for estimation (tweet_search_extractor)
        quotes: nil,
        # Estimate only quotes of this tweet ID (tweet_search_extractor)
        quotes_of_tweet_id: nil,
        # Reply mode used for estimation (tweet_search_extractor)
        replies: nil,
        # Maximum number of results to estimate. When set, the estimate caps projected
        # results to this value.
        results_limit: nil,
        # Retweet mode used for estimation (tweet_search_extractor)
        retweets: nil,
        # Estimate only retweets of this tweet ID (tweet_search_extractor)
        retweets_of_tweet_id: nil,
        # Query used to price tweet_search_extractor or community_search.
        search_query: nil,
        # Estimate start date in YYYY-MM-DD format (tweet_search_extractor)
        since_date: nil,
        # Community ID used to price community_post_extractor or community_search.
        target_community_id: nil,
        # List ID used to price list_follower_explorer, list_member_extractor, or
        # list_post_extractor.
        target_list_id: nil,
        # Space ID used to price space_explorer.
        target_space_id: nil,
        target_tweet_id: nil,
        target_username: nil,
        # Estimate replies sent to this username (tweet_search_extractor)
        to_user: nil,
        # Estimate end date in YYYY-MM-DD format (tweet_search_extractor)
        until_date: nil,
        # URL substring or domain filter used for estimation (tweet_search_extractor)
        url: nil,
        # Estimate only verified authors (tweet_search_extractor)
        verified_only: nil,
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
        # Export file format
        format_:,
        request_options: {}
      )
      end

      # Run extraction
      sig do
        params(
          tool_type: XTwitterScraper::ExtractionRunParams::ToolType::OrSymbol,
          advanced_query: String,
          any_words: String,
          bounding_box: String,
          cashtags: String,
          conversation_id: String,
          exact_phrase: String,
          exclude_words: String,
          from_user: String,
          hashtags: String,
          in_reply_to_tweet_id: String,
          language: String,
          list_id: String,
          media_type: XTwitterScraper::ExtractionRunParams::MediaType::OrSymbol,
          mentioning: String,
          min_faves: Integer,
          min_quotes: Integer,
          min_replies: Integer,
          min_retweets: Integer,
          place: String,
          place_country: String,
          point_radius: String,
          quotes: XTwitterScraper::ExtractionRunParams::Quotes::OrSymbol,
          quotes_of_tweet_id: String,
          replies: XTwitterScraper::ExtractionRunParams::Replies::OrSymbol,
          results_limit: Integer,
          retweets: XTwitterScraper::ExtractionRunParams::Retweets::OrSymbol,
          retweets_of_tweet_id: String,
          search_query: String,
          since_date: Date,
          target_community_id: String,
          target_list_id: String,
          target_space_id: String,
          target_tweet_id: String,
          target_username: String,
          to_user: String,
          until_date: Date,
          url: String,
          verified_only: T::Boolean,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ExtractionRunResponse)
      end
      def run(
        # Identifier for the extraction tool used to run a job.
        tool_type:,
        # Raw advanced search query appended as-is (tweet_search_extractor)
        advanced_query: nil,
        # Words or quoted phrases where any one can match. Separate with spaces, commas,
        # or lines. (tweet_search_extractor)
        any_words: nil,
        # Geo bounding box, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_extractor)
        bounding_box: nil,
        # Cashtags separated by spaces, commas, or lines. (tweet_search_extractor)
        cashtags: nil,
        # Conversation ID filter (tweet_search_extractor)
        conversation_id: nil,
        # Exact phrase to match (tweet_search_extractor)
        exact_phrase: nil,
        # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        # (tweet_search_extractor)
        exclude_words: nil,
        # Filter by author username (tweet_search_extractor)
        from_user: nil,
        # Hashtags separated by spaces, commas, or lines. (tweet_search_extractor)
        hashtags: nil,
        # Only replies to this tweet ID (tweet_search_extractor)
        in_reply_to_tweet_id: nil,
        # Language code filter (tweet_search_extractor)
        language: nil,
        # Search within a list ID (tweet_search_extractor)
        list_id: nil,
        # Media type filter (tweet_search_extractor)
        media_type: nil,
        # Filter tweets mentioning a username (tweet_search_extractor)
        mentioning: nil,
        # Minimum likes threshold (tweet_search_extractor)
        min_faves: nil,
        # Minimum quote count threshold (tweet_search_extractor)
        min_quotes: nil,
        # Minimum replies threshold (tweet_search_extractor)
        min_replies: nil,
        # Minimum retweets threshold (tweet_search_extractor)
        min_retweets: nil,
        # Search within a place ID (tweet_search_extractor)
        place: nil,
        # Search within a country code (tweet_search_extractor)
        place_country: nil,
        # Geo point radius, e.g. -73.99 40.73 25mi (tweet_search_extractor)
        point_radius: nil,
        # Quote mode (tweet_search_extractor)
        quotes: nil,
        # Only quotes of this tweet ID (tweet_search_extractor)
        quotes_of_tweet_id: nil,
        # Reply mode (tweet_search_extractor)
        replies: nil,
        # Maximum number of results to extract. When set, the extraction stops after
        # reaching this limit.
        results_limit: nil,
        # Retweet mode (tweet_search_extractor)
        retweets: nil,
        # Only retweets of this tweet ID (tweet_search_extractor)
        retweets_of_tweet_id: nil,
        # Required for tweet_search_extractor & community_search.
        search_query: nil,
        # Start date YYYY-MM-DD (tweet_search_extractor)
        since_date: nil,
        # Required for community_post_extractor & community_search.
        target_community_id: nil,
        # Required for list_follower_explorer, list_member_extractor &
        # list_post_extractor.
        target_list_id: nil,
        # Required for space_explorer.
        target_space_id: nil,
        target_tweet_id: nil,
        target_username: nil,
        # Filter replies sent to a username (tweet_search_extractor)
        to_user: nil,
        # End date YYYY-MM-DD (tweet_search_extractor)
        until_date: nil,
        # URL substring or domain filter (tweet_search_extractor)
        url: nil,
        # Only verified authors (tweet_search_extractor)
        verified_only: nil,
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
