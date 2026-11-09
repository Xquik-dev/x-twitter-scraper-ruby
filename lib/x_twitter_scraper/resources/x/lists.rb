# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # X List followers, members, and tweets
      class Lists
        # List followers of an X List
        #
        # @overload retrieve_followers(id, after: nil, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_scan: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, mode: nil, omit: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] List ID
        #
        # @param after [String] Legacy cursor alias. Prefer cursor.
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        # @param cursor [String] Pagination cursor for list followers
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
        # @param mode [Symbol, XTwitterScraper::Models::X::ListRetrieveFollowersParams::Mode] Omit mode for resumable maximum coverage. Standard keeps legacy pagination. Cove
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
        # @return [XTwitterScraper::Models::UserListPage, XTwitterScraper::Models::X::ListRetrieveFollowersResponse::UserListCoverageResponse]
        #
        # @see XTwitterScraper::Models::X::ListRetrieveFollowersParams
        def retrieve_followers(id, params = {})
          parsed, options = XTwitterScraper::X::ListRetrieveFollowersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/lists/%1$s/followers", id],
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
            model: XTwitterScraper::Models::X::ListRetrieveFollowersResponse,
            options: options
          )
        end

        # List members of an X List
        #
        # @overload retrieve_members(id, after: nil, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_scan: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, mode: nil, omit: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] List ID for member lookup
        #
        # @param after [String] Legacy cursor alias. Prefer cursor.
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        # @param cursor [String] Pagination cursor for list members
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
        # @param mode [Symbol, XTwitterScraper::Models::X::ListRetrieveMembersParams::Mode] Omit mode for resumable maximum coverage. Standard keeps legacy pagination. Cove
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param page_size [Integer] Members per page (20-200, default 20)
        #
        # @param username_contains [String] Match a username substring, ignoring case.
        #
        # @param verified_only [Boolean] Only return verified profiles.
        #
        # @param verified_type [String] Match the verification type exactly, ignoring case.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::UserListPage, XTwitterScraper::Models::X::ListRetrieveMembersResponse::UserListCoverageResponse]
        #
        # @see XTwitterScraper::Models::X::ListRetrieveMembersParams
        def retrieve_members(id, params = {})
          parsed, options = XTwitterScraper::X::ListRetrieveMembersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/lists/%1$s/members", id],
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
            model: XTwitterScraper::Models::X::ListRetrieveMembersResponse,
            options: options
          )
        end

        # List tweets from an X List
        #
        # @overload retrieve_tweets(id, advanced_query: nil, after: nil, any_words: nil, blue_verified_only: nil, bounding_box: nil, card_name: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_source: nil, exclude_words: nil, fields: nil, from_user: nil, geocode: nil, hashtags: nil, in_reply_to_tweet_id: nil, include_replies: nil, keywords: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, mode: nil, native_retweets: nil, near: nil, news: nil, omit: nil, page_size: nil, place: nil, place_country: nil, point_radius: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, since_date: nil, since_id: nil, since_time: nil, source: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within: nil, within_time: nil, request_options: {})
        #
        # @param id [String] List ID for tweet lookup
        #
        # @param advanced_query [String] Raw advanced search query appended as-is.
        #
        # @param after [String] Legacy cursor alias. Prefer cursor.
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        # @param bounding_box [String] Geo bounding box, such as -74.1 40.6 -73.9 40.8.
        #
        # @param card_name [String] Keep only Tweets with this card type, such as poll2choice_text_only. Every retur
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for list tweets
        #
        # @param exact_phrase [String] Match this exact phrase, word for word.
        #
        # @param exclude_source [String] `excludeSource` isn't supported. A Tweet search with it answers 424 & charges no
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param from_user [String] Filter by author username. Account searches include all of the account's posts &
        #
        # @param geocode [String] `geocode` isn't supported. A Tweet search with it answers 424 & charges nothing.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param include_replies [Boolean] Include replies (default false)
        #
        # @param keywords [String] Words the Tweets must match, in X search syntax.
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
        # @param media_type [Symbol, XTwitterScraper::Models::X::ListRetrieveTweetsParams::MediaType] Filter media. Its aliases are has_video & has_media.
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
        # @param mode [Symbol, XTwitterScraper::Models::X::ListRetrieveTweetsParams::Mode] Omit mode for resumable maximum coverage. Standard keeps legacy pagination. Cove
        #
        # @param native_retweets [Boolean] Only return native reposts.
        #
        # @param near [String] A place name, such as a city or a country. Matching Tweets are tagged in or abou
        #
        # @param news [Boolean] `news` isn't supported. A Tweet search with it answers 424 & charges nothing.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param page_size [Integer] Maximum page items (1-100, default 20). Source, filters, or credits can reduce r
        #
        # @param place [String] Search within a place ID.
        #
        # @param place_country [String] Search within a country code.
        #
        # @param point_radius [String] Geo point radius, such as -73.99 40.73 25mi.
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::ListRetrieveTweetsParams::Quotes] Only when the caller requests a quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::ListRetrieveTweetsParams::Replies] Reply mode. Exclude keeps own-thread replies.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::ListRetrieveTweetsParams::Retweets] Only when the caller requests a repost mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param safe [Boolean] Enable the safe-search filter.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any com
        #
        # @param since_id [String] Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id` bo
        #
        # @param since_time [String] Unix timestamp - filter after
        #
        # @param source [String] `source` isn't supported. A Tweet search with it answers 424 & charges nothing.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
        #
        # @param until_time [String] Unix timestamp - filter before
        #
        # @param url [String] URL substring or domain filter.
        #
        # @param verified_only [Boolean] Only return tweets from verified authors.
        #
        # @param within [String] `within` isn't supported. A Tweet search with it answers 424 & charges nothing.
        #
        # @param within_time [String] Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::ListRetrieveTweetsParams
        def retrieve_tweets(id, params = {})
          parsed, options = XTwitterScraper::X::ListRetrieveTweetsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/lists/%1$s/tweets", id],
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
              in_reply_to_tweet_id: "inReplyToTweetId",
              include_replies: "includeReplies",
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
            model: XTwitterScraper::PaginatedTweets,
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
end
