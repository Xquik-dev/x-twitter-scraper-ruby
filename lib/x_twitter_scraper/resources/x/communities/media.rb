# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Communities
        class Media
          # Returns the tweets with photos or videos on 1 community's Media tab, newest
          # first. Each tweet costs 1 credit.
          #
          # @overload list(id, cursor: nil, page_size: nil, from_user: nil, to_user: nil, mentioning: nil, language: nil, since_date: nil, until_date: nil, media_type: nil, min_likes: nil, min_retweets: nil, min_replies: nil, min_quotes: nil, min_views: nil, min_bookmarks: nil, max_faves: nil, max_retweets: nil, max_replies: nil, max_quotes: nil, blue_verified_only: nil, since_id: nil, max_id: nil, within_time: nil, native_retweets: nil, verified_only: nil, replies: nil, retweets: nil, quotes: nil, exact_phrase: nil, exclude_words: nil, any_words: nil, hashtags: nil, cashtags: nil, url: nil, conversation_id: nil, in_reply_to_tweet_id: nil, quotes_of_tweet_id: nil, retweets_of_tweet_id: nil, fields: nil, omit: nil, request_options: {})
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
          # @param media_type [Symbol, XTwitterScraper::Models::X::Communities::MediaListParams::MediaType] Filter media. Its aliases are has_video & has_media.
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
          # @param replies [Symbol, XTwitterScraper::Models::X::Communities::MediaListParams::Replies] Reply mode. Exclude keeps own-thread replies.
          #
          # @param retweets [Symbol, XTwitterScraper::Models::X::Communities::MediaListParams::Retweets] Only when the caller requests a repost mode.
          #
          # @param quotes [Symbol, XTwitterScraper::Models::X::Communities::MediaListParams::Quotes] Only when the caller requests a quote mode.
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
          # @see XTwitterScraper::Models::X::Communities::MediaListParams
          def list(id, params = {})
            parsed, options = XTwitterScraper::Models::X::Communities::MediaListParams.dump_request(params)
            query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: ["x/communities/%1$s/media", id],
              query: query,
              model: XTwitterScraper::Models::PaginatedTweets,
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
