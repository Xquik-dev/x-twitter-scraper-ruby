# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Users
        # X write actions (tweets, likes, follows, DMs)
        # @return [XTwitterScraper::Resources::X::Users::Follow]
        attr_reader :follow

        # @return [XTwitterScraper::Resources::X::Users::Block]
        attr_reader :block

        # @return [XTwitterScraper::Resources::X::Users::Mute]
        attr_reader :mute

        # Get user profile with follower counts & verification
        #
        # @overload retrieve(id, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] X username (without @) or user ID
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::UserProfile]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveParams
        def retrieve(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s", id],
            query: query,
            model: XTwitterScraper::UserProfile,
            options: options
          )
        end

        # Remove follower
        #
        # @overload remove_follower(id, account:, idempotency_key:, request_options: {})
        #
        # @param id [String] Path param: User ID to remove from your followers
        #
        # @param account [String] Body param: X account identifier (@username or account ID)
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::UserRemoveFollowerResponse]
        #
        # @see XTwitterScraper::Models::X::UserRemoveFollowerParams
        def remove_follower(id, params)
          parsed, options = XTwitterScraper::X::UserRemoveFollowerParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :post,
            path: ["x/users/%1$s/remove-follower", id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: XTwitterScraper::Models::X::UserRemoveFollowerResponse,
            options: options
          )
        end

        # Look up multiple users by IDs in one call
        #
        # @overload retrieve_batch(ids: nil, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, email_domains: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, omit: nil, username_contains: nil, usernames: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param ids [String] Comma-separated numeric user IDs (1-100 values). Duplicate IDs are ignored while
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
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
        # @param max_followers [Integer] Maximum follower count. A profile without a count passes.
        #
        # @param max_following [Integer] Profiles may follow at most this many accounts.
        #
        # @param max_statuses [Integer] Maximum post count. maxPosts is also accepted.
        #
        # @param min_account_age_days [Integer] Minimum account age in whole days.
        #
        # @param min_followers [Integer] Minimum follower count. Profiles the filter drops cost nothing.
        #
        # @param min_following [Integer] Profiles must follow at least this many accounts.
        #
        # @param min_statuses [Integer] Minimum post count. minPosts is also accepted.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param username_contains [String] Match a username substring, ignoring case.
        #
        # @param usernames [String] Comma-separated X usernames, with or without @, or profile links such as x.com/n
        #
        # @param verified_only [Boolean] Only return verified profiles.
        #
        # @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::UserRetrieveBatchResponse]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveBatchParams
        def retrieve_batch(params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveBatchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/users/batch",
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
            model: XTwitterScraper::Models::X::UserRetrieveBatchResponse,
            options: options
          )
        end

        # List followers of a user
        #
        # @overload retrieve_followers(id, after: nil, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, enrich_profiles: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, limit: nil, location_contains: nil, max_followers: nil, max_following: nil, max_scan: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, mode: nil, omit: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] Target user ID or username for follower lookup.
        #
        # @param after [String] Legacy cursor alias. Prefer cursor.
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        # @param cursor [String] Cursor from the previous response. Xquik cursors resume automatic coverage. Exis
        #
        # @param email_domains [String] Only return profiles with an email at one of these domains. Separate domains wit
        #
        # @param enrich_profiles [Boolean] Add each row's full profile, as GET /x/users/{id} returns it. Pages take several
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param has_email [Boolean] Only return profiles that publish an email.
        #
        # @param has_location [Boolean] Only return profiles with a location.
        #
        # @param has_website [Boolean] Only return profiles with a website.
        #
        # @param limit [Integer] Legacy page-size alias outside explicit coverage mode. Coverage accepts 1-10000.
        #
        # @param location_contains [String] Match a location substring, ignoring case.
        #
        # @param max_followers [Integer] Maximum follower count. Missing counts pass this maximum.
        #
        # @param max_following [Integer] Maximum following count.
        #
        # @param max_scan [Integer] Most profiles 1 request reads, kept or dropped by the filters. The request then
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
        # @param mode [Symbol, XTwitterScraper::Models::X::UserRetrieveFollowersParams::Mode] Omit mode for resumable maximum coverage. Standard keeps legacy pagination. Cove
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param page_size [Integer] Maximum user profiles: automatic 300; standard 200. Sources return fewer profile
        #
        # @param username_contains [String] Match a username substring, ignoring case.
        #
        # @param verified_only [Boolean] Only return verified profiles.
        #
        # @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::UserListPage, XTwitterScraper::Models::X::UserRetrieveFollowersResponse::UserListCoverageResponse]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveFollowersParams
        def retrieve_followers(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveFollowersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/followers", id],
            query: query.transform_keys(
              bio_contains: "bioContains",
              blue_verified_only: "blueVerifiedOnly",
              business_email_only: "businessEmailOnly",
              email_domains: "emailDomains",
              enrich_profiles: "enrichProfiles",
              has_email: "hasEmail",
              has_location: "hasLocation",
              has_website: "hasWebsite",
              location_contains: "locationContains",
              max_followers: "maxFollowers",
              max_following: "maxFollowing",
              max_scan: "maxScan",
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
            model: XTwitterScraper::Models::X::UserRetrieveFollowersResponse,
            options: options
          )
        end

        # List mutual followers between you and a user
        #
        # @overload retrieve_followers_you_know(id, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, omit: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] User ID for followers-you-know lookup
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        # @param cursor [String] Pagination cursor for followers-you-know
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
        # @param page_size [Integer] Maximum user profiles requested from this page (20-200, default 200). Source, fi
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
        # @see XTwitterScraper::Models::X::UserRetrieveFollowersYouKnowParams
        def retrieve_followers_you_know(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveFollowersYouKnowParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/followers-you-know", id],
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

        # List accounts a user follows
        #
        # @overload retrieve_following(id, after: nil, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, enrich_profiles: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, limit: nil, location_contains: nil, max_followers: nil, max_following: nil, max_scan: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, mode: nil, omit: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] User ID or username for following lookup
        #
        # @param after [String] Deprecated following cursor alias. Prefer cursor.
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        # @param cursor [String] Cursor from the previous response. Xquik cursors resume automatic coverage. Exis
        #
        # @param email_domains [String] Only return profiles with an email at one of these domains. Separate domains wit
        #
        # @param enrich_profiles [Boolean] Add each row's full profile, as GET /x/users/{id} returns it. Pages take several
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param has_email [Boolean] Only return profiles that publish an email.
        #
        # @param has_location [Boolean] Only return profiles with a location.
        #
        # @param has_website [Boolean] Only return profiles with a website.
        #
        # @param limit [Integer] Legacy page-size alias outside explicit coverage mode. Coverage accepts 1-10000.
        #
        # @param location_contains [String] Match a location substring, ignoring case.
        #
        # @param max_followers [Integer] Maximum follower count. Missing counts pass this maximum.
        #
        # @param max_following [Integer] Maximum following count.
        #
        # @param max_scan [Integer] Most profiles 1 request reads, kept or dropped by the filters. The request then
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
        # @param mode [Symbol, XTwitterScraper::Models::X::UserRetrieveFollowingParams::Mode] Omit mode for resumable maximum coverage. Standard keeps legacy pagination. Cove
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param page_size [Integer] Maximum user profiles: automatic 300; standard 200. Sources return fewer profile
        #
        # @param username_contains [String] Match a username substring, ignoring case.
        #
        # @param verified_only [Boolean] Only return verified profiles.
        #
        # @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::UserListPage, XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveFollowingParams
        def retrieve_following(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveFollowingParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/following", id],
            query: query.transform_keys(
              bio_contains: "bioContains",
              blue_verified_only: "blueVerifiedOnly",
              business_email_only: "businessEmailOnly",
              email_domains: "emailDomains",
              enrich_profiles: "enrichProfiles",
              has_email: "hasEmail",
              has_location: "hasLocation",
              has_website: "hasWebsite",
              location_contains: "locationContains",
              max_followers: "maxFollowers",
              max_following: "maxFollowing",
              max_scan: "maxScan",
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
            model: XTwitterScraper::Models::X::UserRetrieveFollowingResponse,
            options: options
          )
        end

        # List tweets liked by a user
        #
        # @overload retrieve_likes(id, any_words: nil, blue_verified_only: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, fields: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, omit: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, since_id: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, within_time: nil, request_options: {})
        #
        # @param id [String] User ID or username
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for liked tweets
        #
        # @param exact_phrase [String] Exact phrase to match.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param from_user [String] Filter by author username.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param max_faves [Integer] Maximum likes threshold. maxLikes is also accepted.
        #
        # @param max_id [String] Return Tweets older than this Tweet ID.
        #
        # @param max_quotes [Integer] Maximum quotes threshold.
        #
        # @param max_replies [Integer] Maximum replies threshold.
        #
        # @param max_retweets [Integer] Maximum retweets threshold.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveLikesParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        # @param min_faves [Integer] Deprecated alias of min_likes, sent as minLikes.
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
        # @param page_size [Integer] Maximum page items (1-100, default 20). Source, filters, or credits can reduce r
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveLikesParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveLikesParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveLikesParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_id [String] Return Tweets newer than this Tweet ID.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param within_time [String] Match Tweets inside a recent time window.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveLikesParams
        def retrieve_likes(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveLikesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/likes", id],
            query: query.transform_keys(
              any_words: "anyWords",
              blue_verified_only: "blueVerifiedOnly",
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
              min_faves: "minLikes",
              min_likes: "minLikes",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              min_views: "minViews",
              native_retweets: "nativeRetweets",
              page_size: "pageSize",
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

        # List media tweets posted by a user
        #
        # @overload retrieve_media(id, any_words: nil, blue_verified_only: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, fields: nil, from_user: nil, hashtags: nil, image_shows: nil, in_reply_to_tweet_id: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, omit: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, since_id: nil, to_user: nil, topic: nil, until_date: nil, url: nil, verified_only: nil, within_time: nil, request_options: {})
        #
        # @param id [String] User ID or username for media lookup
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for media tweets
        #
        # @param exact_phrase [String] Exact phrase to match.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param from_user [String] Filter by author username.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param image_shows [String] Keep only posts whose photos show this. Send charts, screenshots, product_photos
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param max_faves [Integer] Maximum likes threshold. maxLikes is also accepted.
        #
        # @param max_id [String] Return Tweets older than this Tweet ID.
        #
        # @param max_quotes [Integer] Maximum quotes threshold.
        #
        # @param max_replies [Integer] Maximum replies threshold.
        #
        # @param max_retweets [Integer] Maximum retweets threshold.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveMediaParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        # @param min_faves [Integer] Deprecated alias of min_likes, sent as minLikes.
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
        # @param page_size [Integer] Maximum page items (1-100, default 20). Source, filters, or credits can reduce r
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveMediaParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveMediaParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveMediaParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_id [String] Return Tweets newer than this Tweet ID.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param topic [String] Keep only posts about this topic. AI-powered analysis asks "Is this post about <
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param within_time [String] Match Tweets inside a recent time window.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::TopicFilteredTweets, XTwitterScraper::Models::ImageFilteredTweets, XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveMediaParams
        def retrieve_media(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveMediaParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/media", id],
            query: query.transform_keys(
              any_words: "anyWords",
              blue_verified_only: "blueVerifiedOnly",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              image_shows: "imageShows",
              in_reply_to_tweet_id: "inReplyToTweetId",
              max_faves: "maxFaves",
              max_id: "maxId",
              max_quotes: "maxQuotes",
              max_replies: "maxReplies",
              max_retweets: "maxRetweets",
              media_type: "mediaType",
              min_bookmarks: "minBookmarks",
              min_faves: "minLikes",
              min_likes: "minLikes",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              min_views: "minViews",
              native_retweets: "nativeRetweets",
              page_size: "pageSize",
              quotes_of_tweet_id: "quotesOfTweetId",
              retweets_of_tweet_id: "retweetsOfTweetId",
              since_date: "sinceDate",
              since_id: "sinceId",
              to_user: "toUser",
              until_date: "untilDate",
              verified_only: "verifiedOnly",
              within_time: "withinTime"
            ),
            model: XTwitterScraper::Models::X::UserRetrieveMediaResponse,
            options: options
          )
        end

        # List tweets mentioning a user
        #
        # @overload retrieve_mentions(id, any_words: nil, blue_verified_only: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, fields: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, omit: nil, own_threads: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, since_id: nil, since_time: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within_time: nil, request_options: {})
        #
        # @param id [String] User ID or username for mentions lookup
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for mentions
        #
        # @param exact_phrase [String] Exact phrase to match.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param from_user [String] Filter by author username.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param max_faves [Integer] Maximum likes threshold. maxLikes is also accepted.
        #
        # @param max_id [String] Return Tweets older than this Tweet ID.
        #
        # @param max_quotes [Integer] Maximum quotes threshold.
        #
        # @param max_replies [Integer] Maximum replies threshold.
        #
        # @param max_retweets [Integer] Maximum retweets threshold.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        # @param min_faves [Integer] Deprecated alias of min_likes, sent as minLikes.
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
        # @param own_threads [String] With replies=exclude, also leaves out replies to the author's own posts, so the search skips every reply.
        #
        # @param page_size [Integer] Maximum page items (1-100, default 20). Source, filters, or credits can reduce r
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_id [String] Return Tweets newer than this Tweet ID.
        #
        # @param since_time [String] Unix timestamp - return mentions after this time
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param until_time [String] Unix timestamp - return mentions before this time
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param within_time [String] Match Tweets inside a recent time window.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveMentionsParams
        def retrieve_mentions(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveMentionsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/mentions", id],
            query: query.transform_keys(
              any_words: "anyWords",
              blue_verified_only: "blueVerifiedOnly",
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
              min_faves: "minLikes",
              min_likes: "minLikes",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              min_views: "minViews",
              native_retweets: "nativeRetweets",
              own_threads: "ownThreads",
              page_size: "pageSize",
              quotes_of_tweet_id: "quotesOfTweetId",
              retweets_of_tweet_id: "retweetsOfTweetId",
              since_date: "sinceDate",
              since_id: "sinceId",
              since_time: "sinceTime",
              to_user: "toUser",
              until_date: "untilDate",
              until_time: "untilTime",
              verified_only: "verifiedOnly",
              within_time: "withinTime"
            ),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Returns target-authored posts and replies. Omit mode for automatic maximum
        # coverage. Pass next_cursor unchanged. Unprefixed cursors stay legacy. Excludes
        # other-author context.
        #
        # @overload retrieve_replies(id, advanced_query: nil, any_words: nil, blue_verified_only: nil, bounding_box: nil, card_name: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_source: nil, exclude_words: nil, fields: nil, from_user: nil, geocode: nil, hashtags: nil, include_parent_tweet: nil, image_shows: nil, in_reply_to_tweet_id: nil, keywords: nil, language: nil, list_id: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, mode: nil, native_retweets: nil, near: nil, news: nil, omit: nil, page_size: nil, place: nil, place_country: nil, point_radius: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, since_date: nil, since_id: nil, since_time: nil, source: nil, to_user: nil, topic: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within: nil, within_time: nil, request_options: {})
        #
        # @param id [String] Target user ID or username for the replies timeline.
        #
        # @param advanced_query [String] Raw advanced search query appended as-is.
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        # @param bounding_box [String] Geo bounding box, such as -74.1 40.6 -73.9 40.8.
        #
        # @param card_name [String] Match the Tweet card name.
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Cursor from the previous response. Xquik cursors resume automatic coverage. Exis
        #
        # @param exact_phrase [String] Exact phrase to match.
        #
        # @param exclude_source [String] Exclude a source application.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param from_user [String] Filter by author username.
        #
        # @param geocode [String] Match latitude, longitude, and radius.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param include_parent_tweet [Boolean] Include each reply's parent tweet.
        #
        # @param image_shows [String] Keep only posts whose photos show this. Send charts, screenshots, product_photos
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param keywords [String] Words the Tweets must match, in X search syntax.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param list_id [String] Search within a list ID.
        #
        # @param max_faves [Integer] Maximum likes threshold. maxLikes is also accepted.
        #
        # @param max_id [String] Return Tweets older than this Tweet ID.
        #
        # @param max_quotes [Integer] Maximum quotes threshold.
        #
        # @param max_replies [Integer] Maximum replies threshold.
        #
        # @param max_retweets [Integer] Maximum retweets threshold.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        # @param min_faves [Integer] Deprecated alias of min_likes, sent as minLikes.
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
        # @param mode [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Mode] Optional legacy pagination override. Filters such as keywords don't apply with i
        #
        # @param native_retweets [Boolean] Only return native reposts.
        #
        # @param near [String] Match a place name.
        #
        # @param news [Boolean] Only return news results.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param page_size [Integer] Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20. Cont
        #
        # @param place [String] Search within a place ID.
        #
        # @param place_country [String] Search within a country code.
        #
        # @param point_radius [String] Geo point radius, such as -73.99 40.73 25mi.
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param safe [Boolean] Enable the safe-search filter.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_id [String] Return Tweets newer than this Tweet ID.
        #
        # @param since_time [String] Inclusive ISO bound for Tweet creation time, such as 2026-09-25T19:20:41Z. Unix
        #
        # @param source [String] Match the source application.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param topic [String] Keep only posts about this topic. AI-powered analysis asks "Is this post about <
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param until_time [String] Exclusive ISO bound for Tweet creation time. Unix seconds also work. A time with
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param within [String] Set the radius for the near filter.
        #
        # @param within_time [String] Match Tweets inside a recent time window.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::TopicFilteredTweets, XTwitterScraper::Models::ImageFilteredTweets, XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveRepliesParams
        def retrieve_replies(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveRepliesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/replies", id],
            query: query.transform_keys(
              advanced_query: "advancedQuery",
              any_words: "anyWords",
              blue_verified_only: "blueVerifiedOnly",
              bounding_box: "boundingBox",
              card_name: "cardName",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_source: "excludeSource",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              image_shows: "imageShows",
              include_parent_tweet: "includeParentTweet",
              in_reply_to_tweet_id: "inReplyToTweetId",
              list_id: "listId",
              max_faves: "maxFaves",
              max_id: "maxId",
              max_quotes: "maxQuotes",
              max_replies: "maxReplies",
              max_retweets: "maxRetweets",
              media_type: "mediaType",
              min_bookmarks: "minBookmarks",
              min_faves: "minLikes",
              min_likes: "minLikes",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              min_views: "minViews",
              native_retweets: "nativeRetweets",
              page_size: "pageSize",
              place_country: "placeCountry",
              point_radius: "pointRadius",
              quotes_of_tweet_id: "quotesOfTweetId",
              retweets_of_tweet_id: "retweetsOfTweetId",
              since_date: "sinceDate",
              since_id: "sinceId",
              since_time: "sinceTime",
              to_user: "toUser",
              until_date: "untilDate",
              until_time: "untilTime",
              verified_only: "verifiedOnly",
              within_time: "withinTime"
            ),
            model: XTwitterScraper::Models::X::UserRetrieveRepliesResponse,
            options: options
          )
        end

        # Search users by name or username
        #
        # @overload retrieve_search(q:, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, enrich_profiles: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, omit: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param q [String] User search query
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        # @param cursor [String] Pagination cursor for user search
        #
        # @param email_domains [String] Only return profiles with an email at one of these domains. Separate domains wit
        #
        # @param enrich_profiles [Boolean] Add each row's full profile, as GET /x/users/{id} returns it. Pages take several
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
        # @param page_size [Integer] Items per page (1-100, default 20). Source, filters or credits can return fewer.
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
        # @see XTwitterScraper::Models::X::UserRetrieveSearchParams
        def retrieve_search(params)
          parsed, options = XTwitterScraper::X::UserRetrieveSearchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/users/search",
            query: query.transform_keys(
              bio_contains: "bioContains",
              blue_verified_only: "blueVerifiedOnly",
              business_email_only: "businessEmailOnly",
              email_domains: "emailDomains",
              enrich_profiles: "enrichProfiles",
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

        # Omit mode for automatic maximum coverage. Pass next_cursor unchanged. Unprefixed
        # cursors use legacy pagination. Shape and billing stay the same.
        #
        # @overload retrieve_tweets(id, advanced_query: nil, any_words: nil, blue_verified_only: nil, bounding_box: nil, card_name: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_source: nil, exclude_words: nil, fields: nil, from_user: nil, geocode: nil, hashtags: nil, include_parent_tweet: nil, include_replies: nil, image_shows: nil, in_reply_to_tweet_id: nil, keywords: nil, language: nil, list_id: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, mode: nil, native_retweets: nil, near: nil, news: nil, omit: nil, page_size: nil, place: nil, place_country: nil, point_radius: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, since_date: nil, since_id: nil, since_time: nil, source: nil, to_user: nil, topic: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within: nil, within_time: nil, request_options: {})
        #
        # @param id [String] X user ID or username
        #
        # @param advanced_query [String] Raw advanced search query appended as-is.
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        # @param bounding_box [String] Geo bounding box, such as -74.1 40.6 -73.9 40.8.
        #
        # @param card_name [String] Match the Tweet card name.
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Cursor from the previous response. Xquik cursors resume automatic coverage. Exis
        #
        # @param exact_phrase [String] Exact phrase to match.
        #
        # @param exclude_source [String] Exclude a source application.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param from_user [String] Filter by author username.
        #
        # @param geocode [String] Match latitude, longitude, and radius.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param include_parent_tweet [Boolean] Include parent tweet for replies
        #
        # @param include_replies [Boolean] Include reply tweets
        #
        # @param image_shows [String] Keep only posts whose photos show this. Send charts, screenshots, product_photos
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param keywords [String] Words the Tweets must match, in X search syntax.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param list_id [String] Search within a list ID.
        #
        # @param max_faves [Integer] Maximum likes threshold. maxLikes is also accepted.
        #
        # @param max_id [String] Return Tweets older than this Tweet ID.
        #
        # @param max_quotes [Integer] Maximum quotes threshold.
        #
        # @param max_replies [Integer] Maximum replies threshold.
        #
        # @param max_retweets [Integer] Maximum retweets threshold.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveTweetsParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        # @param min_faves [Integer] Deprecated alias of min_likes, sent as minLikes.
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
        # @param mode [Symbol, XTwitterScraper::Models::X::UserRetrieveTweetsParams::Mode] Optional legacy pagination override. Filters such as keywords don't apply with i
        #
        # @param native_retweets [Boolean] Only return native reposts.
        #
        # @param near [String] Match a place name.
        #
        # @param news [Boolean] Only return news results.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param page_size [Integer] Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20. Cont
        #
        # @param place [String] Search within a place ID.
        #
        # @param place_country [String] Search within a country code.
        #
        # @param point_radius [String] Geo point radius, such as -73.99 40.73 25mi.
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveTweetsParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveTweetsParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveTweetsParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param safe [Boolean] Enable the safe-search filter.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_id [String] Return Tweets newer than this Tweet ID.
        #
        # @param since_time [String] Inclusive ISO bound for Tweet creation time, such as 2026-09-25T19:20:41Z. Unix
        #
        # @param source [String] Match the source application.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param topic [String] Keep only posts about this topic. AI-powered analysis asks "Is this post about <
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param until_time [String] Exclusive ISO bound for Tweet creation time. Unix seconds also work. A time with
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param within [String] Set the radius for the near filter.
        #
        # @param within_time [String] Match Tweets inside a recent time window.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::TopicFilteredTweets, XTwitterScraper::Models::ImageFilteredTweets, XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveTweetsParams
        def retrieve_tweets(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveTweetsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/tweets", id],
            query: query.transform_keys(
              advanced_query: "advancedQuery",
              any_words: "anyWords",
              blue_verified_only: "blueVerifiedOnly",
              bounding_box: "boundingBox",
              card_name: "cardName",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_source: "excludeSource",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              image_shows: "imageShows",
              include_parent_tweet: "includeParentTweet",
              include_replies: "includeReplies",
              in_reply_to_tweet_id: "inReplyToTweetId",
              list_id: "listId",
              max_faves: "maxFaves",
              max_id: "maxId",
              max_quotes: "maxQuotes",
              max_replies: "maxReplies",
              max_retweets: "maxRetweets",
              media_type: "mediaType",
              min_bookmarks: "minBookmarks",
              min_faves: "minLikes",
              min_likes: "minLikes",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              min_views: "minViews",
              native_retweets: "nativeRetweets",
              page_size: "pageSize",
              place_country: "placeCountry",
              point_radius: "pointRadius",
              quotes_of_tweet_id: "quotesOfTweetId",
              retweets_of_tweet_id: "retweetsOfTweetId",
              since_date: "sinceDate",
              since_id: "sinceId",
              since_time: "sinceTime",
              to_user: "toUser",
              until_date: "untilDate",
              until_time: "untilTime",
              verified_only: "verifiedOnly",
              within_time: "withinTime"
            ),
            model: XTwitterScraper::Models::X::UserRetrieveTweetsResponse,
            options: options
          )
        end

        # List verified followers of a user
        #
        # @overload retrieve_verified_followers(id, after: nil, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, enrich_profiles: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, limit: nil, location_contains: nil, max_followers: nil, max_following: nil, max_scan: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, mode: nil, omit: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] User ID or username for verified followers
        #
        # @param after [String] Legacy cursor alias. Prefer cursor.
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        # @param cursor [String] Cursor from the previous response. Xquik cursors resume automatic coverage. Exis
        #
        # @param email_domains [String] Only return profiles with an email at one of these domains. Separate domains wit
        #
        # @param enrich_profiles [Boolean] Add each row's full profile, as GET /x/users/{id} returns it. Pages take several
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param has_email [Boolean] Only return profiles that publish an email.
        #
        # @param has_location [Boolean] Only return profiles with a location.
        #
        # @param has_website [Boolean] Only return profiles with a website.
        #
        # @param limit [Integer] Legacy page-size alias outside explicit coverage mode. Coverage accepts 1-10000.
        #
        # @param location_contains [String] Match a location substring, ignoring case.
        #
        # @param max_followers [Integer] Maximum follower count. Missing counts pass this maximum.
        #
        # @param max_following [Integer] Maximum following count.
        #
        # @param max_scan [Integer] Most profiles 1 request reads, kept or dropped by the filters. The request then
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
        # @param mode [Symbol, XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersParams::Mode] Omit mode for resumable maximum coverage. Standard keeps legacy pagination. Cove
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param page_size [Integer] Maximum user profiles: automatic 300; standard 200. Sources return fewer profile
        #
        # @param username_contains [String] Match a username substring, ignoring case.
        #
        # @param verified_only [Boolean] Only return verified profiles.
        #
        # @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::UserListPage, XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersResponse::UserListCoverageResponse]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersParams
        def retrieve_verified_followers(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveVerifiedFollowersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/verified-followers", id],
            query: query.transform_keys(
              bio_contains: "bioContains",
              blue_verified_only: "blueVerifiedOnly",
              business_email_only: "businessEmailOnly",
              email_domains: "emailDomains",
              enrich_profiles: "enrichProfiles",
              has_email: "hasEmail",
              has_location: "hasLocation",
              has_website: "hasWebsite",
              location_contains: "locationContains",
              max_followers: "maxFollowers",
              max_following: "maxFollowing",
              max_scan: "maxScan",
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
            model: XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersResponse,
            options: options
          )
        end

        # Returns the newest posts of users named by user ID, username or profile link, in
        # the order named. Send ids or usernames, not both. Each post costs 1 credit. A
        # user in unavailable_ids or unprocessed_ids costs nothing.
        #
        # @overload retrieve_batch_tweets(ids: nil, usernames: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param ids [String] Comma-separated numeric IDs of the users to read posts from. Xquik reads any other entry as a username, with or without @, so IDs and usernames can mix. Xquik ignores duplicates and keeps the first-seen order, IDs before usernames. A longer URL fails at the edge before Xquik reads it.
        #
        # @param usernames [String] Comma-separated X usernames, with or without @, or profile links such as x.com/nasa, in place of ids. A name in another case is the same account. A number is a user ID. A longer URL fails at the edge before Xquik reads it.
        #
        # @param page_size [Integer] Posts per user (1-300, default 20). A low credit balance can return fewer. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::BatchUserTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveBatchTweetsParams
        def retrieve_batch_tweets(params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveBatchTweetsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/users/batch/tweets",
            query: query,
            model: XTwitterScraper::Models::BatchUserTweets,
            options: options
          )
        end

        # Returns the accounts an organization lists as its affiliates, in X's order. An
        # account without affiliates returns an empty list.
        #
        # @overload retrieve_affiliates(id, cursor: nil, page_size: nil, min_followers: nil, max_followers: nil, min_following: nil, max_following: nil, min_statuses: nil, max_statuses: nil, min_account_age_days: nil, verified_only: nil, blue_verified_only: nil, verified_type: nil, has_website: nil, has_location: nil, has_email: nil, business_email_only: nil, email_domains: nil, bio_contains: nil, location_contains: nil, username_contains: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String]
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Profiles to request from this page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 200. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
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
        # @see XTwitterScraper::Models::X::UserRetrieveAffiliatesParams
        def retrieve_affiliates(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveAffiliatesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/affiliates", id],
            query: query,
            model: XTwitterScraper::Models::PaginatedUsers,
            options: options
          )
        end

        # Returns the posts on the user's Articles tab, newest first. Each post's
        # `article` holds the Article's ID, title, preview, cover & dates. Read the full
        # text with GET /x/articles/{tweetId}.
        #
        # @overload retrieve_articles(id, cursor: nil, page_size: nil, from_user: nil, to_user: nil, mentioning: nil, language: nil, since_date: nil, until_date: nil, media_type: nil, min_likes: nil, min_retweets: nil, min_replies: nil, min_quotes: nil, min_views: nil, min_bookmarks: nil, max_faves: nil, max_retweets: nil, max_replies: nil, max_quotes: nil, blue_verified_only: nil, since_id: nil, max_id: nil, within_time: nil, native_retweets: nil, verified_only: nil, replies: nil, retweets: nil, quotes: nil, exact_phrase: nil, exclude_words: nil, any_words: nil, hashtags: nil, cashtags: nil, url: nil, conversation_id: nil, in_reply_to_tweet_id: nil, quotes_of_tweet_id: nil, retweets_of_tweet_id: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String]
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Items per page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param from_user [String] Filter by author username. Account searches include all of the account's posts & reposts.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param language [String] Filter by language. Its alias is `lang`. Language filters work for every language X tags.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any common form.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType] Filter media. Its aliases are has_video & has_media.
        #
        # @param min_likes [Integer] Minimum likes. Its aliases are minFaves, min_likes & min_faves.
        #
        # @param min_retweets [Integer] Minimum retweets threshold.
        #
        # @param min_replies [Integer] Minimum replies threshold.
        #
        # @param min_quotes [Integer] Minimum quote count threshold.
        #
        # @param min_views [Integer] Minimum view count threshold.
        #
        # @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        # @param max_faves [Integer] Maximum likes threshold. maxLikes & max_likes also work.
        #
        # @param max_retweets [Integer] Maximum retweets threshold.
        #
        # @param max_replies [Integer] Maximum replies threshold.
        #
        # @param max_quotes [Integer] Maximum quotes threshold.
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        # @param since_id [String] Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id` bounds.
        #
        # @param max_id [String] Return Tweets at or below this ID.
        #
        # @param within_time [String] Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m, h or d.
        #
        # @param native_retweets [Boolean] Only return native reposts.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveArticlesParams::Replies] Reply mode. Exclude keeps own-thread replies.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveArticlesParams::Retweets] Only when the caller requests a repost mode.
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveArticlesParams::Quotes] Only when the caller requests a quote mode.
        #
        # @param exact_phrase [String] Match this exact phrase, word for word.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, or lines.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveArticlesParams
        def retrieve_articles(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveArticlesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/articles", id],
            query: query,
            model: XTwitterScraper::Models::PaginatedTweets,
            options: options
          )
        end

        # Reads the newest followers of a public account & returns a follower audit. It
        # gives each follower 1 class with its score & signals, then adds coverage, a
        # quality score, signal counts, arrival bands, join cohorts, countries, top
        # followers & the account's engagement. Each follower read costs 1 credit, and the
        # engagement adds 1 credit. Signals come from public profiles, so a real person
        # can match. Older followers may differ from the newest ones.
        #
        # @overload retrieve_follower_audit(id, limit: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] User ID, username with or without @, or URL-encoded profile URL, such as x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a username's ID before sending. Anything else gets 400 `invalid_user_id`.
        #
        # @param limit [Integer] Most followers to read, newest first. Left out, a read takes up to 200 and a low balance reads fewer. A very long read returns what it finished, & coverage shows how many. Its aliases are pageSize, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::UserRetrieveFollowerAuditResponse]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveFollowerAuditParams
        def retrieve_follower_audit(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveFollowerAuditParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/follower-audit", id],
            query: query,
            model: XTwitterScraper::Models::X::UserRetrieveFollowerAuditResponse,
            options: options
          )
        end

        # Returns the user IDs of the selected user's followers, newest first, up to 5,000
        # a page. Use it when you need IDs only. Each ID costs 1 credit.
        #
        # @overload retrieve_follower_ids(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String]
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] User IDs to request from this page (1-5000, default 5000). A low credit balance can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUserIds]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveFollowerIdsParams
        def retrieve_follower_ids(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveFollowerIdsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/follower-ids", id],
            query: query,
            model: XTwitterScraper::Models::PaginatedUserIds,
            options: options
          )
        end

        # Returns the user IDs of the accounts the selected user follows, newest first, up
        # to 5,000 a page. Use it when you need IDs only. Each ID costs 1 credit.
        #
        # @overload retrieve_following_ids(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String]
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] User IDs to request from this page (1-5000, default 5000). A low credit balance can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUserIds]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveFollowingIdsParams
        def retrieve_following_ids(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveFollowingIdsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/following-ids", id],
            query: query,
            model: XTwitterScraper::Models::PaginatedUserIds,
            options: options
          )
        end

        # Returns the posts on the user's Highlights tab, in X's order. An account without
        # highlights returns an empty list.
        #
        # @overload retrieve_highlights(id, cursor: nil, page_size: nil, from_user: nil, to_user: nil, mentioning: nil, language: nil, since_date: nil, until_date: nil, media_type: nil, min_likes: nil, min_retweets: nil, min_replies: nil, min_quotes: nil, min_views: nil, min_bookmarks: nil, max_faves: nil, max_retweets: nil, max_replies: nil, max_quotes: nil, blue_verified_only: nil, since_id: nil, max_id: nil, within_time: nil, native_retweets: nil, verified_only: nil, replies: nil, retweets: nil, quotes: nil, exact_phrase: nil, exclude_words: nil, any_words: nil, hashtags: nil, cashtags: nil, url: nil, conversation_id: nil, in_reply_to_tweet_id: nil, quotes_of_tweet_id: nil, retweets_of_tweet_id: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String]
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Items per page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param from_user [String] Filter by author username. Account searches include all of the account's posts & reposts.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param language [String] Filter by language. Its alias is `lang`. Language filters work for every language X tags.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any common form.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveHighlightsParams::MediaType] Filter media. Its aliases are has_video & has_media.
        #
        # @param min_likes [Integer] Minimum likes. Its aliases are minFaves, min_likes & min_faves.
        #
        # @param min_retweets [Integer] Minimum retweets threshold.
        #
        # @param min_replies [Integer] Minimum replies threshold.
        #
        # @param min_quotes [Integer] Minimum quote count threshold.
        #
        # @param min_views [Integer] Minimum view count threshold.
        #
        # @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        # @param max_faves [Integer] Maximum likes threshold. maxLikes & max_likes also work.
        #
        # @param max_retweets [Integer] Maximum retweets threshold.
        #
        # @param max_replies [Integer] Maximum replies threshold.
        #
        # @param max_quotes [Integer] Maximum quotes threshold.
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        # @param since_id [String] Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id` bounds.
        #
        # @param max_id [String] Return Tweets at or below this ID.
        #
        # @param within_time [String] Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m, h or d.
        #
        # @param native_retweets [Boolean] Only return native reposts.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Replies] Reply mode. Exclude keeps own-thread replies.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Retweets] Only when the caller requests a repost mode.
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Quotes] Only when the caller requests a quote mode.
        #
        # @param exact_phrase [String] Match this exact phrase, word for word.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, or lines.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveHighlightsParams
        def retrieve_highlights(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveHighlightsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/highlights", id],
            query: query,
            model: XTwitterScraper::Models::PaginatedTweets,
            options: options
          )
        end

        # Returns engagement insights for 1 profile. They are engagement rate, averages
        # per post and posting rate, from its counts and its most recent posts. It reads
        # 20 posts unless limit names another number. Reposts and the pinned post stay out
        # of the averages. Each report costs 1 credit, whatever it reads.
        #
        # @overload retrieve_insights(id, limit: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] User ID, username with or without @, or URL-encoded profile URL, such as x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a username's ID before sending. Anything else gets 400 `invalid_user_id`.
        #
        # @param limit [Integer] Recent posts to read for the averages and rates. The read stops at this count, at the account's oldest post or after about 40 seconds. `sample.read` says how many it read, and `sample.posts` how many of those the averages used. `pageSize`, `count`, `max_results`, `maxItems`, `max_items` & `per_page` are accepted aliases.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::UserRetrieveInsightsResponse]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveInsightsParams
        def retrieve_insights(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveInsightsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/insights", id],
            query: query,
            model: XTwitterScraper::Models::X::UserRetrieveInsightsResponse,
            options: options
          )
        end

        # Returns the public X Lists that include the selected user, as the profile's List
        # memberships page shows them. Each List costs 1 credit. A protected account
        # answers 403.
        #
        # @overload retrieve_list_memberships(id, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String]
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Items per page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedLists]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveListMembershipsParams
        def retrieve_list_memberships(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveListMembershipsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/list-memberships", id],
            query: query,
            model: XTwitterScraper::Models::PaginatedLists,
            options: options
          )
        end

        # Returns the public X Lists the selected user created, in X's order, as the
        # profile's Lists tab shows them. Each List costs 1 credit. A protected account
        # answers 403.
        #
        # @overload retrieve_lists(id, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String]
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Items per page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedLists]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveListsParams
        def retrieve_lists(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveListsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/lists", id],
            query: query,
            model: XTwitterScraper::Models::PaginatedLists,
            options: options
          )
        end

        # Says whether 1 user is broadcasting live video on X right now, with their latest
        # broadcast, live or ended. Each check costs 1 credit.
        #
        # @overload retrieve_live(id, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] User ID, username with or without @, or URL-encoded profile URL, such as x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a username's ID before sending. Anything else gets 400 `invalid_user_id`.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::UserLiveStatus]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveLiveParams
        def retrieve_live(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveLiveParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/live", id],
            query: query,
            model: XTwitterScraper::Models::UserLiveStatus,
            options: options
          )
        end

        # Checks 1 X account for a search ban, a search suggestion ban, reply deboosting &
        # a reply lock. It also tests timeline visibility & early engagement, reads the
        # sensitive flag & the countries that withhold the account, and says if the
        # account is active, protected or suspended. Each check answers pass, fail or
        # unknown, with its reason & what it read. `overall` sums up the checks, and
        # `checkedAt` holds the time of the check. The reply checks and the engagement
        # check answer pass or unknown, since X ranks replies for each viewer and a drop
        # alone proves nothing. A protected account skips the checks that need public
        # posts, and a suspended account gets the account check only. Each profile, post,
        # suggestion & reply in the answer costs 1 credit. The timeline, engagement &
        # reply checks read the account's 20 most recent posts unless `limit` names
        # another number. Shadowban checks show if X search lists an account, with each
        # post they read.
        #
        # @overload retrieve_shadowban(id, limit: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] User ID, username with or without @, or URL-encoded profile URL, such as x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a username's ID before sending. Anything else gets 400 `invalid_user_id`.
        #
        # @param limit [Integer] Recent posts to read for the timeline, engagement & reply checks. The read stops at this count, at the account's oldest post or after about 40 seconds. `pageSize`, `count`, `max_results`, `maxItems`, `max_items` & `per_page` are accepted aliases.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::ShadowbanReport]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveShadowbanParams
        def retrieve_shadowban(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveShadowbanParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/shadowban", id],
            query: query,
            model: XTwitterScraper::Models::ShadowbanReport,
            options: options
          )
        end

        # Returns the public accounts X lists as similar to the selected user, in X's
        # order. Each account costs 1 credit. Similar-account lists come back fuller.
        #
        # @overload retrieve_similar(id, cursor: nil, page_size: nil, min_followers: nil, max_followers: nil, min_following: nil, max_following: nil, min_statuses: nil, max_statuses: nil, min_account_age_days: nil, verified_only: nil, blue_verified_only: nil, verified_type: nil, has_website: nil, has_location: nil, has_email: nil, business_email_only: nil, email_domains: nil, bio_contains: nil, location_contains: nil, username_contains: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String]
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Profiles to request from this page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 200. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
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
        # @see XTwitterScraper::Models::X::UserRetrieveSimilarParams
        def retrieve_similar(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveSimilarParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/similar", id],
            query: query,
            model: XTwitterScraper::Models::PaginatedUsers,
            options: options
          )
        end

        # Returns the creators the selected user subscribes to, in X's order. An account
        # that hides its subscriptions returns an empty list.
        #
        # @overload retrieve_subscriptions(id, cursor: nil, page_size: nil, min_followers: nil, max_followers: nil, min_following: nil, max_following: nil, min_statuses: nil, max_statuses: nil, min_account_age_days: nil, verified_only: nil, blue_verified_only: nil, verified_type: nil, has_website: nil, has_location: nil, has_email: nil, business_email_only: nil, email_domains: nil, bio_contains: nil, location_contains: nil, username_contains: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String]
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Profiles to request from this page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 200. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
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
        # @see XTwitterScraper::Models::X::UserRetrieveSubscriptionsParams
        def retrieve_subscriptions(id, params = {})
          parsed, options = XTwitterScraper::Models::X::UserRetrieveSubscriptionsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/subscriptions", id],
            query: query,
            model: XTwitterScraper::Models::PaginatedUsers,
            options: options
          )
        end

        # Returns X's own translation of 1 profile's bio into the language you pick, with
        # the links, mentions, and tags X places in the translated text. A profile without
        # a bio returns translation null & a message, free of charge. Posts & bios can be
        # translated into your language.
        #
        # @overload translate_bio(id, language:, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] User ID, username with or without @, or URL-encoded profile URL, such as x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a username's ID before sending. Anything else gets 400 `invalid_user_id`.
        #
        # @param language [String] Language code to translate into, such as `es`, `tr`, `pt-br`, or `zh-tw`. Upper and lower case both work.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::UserTranslateBioResponse]
        #
        # @see XTwitterScraper::Models::X::UserTranslateBioParams
        def translate_bio(id, params)
          parsed, options = XTwitterScraper::Models::X::UserTranslateBioParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/translation", id],
            query: query,
            model: XTwitterScraper::Models::X::UserTranslateBioResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
          @follow = XTwitterScraper::Resources::X::Users::Follow.new(client: client)
          @block = XTwitterScraper::Resources::X::Users::Block.new(client: client)
          @mute = XTwitterScraper::Resources::X::Users::Mute.new(client: client)
        end
      end
    end
  end
end
