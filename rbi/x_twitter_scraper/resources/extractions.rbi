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
          field_style:
            XTwitterScraper::ExtractionRetrieveParams::FieldStyle::OrSymbol,
          include_raw: T::Boolean,
          limit: Integer,
          output_mode:
            XTwitterScraper::ExtractionRetrieveParams::OutputMode::OrSymbol,
          output_preset:
            XTwitterScraper::ExtractionRetrieveParams::OutputPreset::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ExtractionRetrieveResponse)
      end
      def retrieve(
        # Extraction public ID (UUID)
        id,
        # Previous nextCursor.
        cursor: nil,
        # Preserve source keys or convert result field names.
        field_style: nil,
        # Use outputMode=raw instead.
        include_raw: nil,
        # Maximum number of results to return (1-1000, default 100)
        limit: nil,
        # Select compact, full, or raw-compatible result fields.
        output_mode: nil,
        # Keep enrichment nested or merge it into each result.
        output_preset: nil,
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
        # Previous nextCursor.
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
          bio_contains: String,
          blue_verified_only: T::Boolean,
          bounding_box: String,
          card_name: String,
          cashtags: String,
          collection_strategy:
            XTwitterScraper::ExtractionEstimateCostParams::CollectionStrategy::OrSymbol,
          conversation_id: String,
          dedupe_across_targets: T::Boolean,
          dedupe_mode:
            XTwitterScraper::ExtractionEstimateCostParams::DedupeMode::OrSymbol,
          exact_phrase: String,
          exclude_original_author: T::Boolean,
          exclude_source: String,
          exclude_words: String,
          from_user: String,
          geocode: String,
          hashtags: String,
          has_location: T::Boolean,
          has_media_only: T::Boolean,
          has_website: T::Boolean,
          include_original_post: T::Boolean,
          include_search_terms: T::Boolean,
          include_target_metadata: T::Boolean,
          in_reply_to_tweet_id: String,
          language: String,
          list_id: String,
          location_contains: String,
          max_depth: Integer,
          max_followers: Integer,
          max_following: Integer,
          max_id: String,
          max_items_per_target: Integer,
          max_likes: Integer,
          max_pages_per_target: Integer,
          max_posts: Integer,
          max_quotes: Integer,
          max_replies: Integer,
          max_retweets: Integer,
          media_type:
            XTwitterScraper::ExtractionEstimateCostParams::MediaType::OrSymbol,
          mentioning: String,
          min_account_age_days: Integer,
          min_bookmarks: Integer,
          min_faves: Integer,
          min_followers: Integer,
          min_following: Integer,
          min_posts: Integer,
          min_quotes: Integer,
          min_replies: Integer,
          min_retweets: Integer,
          min_views: Integer,
          native_retweets: T::Boolean,
          near: String,
          news: T::Boolean,
          overlap_mode: T::Boolean,
          place: String,
          place_country: String,
          point_radius: String,
          query_type:
            XTwitterScraper::ExtractionEstimateCostParams::QueryType::OrSymbol,
          quotes:
            XTwitterScraper::ExtractionEstimateCostParams::Quotes::OrSymbol,
          quotes_of_tweet_id: String,
          relation_targets:
            T::Array[
              XTwitterScraper::ExtractionEstimateCostParams::RelationTarget::OrHash
            ],
          replies:
            XTwitterScraper::ExtractionEstimateCostParams::Replies::OrSymbol,
          results_limit: Integer,
          retweets:
            XTwitterScraper::ExtractionEstimateCostParams::Retweets::OrSymbol,
          retweets_of_tweet_id: String,
          safe: T::Boolean,
          scope: XTwitterScraper::ExtractionEstimateCostParams::Scope::OrSymbol,
          search_queries: T::Array[String],
          search_query: String,
          since_date: Date,
          since_id: String,
          since_time:
            XTwitterScraper::ExtractionEstimateCostParams::SinceTime::Variants,
          sort: XTwitterScraper::ExtractionEstimateCostParams::Sort::OrSymbol,
          source: String,
          start_cursor: String,
          target_community_id: String,
          target_community_ids: T::Array[String],
          target_list_id: String,
          target_list_ids: T::Array[String],
          targets:
            T::Array[
              T.any(
                String,
                XTwitterScraper::ExtractionEstimateCostParams::Target::UnionMember1::OrHash
              )
            ],
          target_space_id: String,
          target_tweet_id: String,
          target_tweet_ids: T::Array[String],
          target_username: String,
          target_usernames: T::Array[String],
          to_user: String,
          until_date: Date,
          until_time:
            XTwitterScraper::ExtractionEstimateCostParams::UntilTime::Variants,
          url: String,
          username_contains: String,
          verified_only: T::Boolean,
          verified_type: String,
          within: String,
          within_time: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ExtractionEstimateCostResponse)
      end
      def estimate_cost(
        # Identifier for the extraction tool used to run a job.
        tool_type:,
        # Raw advanced search query appended as-is (tweet_search_extractor)
        advanced_query: nil,
        # Words or quoted phrases where any one can match. Separate with spaces, commas,
        # or lines. (tweet_search_extractor)
        any_words: nil,
        # Bio terms separated by commas or lines.
        bio_contains: nil,
        # Return only Blue-verified Tweet authors.
        blue_verified_only: nil,
        # Geo bounding box, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_extractor)
        bounding_box: nil,
        # Match the Tweet card name.
        card_name: nil,
        # Cashtags separated by spaces, commas, or lines. (tweet_search_extractor)
        cashtags: nil,
        # Reply collection strategy.
        collection_strategy: nil,
        # Conversation ID filter (tweet_search_extractor)
        conversation_id: nil,
        # Merge duplicate results across collection targets.
        dedupe_across_targets: nil,
        # Keep target duplicates, first rows, or merged overlap.
        dedupe_mode: nil,
        # Exact phrase to match (tweet_search_extractor)
        exact_phrase: nil,
        # Exclude replies from the source author.
        exclude_original_author: nil,
        # Exclude a source application.
        exclude_source: nil,
        # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        # (tweet_search_extractor)
        exclude_words: nil,
        # Filter by author username (tweet_search_extractor)
        from_user: nil,
        # Match latitude, longitude, and radius.
        geocode: nil,
        # Hashtags separated by spaces, commas, or lines. (tweet_search_extractor)
        hashtags: nil,
        # Require a profile location.
        has_location: nil,
        # Return only replies with media.
        has_media_only: nil,
        # Require a profile website.
        has_website: nil,
        # Include the source post in reply results.
        include_original_post: nil,
        # Add matching search terms to collection metadata.
        include_search_terms: nil,
        # Add source target metadata to each result.
        include_target_metadata: nil,
        # Only replies to this tweet ID (tweet_search_extractor)
        in_reply_to_tweet_id: nil,
        # Language code filter (tweet_search_extractor)
        language: nil,
        # Search within a list ID (tweet_search_extractor)
        list_id: nil,
        # Required profile location text.
        location_contains: nil,
        # Maximum nested reply depth.
        max_depth: nil,
        # Maximum follower count for profile results.
        max_followers: nil,
        # Maximum following count for profile results.
        max_following: nil,
        # Return Tweets older than this Tweet ID.
        max_id: nil,
        # Maximum results collected for each target.
        max_items_per_target: nil,
        # Maximum Tweet like count.
        max_likes: nil,
        # Reply pages collected for each target.
        max_pages_per_target: nil,
        # Maximum post count for profile results.
        max_posts: nil,
        # Maximum Tweet quote count.
        max_quotes: nil,
        # Maximum Tweet reply count.
        max_replies: nil,
        # Maximum Tweet repost count.
        max_retweets: nil,
        # Media type filter (tweet_search_extractor)
        media_type: nil,
        # Filter tweets mentioning a username (tweet_search_extractor)
        mentioning: nil,
        # Minimum profile age in days.
        min_account_age_days: nil,
        # Minimum Tweet bookmark count.
        min_bookmarks: nil,
        # Minimum likes threshold (tweet_search_extractor)
        min_faves: nil,
        # Minimum follower count for profile results.
        min_followers: nil,
        # Minimum following count for profile results.
        min_following: nil,
        # Minimum post count for profile results.
        min_posts: nil,
        # Minimum quote count threshold (tweet_search_extractor)
        min_quotes: nil,
        # Minimum replies threshold (tweet_search_extractor)
        min_replies: nil,
        # Minimum retweets threshold (tweet_search_extractor)
        min_retweets: nil,
        # Minimum Tweet view count.
        min_views: nil,
        # Only return native reposts.
        native_retweets: nil,
        # Match a place name.
        near: nil,
        # Only return news results.
        news: nil,
        # Shortcut for dedupeMode=merge.
        overlap_mode: nil,
        # Search within a place ID (tweet_search_extractor)
        place: nil,
        # Search within a country code (tweet_search_extractor)
        place_country: nil,
        # Geo point radius, e.g. -73.99 40.73 25mi (tweet_search_extractor)
        point_radius: nil,
        # Search ranking applied to every query.
        query_type: nil,
        # Quote mode (tweet_search_extractor)
        quotes: nil,
        # Only quotes of this tweet ID (tweet_search_extractor)
        quotes_of_tweet_id: nil,
        # Profile relations processed within one job.
        relation_targets: nil,
        # Reply mode (tweet_search_extractor)
        replies: nil,
        # Maximum number of results to extract. When set, the extraction stops after
        # reaching this limit.
        results_limit: nil,
        # Retweet mode (tweet_search_extractor)
        retweets: nil,
        # Only retweets of this tweet ID (tweet_search_extractor)
        retweets_of_tweet_id: nil,
        # Enable the safe-search filter.
        safe: nil,
        # Reply depth scope.
        scope: nil,
        # Search queries processed as one collection job.
        search_queries: nil,
        # Required for tweet_search_extractor & community_search.
        search_query: nil,
        # Start date YYYY-MM-DD (tweet_search_extractor)
        since_date: nil,
        # Return Tweets newer than this Tweet ID.
        since_id: nil,
        # Reply start time as ISO 8601 or Unix seconds.
        since_time: nil,
        # Reply result order.
        sort: nil,
        # Match the source application.
        source: nil,
        # Resume one reply target from this cursor.
        start_cursor: nil,
        # Required for community_post_extractor & community_search.
        target_community_id: nil,
        # Community IDs processed as one collection job.
        target_community_ids: nil,
        # Required for list_follower_explorer, list_member_extractor &
        # list_post_extractor.
        target_list_id: nil,
        # List IDs processed as one collection job.
        target_list_ids: nil,
        # Mixed targets auto-routed within one job.
        targets: nil,
        # Required for space_explorer.
        target_space_id: nil,
        target_tweet_id: nil,
        # Tweet IDs processed as one collection job.
        target_tweet_ids: nil,
        target_username: nil,
        # Usernames processed as one collection job.
        target_usernames: nil,
        # Filter replies sent to a username (tweet_search_extractor)
        to_user: nil,
        # End date YYYY-MM-DD (tweet_search_extractor)
        until_date: nil,
        # Reply end time as ISO 8601 or Unix seconds.
        until_time: nil,
        # URL substring or domain filter (tweet_search_extractor)
        url: nil,
        # Required username text.
        username_contains: nil,
        # Only verified authors (tweet_search_extractor)
        verified_only: nil,
        # Exact profile verification type.
        verified_type: nil,
        # Set the radius for the near filter.
        within: nil,
        # Match Tweets inside a recent time window.
        within_time: nil,
        request_options: {}
      )
      end

      # Export extraction results
      sig do
        params(
          id: String,
          format_:
            XTwitterScraper::ExtractionExportResultsParams::Format::OrSymbol,
          has_description: T::Boolean,
          has_location: T::Boolean,
          has_media: T::Boolean,
          lang: String,
          max_followers: Integer,
          max_following: Integer,
          max_posts: Integer,
          min_followers: Integer,
          min_following: Integer,
          min_likes: Integer,
          min_posts: Integer,
          min_replies: Integer,
          min_retweets: Integer,
          min_views: Integer,
          search: String,
          since_date: Date,
          until_date: Date,
          verified: T::Boolean,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def export_results(
        # Extraction public ID
        id,
        # Export file format
        format_:,
        # Require a non-empty description.
        has_description: nil,
        # Require a non-empty location.
        has_location: nil,
        # Require media.
        has_media: nil,
        # Filter by language code.
        lang: nil,
        # Maximum follower count.
        max_followers: nil,
        # Maximum following count.
        max_following: nil,
        # Maximum post count.
        max_posts: nil,
        # Minimum follower count.
        min_followers: nil,
        # Minimum following count.
        min_following: nil,
        # Minimum like count.
        min_likes: nil,
        # Minimum post count.
        min_posts: nil,
        # Minimum reply count.
        min_replies: nil,
        # Minimum repost count.
        min_retweets: nil,
        # Minimum view count.
        min_views: nil,
        # Search exported result text.
        search: nil,
        # Include results on or after this date.
        since_date: nil,
        # Include results on or before this date.
        until_date: nil,
        # Filter by verified status.
        verified: nil,
        request_options: {}
      )
      end

      # Run extraction
      sig do
        params(
          tool_type: XTwitterScraper::ExtractionRunParams::ToolType::OrSymbol,
          dry_run: T::Boolean,
          advanced_query: String,
          any_words: String,
          bio_contains: String,
          blue_verified_only: T::Boolean,
          bounding_box: String,
          card_name: String,
          cashtags: String,
          collection_strategy:
            XTwitterScraper::ExtractionRunParams::CollectionStrategy::OrSymbol,
          conversation_id: String,
          dedupe_across_targets: T::Boolean,
          dedupe_mode:
            XTwitterScraper::ExtractionRunParams::DedupeMode::OrSymbol,
          exact_phrase: String,
          exclude_original_author: T::Boolean,
          exclude_source: String,
          exclude_words: String,
          from_user: String,
          geocode: String,
          hashtags: String,
          has_location: T::Boolean,
          has_media_only: T::Boolean,
          has_website: T::Boolean,
          include_original_post: T::Boolean,
          include_search_terms: T::Boolean,
          include_target_metadata: T::Boolean,
          in_reply_to_tweet_id: String,
          language: String,
          list_id: String,
          location_contains: String,
          max_depth: Integer,
          max_followers: Integer,
          max_following: Integer,
          max_id: String,
          max_items_per_target: Integer,
          max_likes: Integer,
          max_pages_per_target: Integer,
          max_posts: Integer,
          max_quotes: Integer,
          max_replies: Integer,
          max_retweets: Integer,
          media_type: XTwitterScraper::ExtractionRunParams::MediaType::OrSymbol,
          mentioning: String,
          min_account_age_days: Integer,
          min_bookmarks: Integer,
          min_faves: Integer,
          min_followers: Integer,
          min_following: Integer,
          min_posts: Integer,
          min_quotes: Integer,
          min_replies: Integer,
          min_retweets: Integer,
          min_views: Integer,
          native_retweets: T::Boolean,
          near: String,
          news: T::Boolean,
          overlap_mode: T::Boolean,
          place: String,
          place_country: String,
          point_radius: String,
          query_type: XTwitterScraper::ExtractionRunParams::QueryType::OrSymbol,
          quotes: XTwitterScraper::ExtractionRunParams::Quotes::OrSymbol,
          quotes_of_tweet_id: String,
          relation_targets:
            T::Array[
              XTwitterScraper::ExtractionRunParams::RelationTarget::OrHash
            ],
          replies: XTwitterScraper::ExtractionRunParams::Replies::OrSymbol,
          results_limit: Integer,
          retweets: XTwitterScraper::ExtractionRunParams::Retweets::OrSymbol,
          retweets_of_tweet_id: String,
          safe: T::Boolean,
          scope: XTwitterScraper::ExtractionRunParams::Scope::OrSymbol,
          search_queries: T::Array[String],
          search_query: String,
          since_date: Date,
          since_id: String,
          since_time: XTwitterScraper::ExtractionRunParams::SinceTime::Variants,
          sort: XTwitterScraper::ExtractionRunParams::Sort::OrSymbol,
          source: String,
          start_cursor: String,
          target_community_id: String,
          target_community_ids: T::Array[String],
          target_list_id: String,
          target_list_ids: T::Array[String],
          targets:
            T::Array[
              T.any(
                String,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::OrHash
              )
            ],
          target_space_id: String,
          target_tweet_id: String,
          target_tweet_ids: T::Array[String],
          target_username: String,
          target_usernames: T::Array[String],
          to_user: String,
          until_date: Date,
          until_time: XTwitterScraper::ExtractionRunParams::UntilTime::Variants,
          url: String,
          username_contains: String,
          verified_only: T::Boolean,
          verified_type: String,
          within: String,
          within_time: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ExtractionRunResponse)
      end
      def run(
        # Body param: Identifier for the extraction tool used to run a job.
        tool_type:,
        # Query param: Estimate cost without creating an extraction.
        dry_run: nil,
        # Body param: Raw advanced search query appended as-is (tweet_search_extractor)
        advanced_query: nil,
        # Body param: Words or quoted phrases where any one can match. Separate with
        # spaces, commas, or lines. (tweet_search_extractor)
        any_words: nil,
        # Body param: Bio terms separated by commas or lines.
        bio_contains: nil,
        # Body param: Return only Blue-verified Tweet authors.
        blue_verified_only: nil,
        # Body param: Geo bounding box, e.g. -74.1 40.6 -73.9 40.8
        # (tweet_search_extractor)
        bounding_box: nil,
        # Body param: Match the Tweet card name.
        card_name: nil,
        # Body param: Cashtags separated by spaces, commas, or lines.
        # (tweet_search_extractor)
        cashtags: nil,
        # Body param: Reply collection strategy.
        collection_strategy: nil,
        # Body param: Conversation ID filter (tweet_search_extractor)
        conversation_id: nil,
        # Body param: Merge duplicate results across collection targets.
        dedupe_across_targets: nil,
        # Body param: Keep target duplicates, first rows, or merged overlap.
        dedupe_mode: nil,
        # Body param: Exact phrase to match (tweet_search_extractor)
        exact_phrase: nil,
        # Body param: Exclude replies from the source author.
        exclude_original_author: nil,
        # Body param: Exclude a source application.
        exclude_source: nil,
        # Body param: Words or quoted phrases to exclude. Separate with spaces, commas, or
        # lines. (tweet_search_extractor)
        exclude_words: nil,
        # Body param: Filter by author username (tweet_search_extractor)
        from_user: nil,
        # Body param: Match latitude, longitude, and radius.
        geocode: nil,
        # Body param: Hashtags separated by spaces, commas, or lines.
        # (tweet_search_extractor)
        hashtags: nil,
        # Body param: Require a profile location.
        has_location: nil,
        # Body param: Return only replies with media.
        has_media_only: nil,
        # Body param: Require a profile website.
        has_website: nil,
        # Body param: Include the source post in reply results.
        include_original_post: nil,
        # Body param: Add matching search terms to collection metadata.
        include_search_terms: nil,
        # Body param: Add source target metadata to each result.
        include_target_metadata: nil,
        # Body param: Only replies to this tweet ID (tweet_search_extractor)
        in_reply_to_tweet_id: nil,
        # Body param: Language code filter (tweet_search_extractor)
        language: nil,
        # Body param: Search within a list ID (tweet_search_extractor)
        list_id: nil,
        # Body param: Required profile location text.
        location_contains: nil,
        # Body param: Maximum nested reply depth.
        max_depth: nil,
        # Body param: Maximum follower count for profile results.
        max_followers: nil,
        # Body param: Maximum following count for profile results.
        max_following: nil,
        # Body param: Return Tweets older than this Tweet ID.
        max_id: nil,
        # Body param: Maximum results collected for each target.
        max_items_per_target: nil,
        # Body param: Maximum Tweet like count.
        max_likes: nil,
        # Body param: Reply pages collected for each target.
        max_pages_per_target: nil,
        # Body param: Maximum post count for profile results.
        max_posts: nil,
        # Body param: Maximum Tweet quote count.
        max_quotes: nil,
        # Body param: Maximum Tweet reply count.
        max_replies: nil,
        # Body param: Maximum Tweet repost count.
        max_retweets: nil,
        # Body param: Media type filter (tweet_search_extractor)
        media_type: nil,
        # Body param: Filter tweets mentioning a username (tweet_search_extractor)
        mentioning: nil,
        # Body param: Minimum profile age in days.
        min_account_age_days: nil,
        # Body param: Minimum Tweet bookmark count.
        min_bookmarks: nil,
        # Body param: Minimum likes threshold (tweet_search_extractor)
        min_faves: nil,
        # Body param: Minimum follower count for profile results.
        min_followers: nil,
        # Body param: Minimum following count for profile results.
        min_following: nil,
        # Body param: Minimum post count for profile results.
        min_posts: nil,
        # Body param: Minimum quote count threshold (tweet_search_extractor)
        min_quotes: nil,
        # Body param: Minimum replies threshold (tweet_search_extractor)
        min_replies: nil,
        # Body param: Minimum retweets threshold (tweet_search_extractor)
        min_retweets: nil,
        # Body param: Minimum Tweet view count.
        min_views: nil,
        # Body param: Only return native reposts.
        native_retweets: nil,
        # Body param: Match a place name.
        near: nil,
        # Body param: Only return news results.
        news: nil,
        # Body param: Shortcut for dedupeMode=merge.
        overlap_mode: nil,
        # Body param: Search within a place ID (tweet_search_extractor)
        place: nil,
        # Body param: Search within a country code (tweet_search_extractor)
        place_country: nil,
        # Body param: Geo point radius, e.g. -73.99 40.73 25mi (tweet_search_extractor)
        point_radius: nil,
        # Body param: Search ranking applied to every query.
        query_type: nil,
        # Body param: Quote mode (tweet_search_extractor)
        quotes: nil,
        # Body param: Only quotes of this tweet ID (tweet_search_extractor)
        quotes_of_tweet_id: nil,
        # Body param: Profile relations processed within one job.
        relation_targets: nil,
        # Body param: Reply mode (tweet_search_extractor)
        replies: nil,
        # Body param: Maximum number of results to extract. When set, the extraction stops
        # after reaching this limit.
        results_limit: nil,
        # Body param: Retweet mode (tweet_search_extractor)
        retweets: nil,
        # Body param: Only retweets of this tweet ID (tweet_search_extractor)
        retweets_of_tweet_id: nil,
        # Body param: Enable the safe-search filter.
        safe: nil,
        # Body param: Reply depth scope.
        scope: nil,
        # Body param: Search queries processed as one collection job.
        search_queries: nil,
        # Body param: Required for tweet_search_extractor & community_search.
        search_query: nil,
        # Body param: Start date YYYY-MM-DD (tweet_search_extractor)
        since_date: nil,
        # Body param: Return Tweets newer than this Tweet ID.
        since_id: nil,
        # Body param: Reply start time as ISO 8601 or Unix seconds.
        since_time: nil,
        # Body param: Reply result order.
        sort: nil,
        # Body param: Match the source application.
        source: nil,
        # Body param: Resume one reply target from this cursor.
        start_cursor: nil,
        # Body param: Required for community_post_extractor & community_search.
        target_community_id: nil,
        # Body param: Community IDs processed as one collection job.
        target_community_ids: nil,
        # Body param: Required for list_follower_explorer, list_member_extractor &
        # list_post_extractor.
        target_list_id: nil,
        # Body param: List IDs processed as one collection job.
        target_list_ids: nil,
        # Body param: Mixed targets auto-routed within one job.
        targets: nil,
        # Body param: Required for space_explorer.
        target_space_id: nil,
        # Body param
        target_tweet_id: nil,
        # Body param: Tweet IDs processed as one collection job.
        target_tweet_ids: nil,
        # Body param
        target_username: nil,
        # Body param: Usernames processed as one collection job.
        target_usernames: nil,
        # Body param: Filter replies sent to a username (tweet_search_extractor)
        to_user: nil,
        # Body param: End date YYYY-MM-DD (tweet_search_extractor)
        until_date: nil,
        # Body param: Reply end time as ISO 8601 or Unix seconds.
        until_time: nil,
        # Body param: URL substring or domain filter (tweet_search_extractor)
        url: nil,
        # Body param: Required username text.
        username_contains: nil,
        # Body param: Only verified authors (tweet_search_extractor)
        verified_only: nil,
        # Body param: Exact profile verification type.
        verified_type: nil,
        # Body param: Set the radius for the near filter.
        within: nil,
        # Body param: Match Tweets inside a recent time window.
        within_time: nil,
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
