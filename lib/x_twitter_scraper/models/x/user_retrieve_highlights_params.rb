# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_highlights
      class UserRetrieveHighlightsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor for collection results. Also read as next_cursor, next_token,
        #   pagination_token or continuation_token.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute page_size
        #   Items per page. A page holds up to 10,000, so a larger pageSize gets the largest
        #   page. Default 20. Source, filters or credits can return fewer. Follow
        #   next_cursor for more pages. Its aliases are limit, count, max_results, maxItems,
        #   max_items & per_page.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer, api_name: :pageSize

        # @!attribute from_user
        #   Filter by author username. Account searches include all of the account's posts &
        #   reposts.
        #
        #   @return [String, nil]
        optional :from_user, String, api_name: :fromUser

        # @!attribute to_user
        #   Filter replies sent to a username.
        #
        #   @return [String, nil]
        optional :to_user, String, api_name: :toUser

        # @!attribute mentioning
        #   Filter tweets mentioning a username.
        #
        #   @return [String, nil]
        optional :mentioning, String

        # @!attribute language
        #   Filter by language. Its alias is `lang`. Language filters work for every
        #   language X tags.
        #
        #   @return [String, nil]
        optional :language, String

        # @!attribute since_date
        #   Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any
        #   common form.
        #
        #   @return [Date, nil]
        optional :since_date, Date, api_name: :sinceDate

        # @!attribute until_date
        #   End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
        #
        #   @return [Date, nil]
        optional :until_date, Date, api_name: :untilDate

        # @!attribute media_type
        #   Filter media. Its aliases are has_video & has_media.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveHighlightsParams::MediaType, nil]
        optional :media_type, enum: -> { XTwitterScraper::Models::X::UserRetrieveHighlightsParams::MediaType }, api_name: :mediaType

        # @!attribute min_likes
        #   Minimum likes. Its aliases are minFaves, min_likes & min_faves.
        #
        #   @return [Integer, nil]
        optional :min_likes, Integer, api_name: :minLikes

        # @!attribute min_retweets
        #   Minimum retweets threshold.
        #
        #   @return [Integer, nil]
        optional :min_retweets, Integer, api_name: :minRetweets

        # @!attribute min_replies
        #   Minimum replies threshold.
        #
        #   @return [Integer, nil]
        optional :min_replies, Integer, api_name: :minReplies

        # @!attribute min_quotes
        #   Minimum quote count threshold.
        #
        #   @return [Integer, nil]
        optional :min_quotes, Integer, api_name: :minQuotes

        # @!attribute min_views
        #   Minimum view count threshold.
        #
        #   @return [Integer, nil]
        optional :min_views, Integer, api_name: :minViews

        # @!attribute min_bookmarks
        #   Minimum bookmark count threshold.
        #
        #   @return [Integer, nil]
        optional :min_bookmarks, Integer, api_name: :minBookmarks

        # @!attribute max_faves
        #   Maximum likes threshold. maxLikes & max_likes also work.
        #
        #   @return [Integer, nil]
        optional :max_faves, Integer, api_name: :maxFaves

        # @!attribute max_retweets
        #   Maximum retweets threshold.
        #
        #   @return [Integer, nil]
        optional :max_retweets, Integer, api_name: :maxRetweets

        # @!attribute max_replies
        #   Maximum replies threshold.
        #
        #   @return [Integer, nil]
        optional :max_replies, Integer, api_name: :maxReplies

        # @!attribute max_quotes
        #   Maximum quotes threshold.
        #
        #   @return [Integer, nil]
        optional :max_quotes, Integer, api_name: :maxQuotes

        # @!attribute blue_verified_only
        #   Only return tweets from Blue-verified authors.
        #
        #   @return [Boolean, nil]
        optional :blue_verified_only, XTwitterScraper::Internal::Type::Boolean, api_name: :blueVerifiedOnly

        # @!attribute since_id
        #   Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id`
        #   bounds.
        #
        #   @return [String, nil]
        optional :since_id, String, api_name: :sinceId

        # @!attribute max_id
        #   Return Tweets at or below this ID.
        #
        #   @return [String, nil]
        optional :max_id, String, api_name: :maxId

        # @!attribute within_time
        #   Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
        #   h or d.
        #
        #   @return [String, nil]
        optional :within_time, String, api_name: :withinTime

        # @!attribute native_retweets
        #   Only return native reposts.
        #
        #   @return [Boolean, nil]
        optional :native_retweets, XTwitterScraper::Internal::Type::Boolean, api_name: :nativeRetweets

        # @!attribute verified_only
        #   Only return tweets from verified authors.
        #
        #   @return [Boolean, nil]
        optional :verified_only, XTwitterScraper::Internal::Type::Boolean, api_name: :verifiedOnly

        # @!attribute replies
        #   Reply mode. Exclude keeps own-thread replies.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Replies, nil]
        optional :replies, enum: -> { XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Replies }

        # @!attribute retweets
        #   Only when the caller requests a repost mode.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Retweets, nil]
        optional :retweets, enum: -> { XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Retweets }

        # @!attribute quotes
        #   Only when the caller requests a quote mode.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Quotes, nil]
        optional :quotes, enum: -> { XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Quotes }

        # @!attribute exact_phrase
        #   Match this exact phrase, word for word.
        #
        #   @return [String, nil]
        optional :exact_phrase, String, api_name: :exactPhrase

        # @!attribute exclude_words
        #   Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        #   @return [String, nil]
        optional :exclude_words, String, api_name: :excludeWords

        # @!attribute any_words
        #   Words or quoted phrases where any one can match. Separate with spaces, commas,
        #   or lines.
        #
        #   @return [String, nil]
        optional :any_words, String, api_name: :anyWords

        # @!attribute hashtags
        #   Hashtags separated by spaces, commas, or lines.
        #
        #   @return [String, nil]
        optional :hashtags, String

        # @!attribute cashtags
        #   Cashtags separated by spaces, commas, or lines.
        #
        #   @return [String, nil]
        optional :cashtags, String

        # @!attribute url
        #   URL substring or domain filter.
        #
        #   @return [String, nil]
        optional :url, String

        # @!attribute conversation_id
        #   Conversation ID filter.
        #
        #   @return [String, nil]
        optional :conversation_id, String, api_name: :conversationId

        # @!attribute in_reply_to_tweet_id
        #   Only replies to this tweet ID.
        #
        #   @return [String, nil]
        optional :in_reply_to_tweet_id, String, api_name: :inReplyToTweetId

        # @!attribute quotes_of_tweet_id
        #   Only quotes of this tweet ID.
        #
        #   @return [String, nil]
        optional :quotes_of_tweet_id, String, api_name: :quotesOfTweetId

        # @!attribute retweets_of_tweet_id
        #   Only retweets of this tweet ID.
        #
        #   @return [String, nil]
        optional :retweets_of_tweet_id, String, api_name: :retweetsOfTweetId

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

        # @!attribute omit
        #   Fields to drop from each row, comma-separated. It takes the same names as
        #   fields. With fields, it drops from the kept fields. A longer URL fails at the
        #   edge before Xquik reads it.
        #
        #   @return [String, nil]
        optional :omit, String

        # @!method initialize(id:, cursor: nil, page_size: nil, from_user: nil, to_user: nil, mentioning: nil, language: nil, since_date: nil, until_date: nil, media_type: nil, min_likes: nil, min_retweets: nil, min_replies: nil, min_quotes: nil, min_views: nil, min_bookmarks: nil, max_faves: nil, max_retweets: nil, max_replies: nil, max_quotes: nil, blue_verified_only: nil, since_id: nil, max_id: nil, within_time: nil, native_retweets: nil, verified_only: nil, replies: nil, retweets: nil, quotes: nil, exact_phrase: nil, exclude_words: nil, any_words: nil, hashtags: nil, cashtags: nil, url: nil, conversation_id: nil, in_reply_to_tweet_id: nil, quotes_of_tweet_id: nil, retweets_of_tweet_id: nil, fields: nil, omit: nil, request_options: {})
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        #   @param page_size [Integer] Items per page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        #   @param from_user [String] Filter by author username. Account searches include all of the account's posts & reposts.
        #
        #   @param to_user [String] Filter replies sent to a username.
        #
        #   @param mentioning [String] Filter tweets mentioning a username.
        #
        #   @param language [String] Filter by language. Its alias is `lang`. Language filters work for every language X tags.
        #
        #   @param since_date [Date] Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any common form.
        #
        #   @param until_date [Date] End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
        #
        #   @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveHighlightsParams::MediaType] Filter media. Its aliases are has_video & has_media.
        #
        #   @param min_likes [Integer] Minimum likes. Its aliases are minFaves, min_likes & min_faves.
        #
        #   @param min_retweets [Integer] Minimum retweets threshold.
        #
        #   @param min_replies [Integer] Minimum replies threshold.
        #
        #   @param min_quotes [Integer] Minimum quote count threshold.
        #
        #   @param min_views [Integer] Minimum view count threshold.
        #
        #   @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        #   @param max_faves [Integer] Maximum likes threshold. maxLikes & max_likes also work.
        #
        #   @param max_retweets [Integer] Maximum retweets threshold.
        #
        #   @param max_replies [Integer] Maximum replies threshold.
        #
        #   @param max_quotes [Integer] Maximum quotes threshold.
        #
        #   @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        #   @param since_id [String] Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id` bounds.
        #
        #   @param max_id [String] Return Tweets at or below this ID.
        #
        #   @param within_time [String] Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m, h or d.
        #
        #   @param native_retweets [Boolean] Only return native reposts.
        #
        #   @param verified_only [Boolean] Only return tweets from verified authors.
        #
        #   @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Replies] Reply mode. Exclude keeps own-thread replies.
        #
        #   @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Retweets] Only when the caller requests a repost mode.
        #
        #   @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Quotes] Only when the caller requests a quote mode.
        #
        #   @param exact_phrase [String] Match this exact phrase, word for word.
        #
        #   @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        #   @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, or lines.
        #
        #   @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        #   @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        #   @param url [String] URL substring or domain filter.
        #
        #   @param conversation_id [String] Conversation ID filter.
        #
        #   @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        #   @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        #   @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

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

        module Replies
          extend XTwitterScraper::Internal::Type::Enum

          INCLUDE = :include
          EXCLUDE = :exclude
          ONLY = :only

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module Retweets
          extend XTwitterScraper::Internal::Type::Enum

          INCLUDE = :include
          EXCLUDE = :exclude
          ONLY = :only

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module Quotes
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
