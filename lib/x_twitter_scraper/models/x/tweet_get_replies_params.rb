# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#get_replies
      class TweetGetRepliesParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

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

        # @!attribute card_name
        #   Match the Tweet card name.
        #
        #   @return [String, nil]
        optional :card_name, String

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
        #   Cursor from the previous response. Xquik cursors resume automatic coverage.
        #   Existing unprefixed cursors keep legacy standard behavior.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute exact_phrase
        #   Exact phrase to match.
        #
        #   @return [String, nil]
        optional :exact_phrase, String

        # @!attribute exclude_original_author
        #   Exclude replies written by the source-post author.
        #
        #   @return [Boolean, nil]
        optional :exclude_original_author, XTwitterScraper::Internal::Type::Boolean

        # @!attribute exclude_source
        #   Exclude a source application.
        #
        #   @return [String, nil]
        optional :exclude_source, String

        # @!attribute exclude_words
        #   Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        #   @return [String, nil]
        optional :exclude_words, String

        # @!attribute from_user
        #   Filter by author username.
        #
        #   @return [String, nil]
        optional :from_user, String

        # @!attribute geocode
        #   Match latitude, longitude, and radius.
        #
        #   @return [String, nil]
        optional :geocode, String

        # @!attribute hashtags
        #   Hashtags separated by spaces, commas, or lines.
        #
        #   @return [String, nil]
        optional :hashtags, String

        # @!attribute has_media_only
        #   Only return replies containing media.
        #
        #   @return [Boolean, nil]
        optional :has_media_only, XTwitterScraper::Internal::Type::Boolean

        # @!attribute include_original_post
        #   Include the source post and count it toward limit.
        #
        #   @return [Boolean, nil]
        optional :include_original_post, XTwitterScraper::Internal::Type::Boolean

        # @!attribute in_reply_to_tweet_id
        #   Only replies to this tweet ID.
        #
        #   @return [String, nil]
        optional :in_reply_to_tweet_id, String

        # @!attribute language
        #   Language code filter, e.g. en or tr.
        #
        #   @return [String, nil]
        optional :language, String

        # @!attribute limit
        #   With mode=complete, maximum combined direct and nested reply rows (1-25000,
        #   default 25000). Automatic pages accept 1-300. Standard pages accept 1-100.
        #   Prefer pageSize outside complete mode.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute max_depth
        #   Maximum reply depth from the source post.
        #
        #   @return [Integer, nil]
        optional :max_depth, Integer

        # @!attribute max_faves
        #   Maximum likes threshold. maxLikes is also accepted.
        #
        #   @return [Integer, nil]
        optional :max_faves, Integer

        # @!attribute max_id
        #   Return Tweets older than this Tweet ID.
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

        # @!attribute media_type
        #   Filter by media type.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::MediaType, nil]
        optional :media_type, enum: -> { XTwitterScraper::X::TweetGetRepliesParams::MediaType }

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

        # @!attribute min_faves
        #   Minimum likes threshold. minLikes is also accepted.
        #
        #   @return [Integer, nil]
        optional :min_faves, Integer

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

        # @!attribute mode
        #   Optional advanced override. Omit mode for automatic maximum direct reply
        #   coverage with pagination. Standard keeps legacy pagination. Complete returns
        #   direct and nested replies with diagnostics, scope, depth, sorting, and
        #   original-post controls.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Mode, nil]
        optional :mode, enum: -> { XTwitterScraper::X::TweetGetRepliesParams::Mode }

        # @!attribute native_retweets
        #   Only return native reposts.
        #
        #   @return [Boolean, nil]
        optional :native_retweets, XTwitterScraper::Internal::Type::Boolean

        # @!attribute near
        #   Match a place name.
        #
        #   @return [String, nil]
        optional :near, String

        # @!attribute news
        #   Only return news results.
        #
        #   @return [Boolean, nil]
        optional :news, XTwitterScraper::Internal::Type::Boolean

        # @!attribute page_size
        #   Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20.
        #   Continue while has_next_page is true. Deprecated aliases remain accepted.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer

        # @!attribute quotes
        #   Quote mode.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Quotes, nil]
        optional :quotes, enum: -> { XTwitterScraper::X::TweetGetRepliesParams::Quotes }

        # @!attribute quotes_of_tweet_id
        #   Only quotes of this tweet ID.
        #
        #   @return [String, nil]
        optional :quotes_of_tweet_id, String

        # @!attribute replies
        #   Reply mode.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Replies, nil]
        optional :replies, enum: -> { XTwitterScraper::X::TweetGetRepliesParams::Replies }

        # @!attribute retweets
        #   Retweet mode.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Retweets, nil]
        optional :retweets, enum: -> { XTwitterScraper::X::TweetGetRepliesParams::Retweets }

        # @!attribute retweets_of_tweet_id
        #   Only retweets of this tweet ID.
        #
        #   @return [String, nil]
        optional :retweets_of_tweet_id, String

        # @!attribute safe
        #   Enable the safe-search filter.
        #
        #   @return [Boolean, nil]
        optional :safe, XTwitterScraper::Internal::Type::Boolean

        # @!attribute scope
        #   Select all replies, direct replies, or nested replies.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Scope, nil]
        optional :scope, enum: -> { XTwitterScraper::X::TweetGetRepliesParams::Scope }

        # @!attribute since_date
        #   Start date in YYYY-MM-DD format.
        #
        #   @return [Date, nil]
        optional :since_date, Date

        # @!attribute since_id
        #   Return Tweets newer than this Tweet ID.
        #
        #   @return [String, nil]
        optional :since_id, String

        # @!attribute since_time
        #   Unix timestamp - return replies posted after this time
        #
        #   @return [String, nil]
        optional :since_time, String

        # @!attribute sort
        #   Sort the selected replies before applying limit.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Sort, nil]
        optional :sort, enum: -> { XTwitterScraper::X::TweetGetRepliesParams::Sort }

        # @!attribute source
        #   Match the source application.
        #
        #   @return [String, nil]
        optional :source, String

        # @!attribute to_user
        #   Filter replies sent to a username.
        #
        #   @return [String, nil]
        optional :to_user, String

        # @!attribute until_date
        #   End date in YYYY-MM-DD format.
        #
        #   @return [Date, nil]
        optional :until_date, Date

        # @!attribute until_time
        #   Unix timestamp - return replies posted before this time
        #
        #   @return [String, nil]
        optional :until_time, String

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

        # @!attribute within
        #   Set the radius for the near filter.
        #
        #   @return [String, nil]
        optional :within, String

        # @!attribute within_time
        #   Match Tweets inside a recent time window.
        #
        #   @return [String, nil]
        optional :within_time, String

        # @!method initialize(id:, any_words: nil, blue_verified_only: nil, card_name: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_original_author: nil, exclude_source: nil, exclude_words: nil, from_user: nil, geocode: nil, hashtags: nil, has_media_only: nil, include_original_post: nil, in_reply_to_tweet_id: nil, language: nil, limit: nil, max_depth: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, mode: nil, native_retweets: nil, near: nil, news: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, scope: nil, since_date: nil, since_id: nil, since_time: nil, sort: nil, source: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within: nil, within_time: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::TweetGetRepliesParams} for more details.
        #
        #   @param id [String]
        #
        #   @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        #   @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        #   @param card_name [String] Match the Tweet card name.
        #
        #   @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        #   @param conversation_id [String] Conversation ID filter.
        #
        #   @param cursor [String] Cursor from the previous response. Xquik cursors resume automatic coverage. Exis
        #
        #   @param exact_phrase [String] Exact phrase to match.
        #
        #   @param exclude_original_author [Boolean] Exclude replies written by the source-post author.
        #
        #   @param exclude_source [String] Exclude a source application.
        #
        #   @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        #   @param from_user [String] Filter by author username.
        #
        #   @param geocode [String] Match latitude, longitude, and radius.
        #
        #   @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        #   @param has_media_only [Boolean] Only return replies containing media.
        #
        #   @param include_original_post [Boolean] Include the source post and count it toward limit.
        #
        #   @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        #   @param language [String] Language code filter, e.g. en or tr.
        #
        #   @param limit [Integer] With mode=complete, maximum combined direct and nested reply rows (1-25000, defa
        #
        #   @param max_depth [Integer] Maximum reply depth from the source post.
        #
        #   @param max_faves [Integer] Maximum likes threshold. maxLikes is also accepted.
        #
        #   @param max_id [String] Return Tweets older than this Tweet ID.
        #
        #   @param max_quotes [Integer] Maximum quotes threshold.
        #
        #   @param max_replies [Integer] Maximum replies threshold.
        #
        #   @param max_retweets [Integer] Maximum retweets threshold.
        #
        #   @param media_type [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::MediaType] Filter by media type.
        #
        #   @param mentioning [String] Filter tweets mentioning a username.
        #
        #   @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        #   @param min_faves [Integer] Minimum likes threshold. minLikes is also accepted.
        #
        #   @param min_quotes [Integer] Minimum quote count threshold.
        #
        #   @param min_replies [Integer] Minimum replies threshold.
        #
        #   @param min_retweets [Integer] Minimum retweets threshold.
        #
        #   @param min_views [Integer] Minimum view count threshold.
        #
        #   @param mode [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Mode] Optional advanced override. Omit mode for automatic maximum direct reply coverag
        #
        #   @param native_retweets [Boolean] Only return native reposts.
        #
        #   @param near [String] Match a place name.
        #
        #   @param news [Boolean] Only return news results.
        #
        #   @param page_size [Integer] Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20. Cont
        #
        #   @param quotes [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Quotes] Quote mode.
        #
        #   @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        #   @param replies [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Replies] Reply mode.
        #
        #   @param retweets [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Retweets] Retweet mode.
        #
        #   @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        #   @param safe [Boolean] Enable the safe-search filter.
        #
        #   @param scope [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Scope] Select all replies, direct replies, or nested replies.
        #
        #   @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        #   @param since_id [String] Return Tweets newer than this Tweet ID.
        #
        #   @param since_time [String] Unix timestamp - return replies posted after this time
        #
        #   @param sort [Symbol, XTwitterScraper::Models::X::TweetGetRepliesParams::Sort] Sort the selected replies before applying limit.
        #
        #   @param source [String] Match the source application.
        #
        #   @param to_user [String] Filter replies sent to a username.
        #
        #   @param until_date [Date] End date in YYYY-MM-DD format.
        #
        #   @param until_time [String] Unix timestamp - return replies posted before this time
        #
        #   @param url [String] URL substring or domain filter.
        #
        #   @param verified_only [Boolean] Only return tweets from verified authors.
        #
        #   @param within [String] Set the radius for the near filter.
        #
        #   @param within_time [String] Match Tweets inside a recent time window.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

        # Filter by media type.
        module MediaType
          extend XTwitterScraper::Internal::Type::Enum

          IMAGES = :images
          VIDEOS = :videos
          GIFS = :gifs
          MEDIA = :media
          LINKS = :links
          NONE = :none

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Optional advanced override. Omit mode for automatic maximum direct reply
        # coverage with pagination. Standard keeps legacy pagination. Complete returns
        # direct and nested replies with diagnostics, scope, depth, sorting, and
        # original-post controls.
        module Mode
          extend XTwitterScraper::Internal::Type::Enum

          STANDARD = :standard
          COMPLETE = :complete

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Quote mode.
        module Quotes
          extend XTwitterScraper::Internal::Type::Enum

          INCLUDE = :include
          EXCLUDE = :exclude
          ONLY = :only

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Reply mode.
        module Replies
          extend XTwitterScraper::Internal::Type::Enum

          INCLUDE = :include
          EXCLUDE = :exclude
          ONLY = :only

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Retweet mode.
        module Retweets
          extend XTwitterScraper::Internal::Type::Enum

          INCLUDE = :include
          EXCLUDE = :exclude
          ONLY = :only

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Select all replies, direct replies, or nested replies.
        module Scope
          extend XTwitterScraper::Internal::Type::Enum

          ALL = :all
          DIRECT = :direct
          NESTED = :nested

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Sort the selected replies before applying limit.
        module Sort
          extend XTwitterScraper::Internal::Type::Enum

          RELEVANCE = :relevance
          LATEST = :latest
          OLDEST = :oldest
          LIKES = :likes

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
