# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X write actions (tweets, likes, follows, DMs)
        # @return [XTwitterScraper::Resources::X::Communities::Join]
        attr_reader :join

        # X Community info, members, and tweets
        # @return [XTwitterScraper::Resources::X::Communities::Tweets]
        attr_reader :tweets

        # @return [XTwitterScraper::Resources::X::Communities::Media]
        attr_reader :media

        # Create community
        #
        # @overload create(account:, name:, idempotency_key:, description: nil, request_options: {})
        #
        # @param account [String] Body param: X account (@username or ID) creating the community
        #
        # @param name [String] Body param: Community name
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param description [String] Body param: Community description
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityCreateResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityCreateParams
        def create(params)
          parsed, options = XTwitterScraper::X::CommunityCreateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :post,
            path: "x/communities",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: XTwitterScraper::Models::X::CommunityCreateResponse,
            options: options
          )
        end

        # Delete community
        #
        # @overload delete(id, account:, community_name:, idempotency_key:, request_options: {})
        #
        # @param id [String] Path param: Resource ID returned by the matching create or list endpoint.
        #
        # @param account [String] Body param: X account (@username or ID) deleting the community
        #
        # @param community_name [String] Body param: Community name for confirmation
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityDeleteResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityDeleteParams
        def delete(id, params)
          parsed, options = XTwitterScraper::X::CommunityDeleteParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :delete,
            path: ["x/communities/%1$s", id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: XTwitterScraper::Models::X::CommunityDeleteResponse,
            options: options
          )
        end

        # Get community name, description & member count
        #
        # @overload retrieve_info(id, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Community ID
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityRetrieveInfoResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityRetrieveInfoParams
        def retrieve_info(id, params = {})
          parsed, options = XTwitterScraper::X::CommunityRetrieveInfoParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/communities/%1$s/info", id],
            query: query,
            model: XTwitterScraper::Models::X::CommunityRetrieveInfoResponse,
            options: options
          )
        end

        # List members of a community
        #
        # @overload retrieve_members(id, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, omit: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] Community ID for member lookup
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        # @param cursor [String] Pagination cursor
        #
        # @param email_domains [String] Only return profiles with an email at one of these domains. Separate domains wit
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param has_email [Boolean] Only return profiles that publish an email.
        #
        # @param has_location [Boolean] Only return profiles with a location.
        #
        # @param has_website [Boolean] Only return profiles with a website.
        #
        # @param location_contains [String] Match a location substring, ignoring case.
        #
        # @param max_followers [Integer] Maximum follower count. Missing counts pass this maximum.
        #
        # @param max_following [Integer] Maximum following count.
        #
        # @param max_statuses [Integer] Maximum post count. maxPosts is also accepted.
        #
        # @param min_account_age_days [Integer] Minimum account age in whole days.
        #
        # @param min_followers [Integer] Minimum follower count. Filtering happens before billing.
        #
        # @param min_following [Integer] Minimum following count.
        #
        # @param min_statuses [Integer] Minimum post count. minPosts is also accepted.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param page_size [Integer] Items per page (20-200, default 20). This is an upper bound for paid authenticat
        #
        # @param username_contains [String] Match a username substring, ignoring case.
        #
        # @param verified_only [Boolean] Only return verified profiles.
        #
        # @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::CommunityRetrieveMembersParams
        def retrieve_members(id, params = {})
          parsed, options = XTwitterScraper::X::CommunityRetrieveMembersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/communities/%1$s/members", id],
            query: query.transform_keys(
              bio_contains: "bioContains",
              blue_verified_only: "blueVerifiedOnly",
              business_email_only: "businessEmailOnly",
              email_domains: "emailDomains",
              has_email: "hasEmail",
              has_location: "hasLocation",
              has_website: "hasWebsite",
              location_contains: "locationContains",
              max_followers: "maxFollowers",
              max_following: "maxFollowing",
              max_statuses: "maxStatuses",
              min_account_age_days: "minAccountAgeDays",
              min_followers: "minFollowers",
              min_following: "minFollowing",
              min_statuses: "minStatuses",
              page_size: "pageSize",
              username_contains: "usernameContains",
              verified_only: "verifiedOnly",
              verified_type: "verifiedType"
            ),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # List moderators of a community
        #
        # @overload retrieve_moderators(id, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, omit: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] Community ID for moderator lookup
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        # @param cursor [String] Pagination cursor for community moderators
        #
        # @param email_domains [String] Only return profiles with an email at one of these domains. Separate domains wit
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param has_email [Boolean] Only return profiles that publish an email.
        #
        # @param has_location [Boolean] Only return profiles with a location.
        #
        # @param has_website [Boolean] Only return profiles with a website.
        #
        # @param location_contains [String] Match a location substring, ignoring case.
        #
        # @param max_followers [Integer] Maximum follower count. Missing counts pass this maximum.
        #
        # @param max_following [Integer] Maximum following count.
        #
        # @param max_statuses [Integer] Maximum post count. maxPosts is also accepted.
        #
        # @param min_account_age_days [Integer] Minimum account age in whole days.
        #
        # @param min_followers [Integer] Minimum follower count. Filtering happens before billing.
        #
        # @param min_following [Integer] Minimum following count.
        #
        # @param min_statuses [Integer] Minimum post count. minPosts is also accepted.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param username_contains [String] Match a username substring, ignoring case.
        #
        # @param verified_only [Boolean] Only return verified profiles.
        #
        # @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::CommunityRetrieveModeratorsParams
        def retrieve_moderators(id, params = {})
          parsed, options = XTwitterScraper::X::CommunityRetrieveModeratorsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/communities/%1$s/moderators", id],
            query: query.transform_keys(
              bio_contains: "bioContains",
              blue_verified_only: "blueVerifiedOnly",
              business_email_only: "businessEmailOnly",
              email_domains: "emailDomains",
              has_email: "hasEmail",
              has_location: "hasLocation",
              has_website: "hasWebsite",
              location_contains: "locationContains",
              max_followers: "maxFollowers",
              max_following: "maxFollowing",
              max_statuses: "maxStatuses",
              min_account_age_days: "minAccountAgeDays",
              min_followers: "minFollowers",
              min_following: "minFollowing",
              min_statuses: "minStatuses",
              username_contains: "usernameContains",
              verified_only: "verifiedOnly",
              verified_type: "verifiedType"
            ),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Returns tweets, not community records. Requires a Community ID.
        #
        # @overload retrieve_search(q:, community_id: nil, any_words: nil, blue_verified_only: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, fields: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, omit: nil, page_size: nil, query_type: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, since_id: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, within_time: nil, request_options: {})
        #
        # @param q [String] Search query
        #
        # @param community_id [String] Numeric ID of the community whose posts to search
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for community search
        #
        # @param exact_phrase [String] Match this exact phrase, word for word.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param from_user [String] Filter by author username. Account searches include all of the account's posts &
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param language [String] Filter by language. Its alias is `lang`. Language filters work for every languag
        #
        # @param max_faves [Integer] Maximum likes threshold. maxLikes & max_likes also work.
        #
        # @param max_id [String] Return Tweets at or below this ID.
        #
        # @param max_quotes [Integer] Maximum quotes threshold.
        #
        # @param max_replies [Integer] Maximum replies threshold.
        #
        # @param max_retweets [Integer] Maximum retweets threshold.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::CommunityRetrieveSearchParams::MediaType] Filter media. Its aliases are has_video & has_media.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        # @param min_likes [Integer] Minimum likes. Its aliases are minFaves, min_likes & min_faves.
        #
        # @param min_quotes [Integer] Minimum quote count threshold.
        #
        # @param min_replies [Integer] Minimum replies threshold.
        #
        # @param min_retweets [Integer] Minimum retweets threshold.
        #
        # @param min_views [Integer] Minimum view count threshold.
        #
        # @param native_retweets [Boolean] Only return native reposts.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param page_size [Integer] Maximum page items (1-100, default 20). The source, filters, or credits can reduce results.
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::CommunityRetrieveSearchParams::QueryType] Sort order (Latest or Top)
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::CommunityRetrieveSearchParams::Quotes] Only when the caller requests a quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::CommunityRetrieveSearchParams::Replies] Reply mode. Exclude keeps own-thread replies.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::CommunityRetrieveSearchParams::Retweets] Only when the caller requests a repost mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any com
        #
        # @param since_id [String] Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id` bo
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param within_time [String] Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::CommunityRetrieveSearchParams
        def retrieve_search(params)
          parsed, options = XTwitterScraper::X::CommunityRetrieveSearchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/communities/search",
            query: query.transform_keys(
              any_words: "anyWords",
              blue_verified_only: "blueVerifiedOnly",
              community_id: "communityId",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              in_reply_to_tweet_id: "inReplyToTweetId",
              max_faves: "maxFaves",
              max_id: "maxId",
              max_quotes: "maxQuotes",
              max_replies: "maxReplies",
              max_retweets: "maxRetweets",
              media_type: "mediaType",
              min_bookmarks: "minBookmarks",
              min_likes: "minLikes",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              min_views: "minViews",
              native_retweets: "nativeRetweets",
              page_size: "pageSize",
              query_type: "queryType",
              quotes_of_tweet_id: "quotesOfTweetId",
              retweets_of_tweet_id: "retweetsOfTweetId",
              since_date: "sinceDate",
              since_id: "sinceId",
              to_user: "toUser",
              until_date: "untilDate",
              verified_only: "verifiedOnly",
              within_time: "withinTime"
            ),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Returns the communities X finds for a keyword, in X's order. Each community
        # costs 1 credit. To search the tweets in Communities, use /x/communities/search.
        #
        # @overload find(q:, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param q [String] Keyword to find communities by, such as ai. Alias query. Xquik's cap is 4,096 characters.
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Items per page (1-100, default 20). Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::CommunityPage]
        #
        # @see XTwitterScraper::Models::X::CommunityFindParams
        def find(params)
          parsed, options = XTwitterScraper::Models::X::CommunityFindParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/communities/find",
            query: query,
            model: XTwitterScraper::Models::CommunityPage,
            options: options
          )
        end

        # Returns the communities X ranks highest under a topic or subtopic. Name it by
        # topicId or by topic name from /x/communities/topics. Each community costs 1
        # credit. A missing or unknown topic returns invalid_community_topic & lists the
        # topic names.
        #
        # @overload list_popular(topic_id: nil, topic: nil, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param topic_id [String] Topic or subtopic ID from /x/communities/topics, such as 301. Wins over topic. X can add topics, so Xquik takes up to 280 characters, the most a post holds.
        #
        # @param topic [String] Topic or subtopic name in any case, such as technology. Send this or topicId. X can add topics, so Xquik takes up to 280 characters, the most a post holds.
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Items per page (1-100, default 20). Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::CommunityPage]
        #
        # @see XTwitterScraper::Models::X::CommunityListPopularParams
        def list_popular(params = {})
          parsed, options = XTwitterScraper::Models::X::CommunityListPopularParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/communities/popular",
            query: query,
            model: XTwitterScraper::Models::CommunityPage,
            options: options
          )
        end

        # Returns the communities X suggests, with their full public fields. X picks them
        # per request, so 2 calls can differ. An empty list is free. Each community costs
        # 1 credit.
        #
        # @overload list_suggested(limit: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param limit [Integer] Maximum communities to return. Omit it for every suggestion. A low credit balance can return fewer. Aliases pageSize, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityListSuggestedResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityListSuggestedParams
        def list_suggested(params = {})
          parsed, options = XTwitterScraper::Models::X::CommunityListSuggestedParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/communities/suggested",
            query: query,
            model: XTwitterScraper::Models::X::CommunityListSuggestedResponse,
            options: options
          )
        end

        # Returns the community topics with their subtopics. Pass an ID as topicId, or a
        # name as topic, to /x/communities/popular. Each top-level topic costs 1 credit,
        # its subtopics included.
        #
        # @overload list_topics(limit: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param limit [Integer] Maximum topics to return. Omit it for every topic. A low credit balance can return fewer. Aliases pageSize, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::CommunityListTopicsResponse]
        #
        # @see XTwitterScraper::Models::X::CommunityListTopicsParams
        def list_topics(params = {})
          parsed, options = XTwitterScraper::Models::X::CommunityListTopicsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/communities/topics",
            query: query,
            model: XTwitterScraper::Models::X::CommunityListTopicsResponse,
            options: options
          )
        end

        # Returns community activity for X's latest period. Includes likes, new members,
        # posts, replies & unique posters. Each metric has a count and a changePercent.
        # Each request costs 1 credit.
        #
        # @overload retrieve_analytics(id, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] X Community ID, or the URL-encoded Community link, such as x.com/i/communities/1500000000000000000. Another value gets a free 400 `invalid_community_id` before X is read.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::CommunityAnalytics]
        #
        # @see XTwitterScraper::Models::X::CommunityRetrieveAnalyticsParams
        def retrieve_analytics(id, params = {})
          parsed, options = XTwitterScraper::Models::X::CommunityRetrieveAnalyticsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/communities/%1$s/analytics", id],
            query: query,
            model: XTwitterScraper::Models::CommunityAnalytics,
            options: options
          )
        end

        # Finds a community's members by name or username, each with its role. An answer
        # holds up to 10 members. Each member costs 1 credit. An answer without members is
        # free.
        #
        # @overload search_members(id, q:, min_followers: nil, max_followers: nil, min_following: nil, max_following: nil, min_statuses: nil, max_statuses: nil, min_account_age_days: nil, verified_only: nil, blue_verified_only: nil, verified_type: nil, has_website: nil, has_location: nil, has_email: nil, business_email_only: nil, email_domains: nil, bio_contains: nil, location_contains: nil, username_contains: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] X Community ID, or the URL-encoded Community link, such as x.com/i/communities/1500000000000000000. Another value gets a free 400 `invalid_community_id` before X is read.
        #
        # @param q [String] Name or username to find members by, such as marckohlbrugge. A leading @ is dropped. Alias query. Xquik's cap is 4,096 characters.
        #
        # @param min_followers [Integer] Minimum follower count. Profiles the filter drops cost nothing.
        #
        # @param max_followers [Integer] Maximum follower count. A profile without a count passes.
        #
        # @param min_following [Integer] Profiles must follow at least this many accounts.
        #
        # @param max_following [Integer] Profiles may follow at most this many accounts.
        #
        # @param min_statuses [Integer] Minimum post count. minPosts is also accepted.
        #
        # @param max_statuses [Integer] Maximum post count. maxPosts is also accepted.
        #
        # @param min_account_age_days [Integer] Minimum account age in whole days.
        #
        # @param verified_only [Boolean] Only return verified profiles.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & government accounts blue too. Use verifiedType for 1 badge type.
        #
        # @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        # @param has_website [Boolean] Only return profiles with a website.
        #
        # @param has_location [Boolean] Only return profiles with a location.
        #
        # @param has_email [Boolean] Only return profiles that publish an email.
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        # @param email_domains [String] Only return profiles with an email at one of these domains. Separate domains with commas. Subdomains match.
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param location_contains [String] Match a location substring, ignoring case.
        #
        # @param username_contains [String] Match a username substring, ignoring case.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::CommunitySearchMembersParams
        def search_members(id, params)
          parsed, options = XTwitterScraper::Models::X::CommunitySearchMembersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/communities/%1$s/members/search", id],
            query: query,
            model: XTwitterScraper::Models::PaginatedUsers,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
          @join = XTwitterScraper::Resources::X::Communities::Join.new(client: client)
          @tweets = XTwitterScraper::Resources::X::Communities::Tweets.new(client: client)
          @media = XTwitterScraper::Resources::X::Communities::Media.new(client: client)
        end
      end
    end
  end
end
