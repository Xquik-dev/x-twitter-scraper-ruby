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

        # @return [XTwitterScraper::Resources::X::Tweets::Bookmark]
        attr_reader :bookmark

        # Create tweet
        #
        # @overload create(account:, idempotency_key:, community_id: nil, is_note_tweet: nil, media: nil, media_ids: nil, reply_to_tweet_id: nil, text: nil, request_options: {})
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
        # @param media_ids [Array<String>] Body param: Media IDs from `POST /x/media`, uploaded with this account. IDs last 24 hours. S
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
        # @overload retrieve(id, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Numeric tweet ID, 15-20 digits
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetRetrieveResponse]
        #
        # @see XTwitterScraper::Models::X::TweetRetrieveParams
        def retrieve(id, params = {})
          parsed, options = XTwitterScraper::X::TweetRetrieveParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s", id],
            query: query,
            model: XTwitterScraper::Models::X::TweetRetrieveResponse,
            options: options
          )
        end

        # Get multiple tweets by IDs
        #
        # @overload list(ids:, fields: nil, omit: nil, request_options: {})
        #
        # @param ids [String] Comma-separated tweet IDs (max 100)
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetListResponse]
        #
        # @see XTwitterScraper::Models::X::TweetListParams
        def list(params)
          parsed, options = XTwitterScraper::X::TweetListParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/tweets",
            query: query,
            model: XTwitterScraper::Models::X::TweetListResponse,
            options: options
          )
        end

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

        # Returns liker profiles that X makes visible for the post. X can withhold liker
        # identities even when the post reports likes. In that case this endpoint returns
        # 424 `favoriters_unavailable` instead of a misleading empty success.
        #
        # @overload get_favoriters(id, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, omit: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get favoriters
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        # @param cursor [String] Pagination cursor for favoriters
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
        # @see XTwitterScraper::Models::X::TweetGetFavoritersParams
        def get_favoriters(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetFavoritersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/favoriters", id],
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

        # List quote tweets of a tweet
        #
        # @overload get_quotes(id, advanced_query: nil, any_words: nil, blue_verified_only: nil, bounding_box: nil, card_name: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_source: nil, exclude_words: nil, fields: nil, from_user: nil, geocode: nil, hashtags: nil, include_replies: nil, in_reply_to_tweet_id: nil, keywords: nil, language: nil, list_id: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, mode: nil, native_retweets: nil, near: nil, news: nil, omit: nil, page_size: nil, place: nil, place_country: nil, point_radius: nil, query_type: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, since_date: nil, since_id: nil, since_time: nil, source: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within: nil, within_time: nil, request_options: {})
        #
        # @param id [String] Numeric tweet ID to get quotes, 15-20 digits
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
        # @param cursor [String] Pagination cursor for quote tweets
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
        # @param include_replies [Boolean] Include reply quotes (default false)
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
        # @param media_type [Symbol, XTwitterScraper::Models::X::TweetGetQuotesParams::MediaType] Filter by media type.
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
        # @param mode [Symbol, XTwitterScraper::Models::X::TweetGetQuotesParams::Mode] Optional legacy pagination override. Filters such as keywords don't apply with i
        #
        # @param native_retweets [Boolean] Only return native reposts.
        #
        # @param near [String] Match a place name.
        #
        # @param news [Boolean] Only return news results.
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
        # @param query_type [Symbol, XTwitterScraper::Models::X::TweetGetQuotesParams::QueryType] Latest for newest first, or Top for the quotes X ranks highest. A later Latest p
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
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Returns direct replies. Omit mode for automatic maximum coverage with resumable
        # pagination. Complete mode returns nested replies, diagnostics, and 424 when
        # direct coverage stays below 80%.
        #
        # @overload get_replies(id, after: nil, any_words: nil, blue_verified_only: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_original_author: nil, exclude_words: nil, fields: nil, from_user: nil, hashtags: nil, has_media_only: nil, include_hidden: nil, include_original_post: nil, in_reply_to_tweet_id: nil, language: nil, limit: nil, max_depth: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, mode: nil, native_retweets: nil, omit: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, scope: nil, since_date: nil, since_id: nil, since_time: nil, sort: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within_time: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get replies
        #
        # @param after [String] Legacy cursor alias. Prefer cursor.
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
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
        # @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param from_user [String] Filter by author username.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param has_media_only [Boolean] Only return replies containing media.
        #
        # @param include_hidden [Boolean] Complete mode only. Adds the replies the post's author hid, each with hiddenByAu
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
        # @param mode [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Mode] Optional advanced override. Omit mode for automatic maximum direct reply coverag
        #
        # @param native_retweets [Boolean] Only return native reposts.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
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
              conversation_id: "conversationId",
              exact_phrase: "exactPhrase",
              exclude_original_author: "excludeOriginalAuthor",
              exclude_words: "excludeWords",
              from_user: "fromUser",
              has_media_only: "hasMediaOnly",
              include_hidden: "includeHidden",
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

        # List users who retweeted a tweet
        #
        # @overload get_retweeters(id, bio_contains: nil, blue_verified_only: nil, business_email_only: nil, cursor: nil, email_domains: nil, enrich_profiles: nil, fields: nil, has_email: nil, has_location: nil, has_website: nil, include_retweet_timestamp: nil, location_contains: nil, max_followers: nil, max_following: nil, max_statuses: nil, min_account_age_days: nil, min_followers: nil, min_following: nil, min_statuses: nil, omit: nil, page_size: nil, username_contains: nil, verified_only: nil, verified_type: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get retweeters
        #
        # @param bio_contains [String] Match any comma-separated or line-separated bio term, ignoring case.
        #
        # @param blue_verified_only [Boolean] Only return profiles X marks as blue verified. X marks many business & governmen
        #
        # @param business_email_only [Boolean] Only return profiles that publish an email outside free webmail, such as Gmail.
        #
        # @param cursor [String] Pagination cursor for retweeters
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
        # @param include_retweet_timestamp [Boolean] Look up repost event times.
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
        # @see XTwitterScraper::Models::X::TweetGetRetweetersParams
        def get_retweeters(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetRetweetersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/retweeters", id],
            query: query.transform_keys(
              bio_contains: "bioContains",
              blue_verified_only: "blueVerifiedOnly",
              business_email_only: "businessEmailOnly",
              email_domains: "emailDomains",
              enrich_profiles: "enrichProfiles",
              has_email: "hasEmail",
              has_location: "hasLocation",
              has_website: "hasWebsite",
              include_retweet_timestamp: "includeRetweetTimestamp",
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

        # Get full conversation thread for a tweet
        #
        # @overload get_thread(id, any_words: nil, blue_verified_only: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, fields: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, omit: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, since_id: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, within_time: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get thread context
        #
        # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        # @param conversation_id [String] Conversation ID filter.
        #
        # @param cursor [String] Pagination cursor for thread tweets
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
        # @param max_id [String] Return Tweets at or below this ID.
        #
        # @param max_quotes [Integer] Maximum quotes threshold.
        #
        # @param max_replies [Integer] Maximum replies threshold.
        #
        # @param max_retweets [Integer] Maximum retweets threshold.
        #
        # @param media_type [Symbol, XTwitterScraper::Models::X::TweetGetThreadParams::MediaType] Filter by media type.
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
        # @param quotes [Symbol, XTwitterScraper::Models::X::TweetGetThreadParams::Quotes] Quote mode.
        #
        # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        # @param replies [Symbol, XTwitterScraper::Models::X::TweetGetThreadParams::Replies] Reply mode.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::TweetGetThreadParams::Retweets] Retweet mode.
        #
        # @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        # @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        # @param since_id [String] Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id` bo
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param until_date [Date] End date in YYYY-MM-DD format.
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
        # @see XTwitterScraper::Models::X::TweetGetThreadParams
        def get_thread(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetThreadParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/thread", id],
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

        # No-mode search maximizes coverage. New cursorless `Latest` sessions return rows
        # newest-first across cursor pages. Existing cursors preserve their established
        # ordering.
        #
        # @overload search(q: nil, advanced_query: nil, any_words: nil, blue_verified_only: nil, bounding_box: nil, card_name: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_source: nil, exclude_words: nil, fields: nil, from_user: nil, geocode: nil, hashtags: nil, image_shows: nil, in_reply_to_tweet_id: nil, keywords: nil, language: nil, limit: nil, list_id: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, mode: nil, native_retweets: nil, near: nil, news: nil, omit: nil, place: nil, place_country: nil, point_radius: nil, query_type: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, since_date: nil, since_id: nil, since_time: nil, source: nil, text_only_terms: nil, to_user: nil, topic: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within: nil, within_time: nil, request_options: {})
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
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        # @param from_user [String] Filter by author username.
        #
        # @param geocode [String] Match latitude, longitude, and radius.
        #
        # @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        # @param image_shows [String] Keep only posts whose photos show this. Send charts, screenshots, product_photos
        #
        # @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        # @param keywords [String] Words the Tweets must match, in X search syntax.
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
        # @param mode [Symbol, XTwitterScraper::Models::X::TweetSearchParams::Mode] Omit mode for resumable maximum coverage. Standard keeps legacy pagination. Cove
        #
        # @param native_retweets [Boolean] Only return native reposts.
        #
        # @param near [String] Match a place name.
        #
        # @param news [Boolean] Only return news results.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
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
        # @param text_only_terms [String] Keeps a post only when at least 1 of these words or quoted phrases appears outsi
        #
        # @param to_user [String] Filter replies sent to a username.
        #
        # @param topic [String] Keep only posts about this topic. AI-powered analysis asks "Is this post about <
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
        # @return [XTwitterScraper::Models::TopicFilteredTweets, XTwitterScraper::Models::ImageFilteredTweets, XTwitterScraper::Models::PaginatedTweets, XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse]
        #
        # @see XTwitterScraper::Models::X::TweetSearchParams
        def search(params = {})
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
              image_shows: "imageShows",
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
              place_country: "placeCountry",
              point_radius: "pointRadius",
              query_type: "queryType",
              quotes_of_tweet_id: "quotesOfTweetId",
              retweets_of_tweet_id: "retweetsOfTweetId",
              since_date: "sinceDate",
              since_id: "sinceId",
              since_time: "sinceTime",
              text_only_terms: "textOnlyTerms",
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

        # Returns where each t.co link leads, as X's own redirect says. Xquik reads the
        # redirect and never visits the target site. A link t.co does not have comes back
        # without `resolvedUrl` and costs nothing. A link X does not answer for in time
        # comes back in `unprocessedUrls`, free. Each resolved link costs 1 credit.
        #
        # @overload resolve_links(urls:, fields: nil, omit: nil, request_options: {})
        #
        # @param urls [String] Links of the form `https://t.co/Xe1nm2pkSX`, separated by commas, as many as the URL holds. Any other link is refused. A link sent twice counts once. A longer URL fails at the edge before Xquik reads it.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetResolveLinksResponse]
        #
        # @see XTwitterScraper::Models::X::TweetResolveLinksParams
        def resolve_links(params)
          parsed, options = XTwitterScraper::Models::X::TweetResolveLinksParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/links/resolve",
            query: query,
            model: XTwitterScraper::Models::X::TweetResolveLinksResponse,
            options: options
          )
        end

        # Returns the tweets X ranks highest by 1 metric over the last day, week or month.
        # Covers all of X unless you pick a country or a language. Pages hold up to 20
        # tweets, and the list ends at 100. Each tweet costs 1 credit. Top tweet lists
        # come back reliably.
        #
        # @overload list_top(metric: nil, window: nil, country: nil, language: nil, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param metric [Symbol, XTwitterScraper::Models::X::TweetListTopParams::Metric] What to rank tweets by. Defaults to likes. Singular names work too, such as like.
        #
        # @param window [Symbol, XTwitterScraper::Models::X::TweetListTopParams::Window] How far back to look. Defaults to day. Also takes 24h, 7d, 30d, daily, weekly and monthly.
        #
        # @param country [String] Only tweets from 1 country, as a 2- or 3-letter ISO 3166 code, such as US or USA. Send country or language, not both.
        #
        # @param language [String] Only tweets in 1 language, as a 2-letter code, such as en. Send country or language, not both.
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
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetListTopParams
        def list_top(params = {})
          parsed, options = XTwitterScraper::Models::X::TweetListTopParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/tweets/top",
            query: query,
            model: XTwitterScraper::Models::PaginatedTweets,
            options: options
          )
        end

        # Returns the HTML that X gives websites to embed 1 public tweet, with the tweet's
        # link and author.
        #
        # @overload embed(id, theme: nil, hide_media: nil, hide_thread: nil, omit_script: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com & twitter.com links with or without https://, www., mobile., a query or a fragment, & /i/status or /i/web/status links. Anything else gets 400 `invalid_tweet_id`.
        #
        # @param theme [Symbol, XTwitterScraper::Models::X::TweetEmbedParams::Theme] Color theme of the embed. X uses light when left out.
        #
        # @param hide_media [Boolean] Set `true` to leave photos, videos, and link cards out.
        #
        # @param hide_thread [Boolean] Set `true` to leave the tweet this one replies to out.
        #
        # @param omit_script [Boolean] Set `true` to leave the widget script tag out, for pages that load it once themselves.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetEmbedResponse]
        #
        # @see XTwitterScraper::Models::X::TweetEmbedParams
        def embed(id, params = {})
          parsed, options = XTwitterScraper::Models::X::TweetEmbedParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/embed", id],
            query: query,
            model: XTwitterScraper::Models::X::TweetEmbedResponse,
            options: options
          )
        end

        # Returns the replies the post's author hid, oldest first, with the replies to
        # them. A post without hidden replies returns an empty list.
        #
        # @overload get_hidden_replies(id, cursor: nil, page_size: nil, from_user: nil, to_user: nil, mentioning: nil, language: nil, since_date: nil, until_date: nil, media_type: nil, min_likes: nil, min_retweets: nil, min_replies: nil, min_quotes: nil, min_views: nil, min_bookmarks: nil, max_faves: nil, max_retweets: nil, max_replies: nil, max_quotes: nil, blue_verified_only: nil, since_id: nil, max_id: nil, within_time: nil, native_retweets: nil, verified_only: nil, replies: nil, retweets: nil, quotes: nil, exact_phrase: nil, exclude_words: nil, any_words: nil, hashtags: nil, cashtags: nil, url: nil, conversation_id: nil, in_reply_to_tweet_id: nil, quotes_of_tweet_id: nil, retweets_of_tweet_id: nil, fields: nil, omit: nil, request_options: {})
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
        # @param media_type [Symbol, XTwitterScraper::Models::X::TweetGetHiddenRepliesParams::MediaType] Filter media. Its aliases are has_video & has_media.
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
        # @param replies [Symbol, XTwitterScraper::Models::X::TweetGetHiddenRepliesParams::Replies] Reply mode. Exclude keeps own-thread replies.
        #
        # @param retweets [Symbol, XTwitterScraper::Models::X::TweetGetHiddenRepliesParams::Retweets] Only when the caller requests a repost mode.
        #
        # @param quotes [Symbol, XTwitterScraper::Models::X::TweetGetHiddenRepliesParams::Quotes] Only when the caller requests a quote mode.
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
        # @see XTwitterScraper::Models::X::TweetGetHiddenRepliesParams
        def get_hidden_replies(id, params = {})
          parsed, options = XTwitterScraper::Models::X::TweetGetHiddenRepliesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/hidden-replies", id],
            query: query,
            model: XTwitterScraper::Models::PaginatedTweets,
            options: options
          )
        end

        # Returns engagement insights for 1 tweet. They are engagements per hour since it
        # went up, per view and per follower of its author, and how far it spread. Each
        # report costs 1 credit, whatever it reads.
        #
        # @overload get_insights(id, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com & twitter.com links with or without https://, www., mobile., a query or a fragment, & /i/status or /i/web/status links. Anything else gets 400 `invalid_tweet_id`.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetGetInsightsResponse]
        #
        # @see XTwitterScraper::Models::X::TweetGetInsightsParams
        def get_insights(id, params = {})
          parsed, options = XTwitterScraper::Models::X::TweetGetInsightsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/insights", id],
            query: query,
            model: XTwitterScraper::Models::X::TweetGetInsightsResponse,
            options: options
          )
        end

        # Returns the user IDs of a post's reposters, in the order & pages of
        # /x/tweets/{id}/retweeters. Use it when you need IDs only. Each ID costs 1
        # credit. A post nobody reposted returns an empty list for free.
        #
        # @overload get_retweeter_ids(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String] Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com & twitter.com links with or without https://, www., mobile., a query or a fragment, & /i/status or /i/web/status links. Anything else gets 400 `invalid_tweet_id`.
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] Profiles to request from this page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 200. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUserIds]
        #
        # @see XTwitterScraper::Models::X::TweetGetRetweeterIdsParams
        def get_retweeter_ids(id, params = {})
          parsed, options = XTwitterScraper::Models::X::TweetGetRetweeterIdsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/retweeter-ids", id],
            query: query,
            model: XTwitterScraper::Models::PaginatedUserIds,
            options: options
          )
        end

        # Returns whether 1 account reposted the post. It finds recent reposts. An older
        # repost can return false, with complete false. Each check costs 1 credit.
        #
        # @overload check_repost(id, user:, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String]
        #
        # @param user [String] User ID, username with or without @, or profile URL.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetCheckRepostResponse]
        #
        # @see XTwitterScraper::Models::X::TweetCheckRepostParams
        def check_repost(id, params)
          parsed, options = XTwitterScraper::Models::X::TweetCheckRepostParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/retweeters/check", id],
            query: query,
            model: XTwitterScraper::Models::X::TweetCheckRepostResponse,
            options: options
          )
        end

        # Returns the caption tracks of 1 public tweet's videos. Each track has its
        # language, name, timed cues, and full text. A tweet without video, or a video
        # without captions, returns no track and costs nothing. Video subtitles come with
        # timed cues.
        #
        # @overload get_subtitles(id, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com & twitter.com links with or without https://, www., mobile., a query or a fragment, & /i/status or /i/web/status links. Anything else gets 400 `invalid_tweet_id`.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetGetSubtitlesResponse]
        #
        # @see XTwitterScraper::Models::X::TweetGetSubtitlesParams
        def get_subtitles(id, params = {})
          parsed, options = XTwitterScraper::Models::X::TweetGetSubtitlesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/subtitles", id],
            query: query,
            model: XTwitterScraper::Models::X::TweetGetSubtitlesResponse,
            options: options
          )
        end

        # Returns X's own translation of 1 public tweet into the language you pick, with
        # the links, mentions, and tags X places in the translated text. Posts & bios can
        # be translated into your language.
        #
        # @overload translate(id, language:, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com & twitter.com links with or without https://, www., mobile., a query or a fragment, & /i/status or /i/web/status links. Anything else gets 400 `invalid_tweet_id`.
        #
        # @param language [String] Language code to translate into, such as `en`, `tr`, `pt-br`, or `zh-tw`. Upper and lower case both work.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetTranslateResponse]
        #
        # @see XTwitterScraper::Models::X::TweetTranslateParams
        def translate(id, params)
          parsed, options = XTwitterScraper::Models::X::TweetTranslateParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/translation", id],
            query: query,
            model: XTwitterScraper::Models::X::TweetTranslateResponse,
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
          @bookmark = XTwitterScraper::Resources::X::Tweets::Bookmark.new(client: client)
        end
      end
    end
  end
end
