# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Bulk data extraction (23 tool types)
    class Extractions
      # Get extraction results
      #
      # @overload retrieve(id, cursor: nil, field_style: nil, include_raw: nil, limit: nil, output_mode: nil, output_preset: nil, wait: nil, request_options: {})
      #
      # @param id [String] Extraction public ID (UUID)
      #
      # @param cursor [String] Previous nextCursor.
      #
      # @param field_style [Symbol, XTwitterScraper::Models::ExtractionRetrieveParams::FieldStyle] Preserve source keys or convert result field names.
      #
      # @param include_raw [Boolean] Use outputMode=raw instead.
      #
      # @param limit [Integer] Maximum number of results to return (1-1000, default 100)
      #
      # @param output_mode [Symbol, XTwitterScraper::Models::ExtractionRetrieveParams::OutputMode] Select compact, full, or raw-compatible result fields.
      #
      # @param output_preset [Symbol, XTwitterScraper::Models::ExtractionRetrieveParams::OutputPreset] Keep enrichment nested or merge it into each result.
      #
      # @param wait [Integer] Wait up to this many seconds when the job is active.
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
          query: query.transform_keys(
            field_style: "fieldStyle",
            include_raw: "includeRaw",
            output_mode: "outputMode",
            output_preset: "outputPreset"
          ),
          model: XTwitterScraper::Models::ExtractionRetrieveResponse,
          options: options
        )
      end

      # List extraction jobs
      #
      # @overload list(cursor: nil, limit: nil, status: nil, tool_type: nil, request_options: {})
      #
      # @param cursor [String] Previous nextCursor.
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

      # Estimate extraction cost
      #
      # @overload estimate_cost(tool_type:, advanced_query: nil, any_words: nil, bio_contains: nil, blue_verified_only: nil, bounding_box: nil, business_email_only: nil, card_name: nil, cashtags: nil, collection_strategy: nil, conversation_id: nil, dedupe_across_targets: nil, dedupe_mode: nil, email_domains: nil, enrich_profiles: nil, exact_phrase: nil, exclude_original_author: nil, exclude_source: nil, exclude_words: nil, from_user: nil, geocode: nil, hashtags: nil, has_email: nil, has_location: nil, has_media_only: nil, has_website: nil, include_original_post: nil, include_search_terms: nil, include_target_metadata: nil, image_shows: nil, in_reply_to_tweet_id: nil, language: nil, list_id: nil, location_contains: nil, max_depth: nil, max_followers: nil, max_following: nil, max_id: nil, max_items_per_target: nil, max_likes: nil, max_pages_per_target: nil, max_posts: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_account_age_days: nil, min_bookmarks: nil, min_faves: nil, min_followers: nil, min_following: nil, min_posts: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, near: nil, news: nil, overlap_mode: nil, place: nil, place_country: nil, point_radius: nil, query_type: nil, quotes: nil, quotes_of_tweet_id: nil, relation_targets: nil, replies: nil, results_limit: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, scope: nil, search_queries: nil, search_query: nil, since_date: nil, since_id: nil, since_time: nil, sort: nil, source: nil, start_cursor: nil, target_community_id: nil, target_community_ids: nil, target_list_id: nil, target_list_ids: nil, targets: nil, target_space_id: nil, target_tweet_id: nil, target_tweet_ids: nil, target_username: nil, target_usernames: nil, text_only_terms: nil, to_user: nil, topic: nil, until_date: nil, until_time: nil, url: nil, username_contains: nil, verified_only: nil, verified_type: nil, within: nil, within_time: nil, request_options: {})
      #
      # @param tool_type [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::ToolType] Identifier for the extraction tool used to run a job.
      #
      # @param advanced_query [String] Raw advanced search query appended as-is (tweet_search_extractor)
      #
      # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
      #
      # @param bio_contains [String] Bio terms separated by commas or lines.
      #
      # @param blue_verified_only [Boolean] Return only Blue-verified Tweet authors.
      #
      # @param bounding_box [String] Geo bounding box, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_extractor)
      #
      # @param business_email_only [Boolean] Require an email the profile publishes outside free webmail, such as Gmail.
      #
      # @param card_name [String] Match the Tweet card name.
      #
      # @param cashtags [String] Cashtags separated by spaces, commas, or lines. (tweet_search_extractor)
      #
      # @param collection_strategy [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::CollectionStrategy] Reply collection strategy.
      #
      # @param conversation_id [String] Conversation ID filter (tweet_search_extractor)
      #
      # @param dedupe_across_targets [Boolean] Merge duplicate results across collection targets.
      #
      # @param dedupe_mode [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::DedupeMode] Keep target duplicates, first rows, or merged overlap.
      #
      # @param email_domains [String] Require an email at one of these domains. Separate domains with commas. Subdomai
      #
      # @param enrich_profiles [Boolean] Add each user's full profile to follower_explorer, following_explorer, verified_
      #
      # @param exact_phrase [String] Exact phrase to match (tweet_search_extractor)
      #
      # @param exclude_original_author [Boolean] Exclude replies from the source author.
      #
      # @param exclude_source [String] Exclude a source application.
      #
      # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines. (twe
      #
      # @param from_user [String] Filter by author username (tweet_search_extractor)
      #
      # @param geocode [String] Match latitude, longitude, and radius.
      #
      # @param hashtags [String] Hashtags separated by spaces, commas, or lines. (tweet_search_extractor)
      #
      # @param has_email [Boolean] Require an email the profile publishes.
      #
      # @param has_location [Boolean] Require a profile location.
      #
      # @param has_media_only [Boolean] Return only replies with media.
      #
      # @param has_website [Boolean] Require a profile website.
      #
      # @param include_original_post [Boolean] Include the source post in reply results.
      #
      # @param include_search_terms [Boolean] Add matching search terms to collection metadata.
      #
      # @param include_target_metadata [Boolean] Add source target metadata to each result.
      #
      # @param image_shows [String] Keep only the posts whose photos show this. Use charts, screenshots, product_pho
      #
      # @param in_reply_to_tweet_id [String] Only replies to this tweet ID (tweet_search_extractor)
      #
      # @param language [String] Language code filter (tweet_search_extractor)
      #
      # @param list_id [String] Search within a list ID (tweet_search_extractor)
      #
      # @param location_contains [String] Required profile location text.
      #
      # @param max_depth [Integer] Maximum nested reply depth.
      #
      # @param max_followers [Integer] Maximum follower count for profile results.
      #
      # @param max_following [Integer] Maximum following count for profile results.
      #
      # @param max_id [String] Return Tweets older than this Tweet ID.
      #
      # @param max_items_per_target [Integer] Maximum results collected for each target.
      #
      # @param max_likes [Integer] Maximum Tweet like count.
      #
      # @param max_pages_per_target [Integer] Reply pages collected for each target.
      #
      # @param max_posts [Integer] Maximum post count for profile results.
      #
      # @param max_quotes [Integer] Maximum Tweet quote count.
      #
      # @param max_replies [Integer] Maximum Tweet reply count.
      #
      # @param max_retweets [Integer] Maximum Tweet repost count.
      #
      # @param media_type [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::MediaType] Media type filter (tweet_search_extractor)
      #
      # @param mentioning [String] Filter tweets mentioning a username (tweet_search_extractor)
      #
      # @param min_account_age_days [Integer] Minimum profile age in days.
      #
      # @param min_bookmarks [Integer] Minimum Tweet bookmark count.
      #
      # @param min_faves [Integer] Minimum likes threshold (tweet_search_extractor)
      #
      # @param min_followers [Integer] Minimum follower count for profile results.
      #
      # @param min_following [Integer] Minimum following count for profile results.
      #
      # @param min_posts [Integer] Minimum post count for profile results.
      #
      # @param min_quotes [Integer] Minimum quote count threshold (tweet_search_extractor)
      #
      # @param min_replies [Integer] Minimum replies threshold (tweet_search_extractor)
      #
      # @param min_retweets [Integer] Minimum retweets threshold (tweet_search_extractor)
      #
      # @param min_views [Integer] Minimum Tweet view count.
      #
      # @param native_retweets [Boolean] Only return native reposts.
      #
      # @param near [String] Match a place name.
      #
      # @param news [Boolean] Only return news results.
      #
      # @param overlap_mode [Boolean] Shortcut for dedupeMode=merge.
      #
      # @param place [String] Search within a place ID (tweet_search_extractor)
      #
      # @param place_country [String] Search within a country code (tweet_search_extractor)
      #
      # @param point_radius [String] Geo point radius, e.g. -73.99 40.73 25mi (tweet_search_extractor)
      #
      # @param query_type [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::QueryType] Search ranking applied to every query.
      #
      # @param quotes [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Quotes] Quote mode (tweet_search_extractor)
      #
      # @param quotes_of_tweet_id [String] Only quotes of this tweet ID (tweet_search_extractor)
      #
      # @param relation_targets [Array<XTwitterScraper::Models::ExtractionEstimateCostParams::RelationTarget>] Profile relations processed within one job.
      #
      # @param replies [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Replies] Reply mode (tweet_search_extractor)
      #
      # @param results_limit [Integer] Maximum number of results to extract. When set, the extraction stops after reach
      #
      # @param retweets [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Retweets] Retweet mode (tweet_search_extractor)
      #
      # @param retweets_of_tweet_id [String] Only retweets of this tweet ID (tweet_search_extractor)
      #
      # @param safe [Boolean] Enable the safe-search filter.
      #
      # @param scope [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Scope] Reply depth scope.
      #
      # @param search_queries [Array<String>] Search queries processed as one collection job.
      #
      # @param search_query [String] Required for tweet_search_extractor & community_search.
      #
      # @param since_date [Date] Start date YYYY-MM-DD (tweet_search_extractor)
      #
      # @param since_id [String] Return Tweets newer than this Tweet ID.
      #
      # @param since_time [Time, Integer] Reply start time as ISO 8601 or Unix seconds.
      #
      # @param sort [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Sort] Reply result order.
      #
      # @param source [String] Match the source application.
      #
      # @param start_cursor [String] Resume one reply target from this cursor.
      #
      # @param target_community_id [String] Required for community_post_extractor & community_search.
      #
      # @param target_community_ids [Array<String>] Community IDs processed as one collection job.
      #
      # @param target_list_id [String] Required for list_follower_explorer, list_member_extractor & list_post_extractor
      #
      # @param target_list_ids [Array<String>] List IDs processed as one collection job.
      #
      # @param targets [Array<String, XTwitterScraper::Models::ExtractionEstimateCostParams::Target::UnionMember1>] Mixed targets auto-routed within one job.
      #
      # @param target_space_id [String] Required for space_explorer.
      #
      # @param target_tweet_id [String]
      #
      # @param target_tweet_ids [Array<String>] Tweet IDs processed as one collection job.
      #
      # @param target_username [String]
      #
      # @param target_usernames [Array<String>] Usernames processed as one collection job.
      #
      # @param text_only_terms [String] Collects a post only when 1 of these words or quoted phrases is in its text, a l
      #
      # @param to_user [String] Filter replies sent to a username (tweet_search_extractor)
      #
      # @param topic [String] Keep only the posts about this topic, such as "the Rust programming language". E
      #
      # @param until_date [Date] End date YYYY-MM-DD (tweet_search_extractor)
      #
      # @param until_time [Time, Integer] Reply end time as ISO 8601 or Unix seconds.
      #
      # @param url [String] URL substring or domain filter (tweet_search_extractor)
      #
      # @param username_contains [String] Required username text.
      #
      # @param verified_only [Boolean] Only verified authors (tweet_search_extractor)
      #
      # @param verified_type [String] Exact profile verification type.
      #
      # @param within [String] Set the radius for the near filter.
      #
      # @param within_time [String] Match Tweets inside a recent time window.
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
      # @overload export_results(id, format_:, business_email_only: nil, change: nil, compare: nil, email_domains: nil, has_description: nil, has_email: nil, has_location: nil, has_media: nil, has_website: nil, hide_fake: nil, hide_inactive: nil, joined_since: nil, joined_until: nil, lang: nil, location: nil, max_followers: nil, max_following: nil, max_posts: nil, min_followers: nil, min_following: nil, min_likes: nil, min_posts: nil, min_replies: nil, min_retweets: nil, min_views: nil, search: nil, since_date: nil, until_date: nil, verified: nil, request_options: {})
      #
      # @param id [String] Extraction public ID
      #
      # @param format_ [Symbol, XTwitterScraper::Models::ExtractionExportResultsParams::Format] Export file format
      #
      # @param business_email_only [Boolean] Require an email outside free webmail, such as Gmail, in the row's Email column.
      #
      # @param change [Symbol, XTwitterScraper::Models::ExtractionExportResultsParams::Change] With compare, `added` keeps this run's new rows and `removed` keeps the earlier
      #
      # @param compare [String] ID of another run of this tool. For an earlier whole run of the same account, th
      #
      # @param email_domains [String] Require the row's email at one of these domains. Separate domains with commas. S
      #
      # @param has_description [Boolean] Require a non-empty description.
      #
      # @param has_email [Boolean] Require an email in the row's Email column.
      #
      # @param has_location [Boolean] Require a non-empty location.
      #
      # @param has_media [Boolean] Require media.
      #
      # @param has_website [Boolean] Require a website on the profile.
      #
      # @param hide_fake [Boolean] Drop accounts with at least 3 of these signs. No posts, a default picture, an em
      #
      # @param hide_inactive [Boolean] Drop accounts with under 1 post a month since joining that are at least 180 days
      #
      # @param joined_since [Date] Keep accounts that joined X on this UTC day or later.
      #
      # @param joined_until [Date] Keep accounts that joined X before this UTC day.
      #
      # @param lang [String] Filter by language code.
      #
      # @param location [String] Keep accounts whose location contains this text.
      #
      # @param max_followers [Integer] Maximum follower count.
      #
      # @param max_following [Integer] Maximum following count.
      #
      # @param max_posts [Integer] Maximum post count.
      #
      # @param min_followers [Integer] Minimum follower count.
      #
      # @param min_following [Integer] Minimum following count.
      #
      # @param min_likes [Integer] Minimum like count.
      #
      # @param min_posts [Integer] Minimum post count.
      #
      # @param min_replies [Integer] Minimum reply count.
      #
      # @param min_retweets [Integer] Minimum repost count.
      #
      # @param min_views [Integer] Minimum view count.
      #
      # @param search [String] Search exported result text.
      #
      # @param since_date [Date] Include results on or after this date.
      #
      # @param until_date [Date] Include results on or before this date.
      #
      # @param verified [Boolean] Filter by verified status.
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
          query: query.transform_keys(
            business_email_only: "businessEmailOnly",
            email_domains: "emailDomains",
            format_: "format",
            has_description: "hasDescription",
            has_email: "hasEmail",
            has_location: "hasLocation",
            has_media: "hasMedia",
            has_website: "hasWebsite",
            hide_fake: "hideFake",
            hide_inactive: "hideInactive",
            joined_since: "joinedSince",
            joined_until: "joinedUntil",
            max_followers: "maxFollowers",
            max_following: "maxFollowing",
            max_posts: "maxPosts",
            min_followers: "minFollowers",
            min_following: "minFollowing",
            min_likes: "minLikes",
            min_posts: "minPosts",
            min_replies: "minReplies",
            min_retweets: "minRetweets",
            min_views: "minViews",
            since_date: "sinceDate",
            until_date: "untilDate"
          ),
          headers: {"accept" => "application/octet-stream"},
          model: StringIO,
          options: options
        )
      end

      # Run extraction
      #
      # @overload run(tool_type:, dry_run: nil, advanced_query: nil, any_words: nil, bio_contains: nil, blue_verified_only: nil, bounding_box: nil, business_email_only: nil, card_name: nil, cashtags: nil, collection_strategy: nil, conversation_id: nil, dedupe_across_targets: nil, dedupe_mode: nil, email_domains: nil, enrich_profiles: nil, exact_phrase: nil, exclude_original_author: nil, exclude_source: nil, exclude_words: nil, from_user: nil, geocode: nil, hashtags: nil, has_email: nil, has_location: nil, has_media_only: nil, has_website: nil, include_original_post: nil, include_search_terms: nil, include_target_metadata: nil, image_shows: nil, in_reply_to_tweet_id: nil, language: nil, list_id: nil, location_contains: nil, max_depth: nil, max_followers: nil, max_following: nil, max_id: nil, max_items_per_target: nil, max_likes: nil, max_pages_per_target: nil, max_posts: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_account_age_days: nil, min_bookmarks: nil, min_faves: nil, min_followers: nil, min_following: nil, min_posts: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, near: nil, news: nil, overlap_mode: nil, place: nil, place_country: nil, point_radius: nil, query_type: nil, quotes: nil, quotes_of_tweet_id: nil, relation_targets: nil, replies: nil, results_limit: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, scope: nil, search_queries: nil, search_query: nil, since_date: nil, since_id: nil, since_time: nil, sort: nil, source: nil, start_cursor: nil, target_community_id: nil, target_community_ids: nil, target_list_id: nil, target_list_ids: nil, targets: nil, target_space_id: nil, target_tweet_id: nil, target_tweet_ids: nil, target_username: nil, target_usernames: nil, text_only_terms: nil, to_user: nil, topic: nil, until_date: nil, until_time: nil, url: nil, username_contains: nil, verified_only: nil, verified_type: nil, within: nil, within_time: nil, request_options: {})
      #
      # @param tool_type [Symbol, XTwitterScraper::Models::ExtractionRunParams::ToolType] Body param: Identifier for the extraction tool used to run a job.
      #
      # @param dry_run [Boolean] Query param: Estimate cost without creating an extraction.
      #
      # @param advanced_query [String] Body param: Raw advanced search query appended as-is (tweet_search_extractor)
      #
      # @param any_words [String] Body param: Words or quoted phrases where any one can match. Separate with space
      #
      # @param bio_contains [String] Body param: Bio terms separated by commas or lines.
      #
      # @param blue_verified_only [Boolean] Body param: Return only Blue-verified Tweet authors.
      #
      # @param bounding_box [String] Body param: Geo bounding box, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_extractor
      #
      # @param business_email_only [Boolean] Require an email the profile publishes outside free webmail, such as Gmail.
      #
      # @param card_name [String] Body param: Match the Tweet card name.
      #
      # @param cashtags [String] Body param: Cashtags separated by spaces, commas, or lines. (tweet_search_extrac
      #
      # @param collection_strategy [Symbol, XTwitterScraper::Models::ExtractionRunParams::CollectionStrategy] Body param: Reply collection strategy.
      #
      # @param conversation_id [String] Body param: Conversation ID filter (tweet_search_extractor)
      #
      # @param dedupe_across_targets [Boolean] Body param: Merge duplicate results across collection targets.
      #
      # @param dedupe_mode [Symbol, XTwitterScraper::Models::ExtractionRunParams::DedupeMode] Body param: Keep target duplicates, first rows, or merged overlap.
      #
      # @param email_domains [String] Require an email at one of these domains. Separate domains with commas. Subdomai
      #
      # @param enrich_profiles [Boolean] Add each user's full profile to follower_explorer, following_explorer, verified_
      #
      # @param exact_phrase [String] Body param: Exact phrase to match (tweet_search_extractor)
      #
      # @param exclude_original_author [Boolean] Body param: Exclude replies from the source author.
      #
      # @param exclude_source [String] Body param: Exclude a source application.
      #
      # @param exclude_words [String] Body param: Words or quoted phrases to exclude. Separate with spaces, commas, or
      #
      # @param from_user [String] Body param: Filter by author username (tweet_search_extractor)
      #
      # @param geocode [String] Body param: Match latitude, longitude, and radius.
      #
      # @param hashtags [String] Body param: Hashtags separated by spaces, commas, or lines. (tweet_search_extrac
      #
      # @param has_email [Boolean] Require an email the profile publishes.
      #
      # @param has_location [Boolean] Body param: Require a profile location.
      #
      # @param has_media_only [Boolean] Body param: Return only replies with media.
      #
      # @param has_website [Boolean] Body param: Require a profile website.
      #
      # @param include_original_post [Boolean] Body param: Include the source post in reply results.
      #
      # @param include_search_terms [Boolean] Body param: Add matching search terms to collection metadata.
      #
      # @param include_target_metadata [Boolean] Body param: Add source target metadata to each result.
      #
      # @param image_shows [String] Keep only the posts whose photos show this. Use charts, screenshots, product_pho
      #
      # @param in_reply_to_tweet_id [String] Body param: Only replies to this tweet ID (tweet_search_extractor)
      #
      # @param language [String] Body param: Language code filter (tweet_search_extractor)
      #
      # @param list_id [String] Body param: Search within a list ID (tweet_search_extractor)
      #
      # @param location_contains [String] Body param: Required profile location text.
      #
      # @param max_depth [Integer] Body param: Maximum nested reply depth.
      #
      # @param max_followers [Integer] Body param: Maximum follower count for profile results.
      #
      # @param max_following [Integer] Body param: Maximum following count for profile results.
      #
      # @param max_id [String] Body param: Return Tweets older than this Tweet ID.
      #
      # @param max_items_per_target [Integer] Body param: Maximum results collected for each target.
      #
      # @param max_likes [Integer] Body param: Maximum Tweet like count.
      #
      # @param max_pages_per_target [Integer] Body param: Reply pages collected for each target.
      #
      # @param max_posts [Integer] Body param: Maximum post count for profile results.
      #
      # @param max_quotes [Integer] Body param: Maximum Tweet quote count.
      #
      # @param max_replies [Integer] Body param: Maximum Tweet reply count.
      #
      # @param max_retweets [Integer] Body param: Maximum Tweet repost count.
      #
      # @param media_type [Symbol, XTwitterScraper::Models::ExtractionRunParams::MediaType] Body param: Media type filter (tweet_search_extractor)
      #
      # @param mentioning [String] Body param: Filter tweets mentioning a username (tweet_search_extractor)
      #
      # @param min_account_age_days [Integer] Body param: Minimum profile age in days.
      #
      # @param min_bookmarks [Integer] Body param: Minimum Tweet bookmark count.
      #
      # @param min_faves [Integer] Body param: Minimum likes threshold (tweet_search_extractor)
      #
      # @param min_followers [Integer] Body param: Minimum follower count for profile results.
      #
      # @param min_following [Integer] Body param: Minimum following count for profile results.
      #
      # @param min_posts [Integer] Body param: Minimum post count for profile results.
      #
      # @param min_quotes [Integer] Body param: Minimum quote count threshold (tweet_search_extractor)
      #
      # @param min_replies [Integer] Body param: Minimum replies threshold (tweet_search_extractor)
      #
      # @param min_retweets [Integer] Body param: Minimum retweets threshold (tweet_search_extractor)
      #
      # @param min_views [Integer] Body param: Minimum Tweet view count.
      #
      # @param native_retweets [Boolean] Body param: Only return native reposts.
      #
      # @param near [String] Body param: Match a place name.
      #
      # @param news [Boolean] Body param: Only return news results.
      #
      # @param overlap_mode [Boolean] Body param: Shortcut for dedupeMode=merge.
      #
      # @param place [String] Body param: Search within a place ID (tweet_search_extractor)
      #
      # @param place_country [String] Body param: Search within a country code (tweet_search_extractor)
      #
      # @param point_radius [String] Body param: Geo point radius, e.g. -73.99 40.73 25mi (tweet_search_extractor)
      #
      # @param query_type [Symbol, XTwitterScraper::Models::ExtractionRunParams::QueryType] Body param: Search ranking applied to every query.
      #
      # @param quotes [Symbol, XTwitterScraper::Models::ExtractionRunParams::Quotes] Body param: Quote mode (tweet_search_extractor)
      #
      # @param quotes_of_tweet_id [String] Body param: Only quotes of this tweet ID (tweet_search_extractor)
      #
      # @param relation_targets [Array<XTwitterScraper::Models::ExtractionRunParams::RelationTarget>] Body param: Profile relations processed within one job.
      #
      # @param replies [Symbol, XTwitterScraper::Models::ExtractionRunParams::Replies] Body param: Reply mode (tweet_search_extractor)
      #
      # @param results_limit [Integer] Body param: Maximum number of results to extract. When set, the extraction stops
      #
      # @param retweets [Symbol, XTwitterScraper::Models::ExtractionRunParams::Retweets] Body param: Retweet mode (tweet_search_extractor)
      #
      # @param retweets_of_tweet_id [String] Body param: Only retweets of this tweet ID (tweet_search_extractor)
      #
      # @param safe [Boolean] Body param: Enable the safe-search filter.
      #
      # @param scope [Symbol, XTwitterScraper::Models::ExtractionRunParams::Scope] Body param: Reply depth scope.
      #
      # @param search_queries [Array<String>] Body param: Search queries processed as one collection job.
      #
      # @param search_query [String] Body param: Required for tweet_search_extractor & community_search.
      #
      # @param since_date [Date] Body param: Start date YYYY-MM-DD (tweet_search_extractor)
      #
      # @param since_id [String] Body param: Return Tweets newer than this Tweet ID.
      #
      # @param since_time [Time, Integer] Body param: Reply start time as ISO 8601 or Unix seconds.
      #
      # @param sort [Symbol, XTwitterScraper::Models::ExtractionRunParams::Sort] Body param: Reply result order.
      #
      # @param source [String] Body param: Match the source application.
      #
      # @param start_cursor [String] Body param: Resume one reply target from this cursor.
      #
      # @param target_community_id [String] Body param: Required for community_post_extractor & community_search.
      #
      # @param target_community_ids [Array<String>] Body param: Community IDs processed as one collection job.
      #
      # @param target_list_id [String] Body param: Required for list_follower_explorer, list_member_extractor & list_po
      #
      # @param target_list_ids [Array<String>] Body param: List IDs processed as one collection job.
      #
      # @param targets [Array<String, XTwitterScraper::Models::ExtractionRunParams::Target::UnionMember1>] Body param: Mixed targets auto-routed within one job.
      #
      # @param target_space_id [String] Body param: Required for space_explorer.
      #
      # @param target_tweet_id [String] Body param
      #
      # @param target_tweet_ids [Array<String>] Body param: Tweet IDs processed as one collection job.
      #
      # @param target_username [String] Body param
      #
      # @param target_usernames [Array<String>] Body param: Usernames processed as one collection job.
      #
      # @param text_only_terms [String] Collects a post only when 1 of these words or quoted phrases is in its text, a l
      #
      # @param to_user [String] Body param: Filter replies sent to a username (tweet_search_extractor)
      #
      # @param topic [String] Keep only the posts about this topic, such as "the Rust programming language". E
      #
      # @param until_date [Date] Body param: End date YYYY-MM-DD (tweet_search_extractor)
      #
      # @param until_time [Time, Integer] Body param: Reply end time as ISO 8601 or Unix seconds.
      #
      # @param url [String] Body param: URL substring or domain filter (tweet_search_extractor)
      #
      # @param username_contains [String] Body param: Required username text.
      #
      # @param verified_only [Boolean] Body param: Only verified authors (tweet_search_extractor)
      #
      # @param verified_type [String] Body param: Exact profile verification type.
      #
      # @param within [String] Body param: Set the radius for the near filter.
      #
      # @param within_time [String] Body param: Match Tweets inside a recent time window.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::ExtractionRunResponse]
      #
      # @see XTwitterScraper::Models::ExtractionRunParams
      def run(params)
        query_params = [:dry_run]
        parsed, options = XTwitterScraper::ExtractionRunParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :post,
          path: "extractions",
          query: query,
          body: parsed.except(*query_params),
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
