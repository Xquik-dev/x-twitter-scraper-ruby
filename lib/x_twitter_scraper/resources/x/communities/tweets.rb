# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X Community info, members, and tweets
        class Tweets
          # Requires a Community ID and keyword query.
          #
          # @overload list(q:, community_id: nil, any_words: nil, blue_verified_only: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, fields: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, omit: nil, page_size: nil, query_type: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, since_id: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, within_time: nil, request_options: {})
          #
          # @param q [String] Keyword query within the selected community
          #
          # @param community_id [String] Numeric ID of the community to search
          #
          # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
          #
          # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
          #
          # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
          #
          # @param conversation_id [String] Conversation ID filter.
          #
          # @param cursor [String] Pagination cursor for community results
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
          # @param media_type [Symbol, XTwitterScraper::Models::X::Communities::TweetListParams::MediaType] Filter media. Its aliases are has_video & has_media.
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
          # @param page_size [Integer] Maximum page items (1-100, default 20). Source, filters, or credits can reduce r
          #
          # @param query_type [Symbol, XTwitterScraper::Models::X::Communities::TweetListParams::QueryType] Sort order for community results (Latest or Top)
          #
          # @param quotes [Symbol, XTwitterScraper::Models::X::Communities::TweetListParams::Quotes] Only when the caller requests a quote mode.
          #
          # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
          #
          # @param replies [Symbol, XTwitterScraper::Models::X::Communities::TweetListParams::Replies] Reply mode. Exclude keeps own-thread replies.
          #
          # @param retweets [Symbol, XTwitterScraper::Models::X::Communities::TweetListParams::Retweets] Only when the caller requests a repost mode.
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
          # @see XTwitterScraper::Models::X::Communities::TweetListParams
          def list(params)
            parsed, options = XTwitterScraper::X::Communities::TweetListParams.dump_request(params)
            query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: "x/communities/tweets",
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

          # List tweets posted in a community
          #
          # @overload list_by_community(id, any_words: nil, blue_verified_only: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, fields: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, omit: nil, page_size: nil, query_type: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, since_date: nil, since_id: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, within_time: nil, request_options: {})
          #
          # @param id [String] Community ID for tweet lookup
          #
          # @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
          #
          # @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
          #
          # @param cashtags [String] Cashtags separated by spaces, commas, or lines.
          #
          # @param conversation_id [String] Conversation ID filter.
          #
          # @param cursor [String] Pagination cursor for community tweets
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
          # @param media_type [Symbol, XTwitterScraper::Models::X::Communities::TweetListByCommunityParams::MediaType] Filter media. Its aliases are has_video & has_media.
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
          # @param page_size [Integer] Maximum page items (1-100, default 20). Source, filters, or credits can reduce r
          #
          # @param query_type [Symbol, XTwitterScraper::Models::X::Communities::TweetListByCommunityParams::QueryType] Latest for newest first, or Top for the posts X ranks highest. Any case works. A
          #
          # @param quotes [Symbol, XTwitterScraper::Models::X::Communities::TweetListByCommunityParams::Quotes] Only when the caller requests a quote mode.
          #
          # @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
          #
          # @param replies [Symbol, XTwitterScraper::Models::X::Communities::TweetListByCommunityParams::Replies] Reply mode. Exclude keeps own-thread replies.
          #
          # @param retweets [Symbol, XTwitterScraper::Models::X::Communities::TweetListByCommunityParams::Retweets] Only when the caller requests a repost mode.
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
          # @see XTwitterScraper::Models::X::Communities::TweetListByCommunityParams
          def list_by_community(id, params = {})
            parsed, options = XTwitterScraper::X::Communities::TweetListByCommunityParams.dump_request(params)
            query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: ["x/communities/%1$s/tweets", id],
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
end
