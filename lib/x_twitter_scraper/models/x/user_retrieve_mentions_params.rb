# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_mentions
      class UserRetrieveMentionsParams < XTwitterScraper::Internal::Type::BaseModel
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
        #   Pagination cursor for mentions
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute exact_phrase
        #   Exact phrase to match.
        #
        #   @return [String, nil]
        optional :exact_phrase, String

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
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::MediaType, nil]
        optional :media_type, enum: -> { XTwitterScraper::X::UserRetrieveMentionsParams::MediaType }

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
        #   Maximum page items (1-100, default 20). Source, filters, or credits can reduce
        #   results. Continue while has_next_page is true. Deprecated limit and count
        #   aliases remain accepted.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer

        # @!attribute quotes
        #   Quote mode.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::Quotes, nil]
        optional :quotes, enum: -> { XTwitterScraper::X::UserRetrieveMentionsParams::Quotes }

        # @!attribute quotes_of_tweet_id
        #   Only quotes of this tweet ID.
        #
        #   @return [String, nil]
        optional :quotes_of_tweet_id, String

        # @!attribute replies
        #   Reply mode.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::Replies, nil]
        optional :replies, enum: -> { XTwitterScraper::X::UserRetrieveMentionsParams::Replies }

        # @!attribute retweets
        #   Retweet mode.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::Retweets, nil]
        optional :retweets, enum: -> { XTwitterScraper::X::UserRetrieveMentionsParams::Retweets }

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
        #   Unix timestamp - return mentions after this time
        #
        #   @return [String, nil]
        optional :since_time, String

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
        #   Unix timestamp - return mentions before this time
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

        # @!method initialize(id:, any_words: nil, blue_verified_only: nil, card_name: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_source: nil, exclude_words: nil, from_user: nil, geocode: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, near: nil, news: nil, page_size: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, since_date: nil, since_id: nil, since_time: nil, source: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within: nil, within_time: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::UserRetrieveMentionsParams} for more details.
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
        #   @param cursor [String] Pagination cursor for mentions
        #
        #   @param exact_phrase [String] Exact phrase to match.
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
        #   @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        #   @param language [String] Language code filter, e.g. en or tr.
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
        #   @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::MediaType] Filter by media type.
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
        #   @param native_retweets [Boolean] Only return native reposts.
        #
        #   @param near [String] Match a place name.
        #
        #   @param news [Boolean] Only return news results.
        #
        #   @param page_size [Integer] Maximum page items (1-100, default 20). Source, filters, or credits can reduce r
        #
        #   @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::Quotes] Quote mode.
        #
        #   @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        #   @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::Replies] Reply mode.
        #
        #   @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveMentionsParams::Retweets] Retweet mode.
        #
        #   @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        #   @param safe [Boolean] Enable the safe-search filter.
        #
        #   @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        #   @param since_id [String] Return Tweets newer than this Tweet ID.
        #
        #   @param since_time [String] Unix timestamp - return mentions after this time
        #
        #   @param source [String] Match the source application.
        #
        #   @param to_user [String] Filter replies sent to a username.
        #
        #   @param until_date [Date] End date in YYYY-MM-DD format.
        #
        #   @param until_time [String] Unix timestamp - return mentions before this time
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
      end
    end
  end
end
