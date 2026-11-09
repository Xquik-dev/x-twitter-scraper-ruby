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
        # @return [XTwitterScraper::Models::PaginatedUsers, XTwitterScraper::Models::X::UserRetrieveFollowersResponse::UserListCoverageResponse]
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
        # @return [XTwitterScraper::Models::PaginatedUsers, XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse]
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
        # @param min_faves [Integer] Minimum likes threshold. minLikes is also accepted.
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
              min_faves: "minFaves",
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
        # @param min_faves [Integer] Minimum likes threshold. minLikes is also accepted.
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
              min_faves: "minFaves",
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
        # @overload retrieve_mentions(id, any_words: nil, blue_verified_only: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, fields: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, omit: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, since_id: nil, since_time: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within_time: nil, request_options: {})
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
        # @param min_faves [Integer] Minimum likes threshold. minLikes is also accepted.
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
              min_faves: "minFaves",
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
        # @param min_faves [Integer] Minimum likes threshold. minLikes is also accepted.
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
              min_faves: "minFaves",
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
        # @param min_faves [Integer] Minimum likes threshold. minLikes is also accepted.
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
              min_faves: "minFaves",
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
        # @return [XTwitterScraper::Models::PaginatedUsers, XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersResponse::UserListCoverageResponse]
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

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
          @follow = XTwitterScraper::Resources::X::Users::Follow.new(client: client)
        end
      end
    end
  end
end
