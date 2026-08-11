# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Tweets
        # X write actions (tweets, likes, follows, DMs)
        # @return [XTwitterScraper::Resources::X::Tweets::Like]
        attr_reader :like

        # X write actions (tweets, likes, follows, DMs)
        # @return [XTwitterScraper::Resources::X::Tweets::Retweet]
        attr_reader :retweet

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetCreateParams} for more details.
        #
        # Create tweet
        #
        # @overload create(account:, idempotency_key:, community_id: nil, is_note_tweet: nil, media: nil, reply_to_tweet_id: nil, text: nil, request_options: {})
        #
        # @param account [String] Body param: X account (@username or account ID)
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param community_id [String] Body param
        #
        # @param is_note_tweet [Boolean] Body param
        #
        # @param media [Array<String>] Body param: Array of public media URLs to attach. Supports up to 4 images or exa
        #
        # @param reply_to_tweet_id [String] Body param
        #
        # @param text [String] Body param: Tweet text (optional when media is provided)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetCreateResponse]
        #
        # @see XTwitterScraper::Models::X::TweetCreateParams
        def create(params)
          parsed, options = XTwitterScraper::X::TweetCreateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :post,
            path: "x/tweets",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: XTwitterScraper::Models::X::TweetCreateResponse,
            options: options
          )
        end

        # Get tweet with full text, author, metrics & media
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Numeric tweet ID, 15-20 digits
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetRetrieveResponse]
        #
        # @see XTwitterScraper::Models::X::TweetRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s", id],
            model: XTwitterScraper::Models::X::TweetRetrieveResponse,
            options: params[:request_options]
          )
        end

        # Get multiple tweets by IDs
        #
        # @overload list(ids:, request_options: {})
        #
        # @param ids [String] Comma-separated tweet IDs (max 100)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetListParams
        def list(params)
          parsed, options = XTwitterScraper::X::TweetListParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/tweets",
            query: query,
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetDeleteParams} for more details.
        #
        # Delete tweet
        #
        # @overload delete(id, account:, idempotency_key:, request_options: {})
        #
        # @param id [String] Path param: Tweet ID to delete
        #
        # @param account [String] Body param: X account identifier (@username or account ID)
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetDeleteResponse]
        #
        # @see XTwitterScraper::Models::X::TweetDeleteParams
        def delete(id, params)
          parsed, options = XTwitterScraper::X::TweetDeleteParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :delete,
            path: ["x/tweets/%1$s", id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: XTwitterScraper::Models::X::TweetDeleteResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetGetFavoritersParams} for more details.
        #
        # Returns liker profiles that X makes visible for the post. X can withhold liker
        # identities even when the post reports likes. In that case this endpoint returns
        # 424 `favoriters_unavailable` instead of a misleading empty success.
        #
        # @overload get_favoriters(id, bio_contains: nil, cursor: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get favoriters
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param cursor [String] Pagination cursor for favoriters
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
        # @see XTwitterScraper::Models::X::TweetGetFavoritersParams
        def get_favoriters(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetFavoritersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/favoriters", id],
            query: query.transform_keys(
              bio_contains: "bioContains",
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

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetGetQuotesParams} for more details.
        #
        # List quote tweets of a tweet
        #
        # @overload get_quotes(id, any_words: nil, blue_verified_only: nil, card_name: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_source: nil, exclude_words: nil, from_user: nil, geocode: nil, hashtags: nil, include_replies: nil, in_reply_to_tweet_id: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, near: nil, news: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, since_date: nil, since_id: nil, since_time: nil, source: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within: nil, within_time: nil, request_options: {})
        #
        # @param id [String] Numeric tweet ID to get quotes, 15-20 digits
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        # @param card_name [String] Match the Tweet card name.
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for quote tweets
        #
        # @param exact_phrase [String] Exact phrase to match.
        #
        # @param exclude_source [String] Exclude a source application.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param from_user [String] Filter by author username.
        #
        # @param geocode [String] Match latitude, longitude, and radius.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param include_replies [Boolean] Include reply quotes (default false)
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
        # @param media_type [Symbol, XTwitterScraper::Models::X::TweetGetQuotesParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        # @param min_faves [Integer] Minimum likes threshold.
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
        # @param near [String] Match a place name.
        #
        # @param news [Boolean] Only return news results.
        #
        # @param page_size [Integer] Maximum page items (1-100, default 20). Source, filters, or credits can reduce r
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::TweetGetQuotesParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::TweetGetQuotesParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::TweetGetQuotesParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param safe [Boolean] Enable the safe-search filter.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_id [String] Return Tweets newer than this Tweet ID.
        #
        # @param since_time [String] Unix timestamp - return quotes posted after this time
        #
        # @param source [String] Match the source application.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param until_time [String] Unix timestamp - return quotes posted before this time
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
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetGetQuotesParams
        def get_quotes(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetQuotesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/quotes", id],
            query: query.transform_keys(
              any_words: "anyWords",
              blue_verified_only: "blueVerifiedOnly",
              card_name: "cardName",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_source: "excludeSource",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              include_replies: "includeReplies",
              in_reply_to_tweet_id: "inReplyToTweetId",
              max_faves: "maxFaves",
              max_id: "maxId",
              max_quotes: "maxQuotes",
              max_replies: "maxReplies",
              max_retweets: "maxRetweets",
              media_type: "mediaType",
              min_bookmarks: "minBookmarks",
              min_faves: "minFaves",
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

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetGetRepliesParams} for more details.
        #
        # Returns direct replies. Omit mode for automatic maximum coverage with resumable
        # pagination. Complete mode returns nested replies, diagnostics, and 424 when
        # direct coverage stays below 80%.
        #
        # @overload get_replies(id, any_words: nil, blue_verified_only: nil, card_name: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_original_author: nil, exclude_source: nil, exclude_words: nil, from_user: nil, geocode: nil, hashtags: nil, has_media_only: nil, include_original_post: nil, in_reply_to_tweet_id: nil, language: nil, limit: nil, max_depth: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, mode: nil, native_retweets: nil, near: nil, news: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, scope: nil, since_date: nil, since_id: nil, since_time: nil, sort: nil, source: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within: nil, within_time: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get replies
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
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
        # @param exclude_original_author [Boolean] Exclude replies written by the source-post author.
        #
        # @param exclude_source [String] Exclude a source application.
        #
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param from_user [String] Filter by author username.
        #
        # @param geocode [String] Match latitude, longitude, and radius.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param has_media_only [Boolean] Only return replies containing media.
        #
        # @param include_original_post [Boolean] Include the source post and count it toward limit.
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param limit [Integer] With mode=complete, maximum combined direct and nested reply rows (1-25000, defa
        #
        # @param max_depth [Integer] Maximum reply depth from the source post.
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
        # @param media_type [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        # @param min_faves [Integer] Minimum likes threshold.
        #
        # @param min_quotes [Integer] Minimum quote count threshold.
        #
        # @param min_replies [Integer] Minimum replies threshold.
        #
        # @param min_retweets [Integer] Minimum retweets threshold.
        #
        # @param min_views [Integer] Minimum view count threshold.
        #
        # @param mode [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Mode] Optional advanced override. Omit mode for automatic maximum direct reply coverag
        #
        # @param native_retweets [Boolean] Only return native reposts.
        #
        # @param near [String] Match a place name.
        #
        # @param news [Boolean] Only return news results.
        #
        # @param page_size [Integer] Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20. Cont
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param safe [Boolean] Enable the safe-search filter.
        #
        # @param scope [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Scope] Select all replies, direct replies, or nested replies.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_id [String] Return Tweets newer than this Tweet ID.
        #
        # @param since_time [String] Unix timestamp - return replies posted after this time
        #
        # @param sort [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Sort] Sort the selected replies before applying limit.
        #
        # @param source [String] Match the source application.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param until_time [String] Unix timestamp - return replies posted before this time
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
        # @return [XTwitterScraper::Models::X::TweetGetRepliesResponse]
        #
        # @see XTwitterScraper::Models::X::TweetGetRepliesParams
        def get_replies(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetRepliesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/replies", id],
            query: query.transform_keys(
              any_words: "anyWords",
              blue_verified_only: "blueVerifiedOnly",
              card_name: "cardName",
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_original_author: "excludeOriginalAuthor",
              exclude_source: "excludeSource",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              has_media_only: "hasMediaOnly",
              include_original_post: "includeOriginalPost",
              in_reply_to_tweet_id: "inReplyToTweetId",
              max_depth: "maxDepth",
              max_faves: "maxFaves",
              max_id: "maxId",
              max_quotes: "maxQuotes",
              max_replies: "maxReplies",
              max_retweets: "maxRetweets",
              media_type: "mediaType",
              min_bookmarks: "minBookmarks",
              min_faves: "minFaves",
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
            model: XTwitterScraper::Models::X::TweetGetRepliesResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetGetRetweetersParams} for more details.
        #
        # List users who retweeted a tweet
        #
        # @overload get_retweeters(id, bio_contains: nil, cursor: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get retweeters
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param cursor [String] Pagination cursor for retweeters
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
        # @see XTwitterScraper::Models::X::TweetGetRetweetersParams
        def get_retweeters(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetRetweetersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/retweeters", id],
            query: query.transform_keys(
              bio_contains: "bioContains",
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

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetGetThreadParams} for more details.
        #
        # Get full conversation thread for a tweet
        #
        # @overload get_thread(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get thread context
        #
        # @param cursor [String] Pagination cursor for thread tweets
        #
        # @param page_size [Integer] Maximum page items (1-100, default 20). Source, filters, or credits can reduce r
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetGetThreadParams
        def get_thread(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetThreadParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/thread", id],
            query: query.transform_keys(page_size: "pageSize"),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::TweetSearchParams} for more details.
        #
        # No-mode search maximizes coverage.
        #
        # @overload search(q:, advanced_query: nil, any_words: nil, blue_verified_only: nil, bounding_box: nil, card_name: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_source: nil, exclude_words: nil, from_user: nil, geocode: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, limit: nil, list_id: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, mode: nil, native_retweets: nil, near: nil, news: nil, place: nil, place_country: nil, point_radius: nil, query_type: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, since_date: nil, since_id: nil, since_time: nil, source: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within: nil, within_time: nil, request_options: {})
        #
        # @param q [String] Query, Tweet ID, or status URL. Valid inline bounds apply per page.
        #
        # @param advanced_query [String] Raw advanced search query appended as-is.
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        # @param bounding_box [String] Geo bounding box, e.g. -74.1 40.6 -73.9 40.8.
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
        # @param from_user [String] Filter by author username.
        #
        # @param geocode [String] Match latitude, longitude, and radius.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param language [String] Language code filter, e.g. en or tr.
        #
        # @param limit [Integer] Result upper bound. Omit it for the existing 20-row page size. Explicit coverage
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
        # @param media_type [Symbol, XTwitterScraper::Models::X::TweetSearchParams::MediaType] Filter by media type.
        #
        # @param mentioning [String] Filter tweets mentioning a username.
        #
        # @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        # @param min_faves [Integer] Minimum likes threshold.
        #
        # @param min_quotes [Integer] Minimum quote count threshold.
        #
        # @param min_replies [Integer] Minimum replies threshold.
        #
        # @param min_retweets [Integer] Minimum retweets threshold.
        #
        # @param min_views [Integer] Minimum view count threshold.
        #
        # @param mode [Symbol, XTwitterScraper::Models::X::TweetSearchParams::Mode] Omit mode for resumable maximum coverage. Standard keeps legacy pagination. Cove
        #
        # @param native_retweets [Boolean] Only return native reposts.
        #
        # @param near [String] Match a place name.
        #
        # @param news [Boolean] Only return news results.
        #
        # @param place [String] Search within a place ID.
        #
        # @param place_country [String] Search within a country code.
        #
        # @param point_radius [String] Geo point radius, e.g. -73.99 40.73 25mi.
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::TweetSearchParams::QueryType] Sort order - Latest (chronological) or Top (engagement-ranked)
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::TweetSearchParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::TweetSearchParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::TweetSearchParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param safe [Boolean] Enable the safe-search filter.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_id [String] Return Tweets newer than this Tweet ID.
        #
        # @param since_time [String] Inclusive ISO bound.
        #
        # @param source [String] Match the source application.
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
        #
        # @param until_time [String] Exclusive ISO bound.
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
        # @return [XTwitterScraper::Models::PaginatedTweets, XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse]
        #
        # @see XTwitterScraper::Models::X::TweetSearchParams
        def search(params)
          parsed, options = XTwitterScraper::X::TweetSearchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/tweets/search",
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
              list_id: "listId",
              max_faves: "maxFaves",
              max_id: "maxId",
              max_quotes: "maxQuotes",
              max_replies: "maxReplies",
              max_retweets: "maxRetweets",
              media_type: "mediaType",
              min_bookmarks: "minBookmarks",
              min_faves: "minFaves",
              min_quotes: "minQuotes",
              min_replies: "minReplies",
              min_retweets: "minRetweets",
              min_views: "minViews",
              native_retweets: "nativeRetweets",
              place_country: "placeCountry",
              point_radius: "pointRadius",
              query_type: "queryType",
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
            model: XTwitterScraper::Models::X::TweetSearchResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
          @like = XTwitterScraper::Resources::X::Tweets::Like.new(client: client)
          @retweet = XTwitterScraper::Resources::X::Tweets::Retweet.new(client: client)
        end
      end
    end
  end
end
