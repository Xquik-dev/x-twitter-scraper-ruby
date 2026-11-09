# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Communities
        # @see XTwitterScraper::Resources::X::Communities::Tweets#list
        class TweetListParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          # @!attribute community_id
          #   Numeric ID of the community to search
          #
          #   @return [String]
          required :community_id, String

          # @!attribute q
          #   Keyword query within the selected community
          #
          #   @return [String]
          required :q, String

          # @!attribute any_words
          #   Words or quoted phrases where any one can match. Separate with spaces, commas,
          #   or lines.
          #
          #   @return [String, nil]
          optional :any_words, String

          # @!attribute blue_verified_only
          #   Only return tweets from Blue-verified authors.
          #
          #   @return [Boolean, nil]
          optional :blue_verified_only, XTwitterScraper::Internal::Type::Boolean

          # @!attribute cashtags
          #   Cashtags separated by spaces, commas, or lines.
          #
          #   @return [String, nil]
          optional :cashtags, String

          # @!attribute conversation_id
          #   Conversation ID filter.
          #
          #   @return [String, nil]
          optional :conversation_id, String

          # @!attribute cursor
          #   Pagination cursor for community results
          #
          #   @return [String, nil]
          optional :cursor, String

          # @!attribute exact_phrase
          #   Match this exact phrase, word for word.
          #
          #   @return [String, nil]
          optional :exact_phrase, String

          # @!attribute exclude_words
          #   Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          #
          #   @return [String, nil]
          optional :exclude_words, String

          # @!attribute fields
          #   Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          #   author.username. A list keeps the field in each item. Case & underscores do not
          #   matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          #   always stay. An unknown name answers 400 unknown_field with the valid names,
          #   before any read. The price stays the same. SDK row types then hold only the
          #   named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          #   the fields you need with `fields` & `omit`.
          #
          #   @return [String, nil]
          optional :fields, String

          # @!attribute from_user
          #   Filter by author username. Account searches include all of the account's posts &
          #   reposts.
          #
          #   @return [String, nil]
          optional :from_user, String

          # @!attribute hashtags
          #   Hashtags separated by spaces, commas, or lines.
          #
          #   @return [String, nil]
          optional :hashtags, String

          # @!attribute in_reply_to_tweet_id
          #   Only replies to this tweet ID.
          #
          #   @return [String, nil]
          optional :in_reply_to_tweet_id, String

          # @!attribute language
          #   Filter by language. Its alias is `lang`. Language filters work for every
          #   language X tags.
          #
          #   @return [String, nil]
          optional :language, String

          # @!attribute max_faves
          #   Maximum likes threshold. maxLikes & max_likes also work.
          #
          #   @return [Integer, nil]
          optional :max_faves, Integer

          # @!attribute max_id
          #   Return Tweets at or below this ID.
          #
          #   @return [String, nil]
          optional :max_id, String

          # @!attribute max_quotes
          #   Maximum quotes threshold.
          #
          #   @return [Integer, nil]
          optional :max_quotes, Integer

          # @!attribute max_replies
          #   Maximum replies threshold.
          #
          #   @return [Integer, nil]
          optional :max_replies, Integer

          # @!attribute max_retweets
          #   Maximum retweets threshold.
          #
          #   @return [Integer, nil]
          optional :max_retweets, Integer

          # @!attribute mentioning
          #   Filter tweets mentioning a username.
          #
          #   @return [String, nil]
          optional :mentioning, String

          # @!attribute min_bookmarks
          #   Minimum bookmark count threshold.
          #
          #   @return [Integer, nil]
          optional :min_bookmarks, Integer

          # @!attribute min_likes
          #   Minimum likes. Its aliases are minFaves, min_likes & min_faves.
          #
          #   @return [Integer, nil]
          optional :min_likes, Integer

          # @!attribute min_quotes
          #   Minimum quote count threshold.
          #
          #   @return [Integer, nil]
          optional :min_quotes, Integer

          # @!attribute min_replies
          #   Minimum replies threshold.
          #
          #   @return [Integer, nil]
          optional :min_replies, Integer

          # @!attribute min_retweets
          #   Minimum retweets threshold.
          #
          #   @return [Integer, nil]
          optional :min_retweets, Integer

          # @!attribute min_views
          #   Minimum view count threshold.
          #
          #   @return [Integer, nil]
          optional :min_views, Integer

          # @!attribute native_retweets
          #   Only return native reposts.
          #
          #   @return [Boolean, nil]
          optional :native_retweets, XTwitterScraper::Internal::Type::Boolean

          # @!attribute omit
          #   Fields to drop from each row, comma-separated. It takes the same names as
          #   fields. With fields, it drops from the kept fields. A longer URL fails at the
          #   edge before Xquik reads it.
          #
          #   @return [String, nil]
          optional :omit, String

          # @!attribute page_size
          #   Maximum page items (1-100, default 20). Source, filters, or credits can reduce
          #   results. Continue while has_next_page is true. Deprecated limit and count
          #   aliases remain accepted.
          #
          #   @return [Integer, nil]
          optional :page_size, Integer

          # @!attribute query_type
          #   Sort order for community results (Latest or Top)
          #
          #   @return [Symbol, XTwitterScraper::Models::X::Communities::TweetListParams::QueryType, nil]
          optional :query_type, enum: -> { XTwitterScraper::X::Communities::TweetListParams::QueryType }

          # @!attribute quotes_of_tweet_id
          #   Only quotes of this tweet ID.
          #
          #   @return [String, nil]
          optional :quotes_of_tweet_id, String

          # @!attribute retweets_of_tweet_id
          #   Only retweets of this tweet ID.
          #
          #   @return [String, nil]
          optional :retweets_of_tweet_id, String

          # @!attribute since_date
          #   Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any
          #   common form.
          #
          #   @return [Date, nil]
          optional :since_date, Date

          # @!attribute since_id
          #   Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id`
          #   bounds.
          #
          #   @return [String, nil]
          optional :since_id, String

          # @!attribute to_user
          #   Filter replies sent to a username.
          #
          #   @return [String, nil]
          optional :to_user, String

          # @!attribute until_date
          #   End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
          #
          #   @return [Date, nil]
          optional :until_date, Date

          # @!attribute url
          #   URL substring or domain filter.
          #
          #   @return [String, nil]
          optional :url, String

          # @!attribute verified_only
          #   Only return tweets from verified authors.
          #
          #   @return [Boolean, nil]
          optional :verified_only, XTwitterScraper::Internal::Type::Boolean

          # @!attribute within_time
          #   Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
          #   h or d.
          #
          #   @return [String, nil]
          optional :within_time, String

          # @!method initialize(community_id:, q:, any_words: nil, blue_verified_only: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_words: nil, fields: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, mentioning: nil, min_bookmarks: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, omit: nil, page_size: nil, query_type: nil, quotes_of_tweet_id: nil, retweets_of_tweet_id: nil, since_date: nil, since_id: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, within_time: nil, request_options: {})
          #   @param community_id [String] Numeric ID of the community to search
          #
          #   @param q [String] Keyword query within the selected community
          #
          #   @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
          #
          #   @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
          #
          #   @param cashtags [String] Cashtags separated by spaces, commas, or lines.
          #
          #   @param conversation_id [String] Conversation ID filter.
          #
          #   @param cursor [String] Pagination cursor for community results
          #
          #   @param exact_phrase [String] Match this exact phrase, word for word.
          #
          #   @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          #
          #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          #
          #   @param from_user [String] Filter by author username. Account searches include all of the account's posts &
          #
          #   @param hashtags [String] Hashtags separated by spaces, commas, or lines.
          #
          #   @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
          #
          #   @param language [String] Filter by language. Its alias is `lang`. Language filters work for every languag
          #
          #   @param max_faves [Integer] Maximum likes threshold. maxLikes & max_likes also work.
          #
          #   @param max_id [String] Return Tweets at or below this ID.
          #
          #   @param max_quotes [Integer] Maximum quotes threshold.
          #
          #   @param max_replies [Integer] Maximum replies threshold.
          #
          #   @param max_retweets [Integer] Maximum retweets threshold.
          #
          #   @param mentioning [String] Filter tweets mentioning a username.
          #
          #   @param min_bookmarks [Integer] Minimum bookmark count threshold.
          #
          #   @param min_likes [Integer] Minimum likes. Its aliases are minFaves, min_likes & min_faves.
          #
          #   @param min_quotes [Integer] Minimum quote count threshold.
          #
          #   @param min_replies [Integer] Minimum replies threshold.
          #
          #   @param min_retweets [Integer] Minimum retweets threshold.
          #
          #   @param min_views [Integer] Minimum view count threshold.
          #
          #   @param native_retweets [Boolean] Only return native reposts.
          #
          #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
          #
          #   @param page_size [Integer] Maximum page items (1-100, default 20). Source, filters, or credits can reduce r
          #
          #   @param query_type [Symbol, XTwitterScraper::Models::X::Communities::TweetListParams::QueryType] Sort order for community results (Latest or Top)
          #
          #   @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
          #
          #   @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
          #
          #   @param since_date [Date] Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any com
          #
          #   @param since_id [String] Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id` bo
          #
          #   @param to_user [String] Filter replies sent to a username.
          #
          #   @param until_date [Date] End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
          #
          #   @param url [String] URL substring or domain filter.
          #
          #   @param verified_only [Boolean] Only return tweets from verified authors.
          #
          #   @param within_time [String] Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
          #
          #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

          # Sort order for community results (Latest or Top)
          module QueryType
            extend XTwitterScraper::Internal::Type::Enum

            LATEST = :Latest
            TOP = :Top

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
