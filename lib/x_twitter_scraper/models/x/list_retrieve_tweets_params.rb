# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Lists#retrieve_tweets
      class ListRetrieveTweetsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute advanced_query
        #   Raw advanced search query appended as-is.
        #
        #   @return [String, nil]
        optional :advanced_query, String

        # @!attribute after
        #   Legacy cursor alias. Prefer cursor.
        #
        #   @return [String, nil]
        optional :after, String

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

        # @!attribute bounding_box
        #   Geo bounding box, such as -74.1 40.6 -73.9 40.8.
        #
        #   @return [String, nil]
        optional :bounding_box, String

        # @!attribute card_name
        #   Keep only Tweets with this card type, such as poll2choice_text_only. Every
        #   returned Tweet has it.
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
        #   Pagination cursor for list tweets
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute exact_phrase
        #   Match this exact phrase, word for word.
        #
        #   @return [String, nil]
        optional :exact_phrase, String

        # @!attribute exclude_source
        #   `excludeSource` isn't supported. A Tweet search with it answers 424 & charges
        #   nothing.
        #
        #   @return [String, nil]
        optional :exclude_source, String

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

        # @!attribute geocode
        #   `geocode` isn't supported. A Tweet search with it answers 424 & charges nothing.
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

        # @!attribute include_replies
        #   Include replies (default false)
        #
        #   @return [Boolean, nil]
        optional :include_replies, XTwitterScraper::Internal::Type::Boolean

        # @!attribute keywords
        #   Words the Tweets must match, in X search syntax.
        #
        #   @return [String, nil]
        optional :keywords, String

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

        # @!attribute near
        #   A place name, such as a city or a country. Matching Tweets are tagged in or
        #   about that place.
        #
        #   @return [String, nil]
        optional :near, String

        # @!attribute news
        #   `news` isn't supported. A Tweet search with it answers 424 & charges nothing.
        #
        #   @return [Boolean, nil]
        optional :news, XTwitterScraper::Internal::Type::Boolean

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

        # @!attribute place
        #   Search within a place ID.
        #
        #   @return [String, nil]
        optional :place, String

        # @!attribute place_country
        #   Search within a country code.
        #
        #   @return [String, nil]
        optional :place_country, String

        # @!attribute point_radius
        #   Geo point radius, such as -73.99 40.73 25mi.
        #
        #   @return [String, nil]
        optional :point_radius, String

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

        # @!attribute safe
        #   Enable the safe-search filter.
        #
        #   @return [Boolean, nil]
        optional :safe, XTwitterScraper::Internal::Type::Boolean

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

        # @!attribute since_time
        #   Unix timestamp - filter after
        #
        #   @return [String, nil]
        optional :since_time, String

        # @!attribute source
        #   `source` isn't supported. A Tweet search with it answers 424 & charges nothing.
        #
        #   @return [String, nil]
        optional :source, String

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

        # @!attribute until_time
        #   Unix timestamp - filter before
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
        #   `within` isn't supported. A Tweet search with it answers 424 & charges nothing.
        #   Use near alone.
        #
        #   @return [String, nil]
        optional :within, String

        # @!attribute within_time
        #   Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
        #   h or d.
        #
        #   @return [String, nil]
        optional :within_time, String

        # @!method initialize(id:, advanced_query: nil, after: nil, any_words: nil, blue_verified_only: nil, bounding_box: nil, card_name: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_source: nil, exclude_words: nil, fields: nil, from_user: nil, geocode: nil, hashtags: nil, in_reply_to_tweet_id: nil, include_replies: nil, keywords: nil, language: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, mentioning: nil, min_bookmarks: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, near: nil, news: nil, omit: nil, page_size: nil, place: nil, place_country: nil, point_radius: nil, quotes_of_tweet_id: nil, retweets_of_tweet_id: nil, safe: nil, since_date: nil, since_id: nil, since_time: nil, source: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within: nil, within_time: nil, request_options: {})
        #   @param id [String]
        #
        #   @param advanced_query [String] Raw advanced search query appended as-is.
        #
        #   @param after [String] Legacy cursor alias. Prefer cursor.
        #
        #   @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        #   @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        #   @param bounding_box [String] Geo bounding box, such as -74.1 40.6 -73.9 40.8.
        #
        #   @param card_name [String] Keep only Tweets with this card type, such as poll2choice_text_only. Every retur
        #
        #   @param cashtags [String] Cashtags separated by spaces, commas, or lines.
        #
        #   @param conversation_id [String] Conversation ID filter.
        #
        #   @param cursor [String] Pagination cursor for list tweets
        #
        #   @param exact_phrase [String] Match this exact phrase, word for word.
        #
        #   @param exclude_source [String] `excludeSource` isn't supported. A Tweet search with it answers 424 & charges no
        #
        #   @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        #   @param from_user [String] Filter by author username. Account searches include all of the account's posts &
        #
        #   @param geocode [String] `geocode` isn't supported. A Tweet search with it answers 424 & charges nothing.
        #
        #   @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        #   @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        #   @param include_replies [Boolean] Include replies (default false)
        #
        #   @param keywords [String] Words the Tweets must match, in X search syntax.
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
        #   @param near [String] A place name, such as a city or a country. Matching Tweets are tagged in or abou
        #
        #   @param news [Boolean] `news` isn't supported. A Tweet search with it answers 424 & charges nothing.
        #
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        #   @param page_size [Integer] Maximum page items (1-100, default 20). Source, filters, or credits can reduce r
        #
        #   @param place [String] Search within a place ID.
        #
        #   @param place_country [String] Search within a country code.
        #
        #   @param point_radius [String] Geo point radius, such as -73.99 40.73 25mi.
        #
        #   @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        #   @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        #   @param safe [Boolean] Enable the safe-search filter.
        #
        #   @param since_date [Date] Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any com
        #
        #   @param since_id [String] Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id` bo
        #
        #   @param since_time [String] Unix timestamp - filter after
        #
        #   @param source [String] `source` isn't supported. A Tweet search with it answers 424 & charges nothing.
        #
        #   @param to_user [String] Filter replies sent to a username.
        #
        #   @param until_date [Date] End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
        #
        #   @param until_time [String] Unix timestamp - filter before
        #
        #   @param url [String] URL substring or domain filter.
        #
        #   @param verified_only [Boolean] Only return tweets from verified authors.
        #
        #   @param within [String] `within` isn't supported. A Tweet search with it answers 424 & charges nothing.
        #
        #   @param within_time [String] Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
