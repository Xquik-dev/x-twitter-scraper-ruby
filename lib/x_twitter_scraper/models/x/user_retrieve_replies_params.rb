# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_replies
      class UserRetrieveRepliesParams < XTwitterScraper::Internal::Type::BaseModel
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

        # @!attribute include_parent_tweet
        #   Include each reply's parent tweet.
        #
        #   @return [Boolean, nil]
        optional :include_parent_tweet, XTwitterScraper::Internal::Type::Boolean

        # @!attribute image_shows
        #   Keep only posts whose photos show this. Send charts, screenshots,
        #   product_photos, memes or people, or describe it in words, such as a rocket.
        #   AI-powered analysis checks posts with photos X doesn't mark sensitive & keeps
        #   scores of 0.5 or more. Other posts stay out at no charge. Each kept post costs 2
        #   credits, the AI analysis price, instead of the read price, & a post the filter
        #   drops costs nothing. imageFilter states the cutoff & counts.
        #
        #   @return [String, nil]
        optional :image_shows, String

        # @!attribute in_reply_to_tweet_id
        #   Only replies to this tweet ID.
        #
        #   @return [String, nil]
        optional :in_reply_to_tweet_id, String

        # @!attribute keywords
        #   Words the Tweets must match, in X search syntax.
        #
        #   @return [String, nil]
        optional :keywords, String

        # @!attribute language
        #   Language code filter, e.g. en or tr.
        #
        #   @return [String, nil]
        optional :language, String

        # @!attribute list_id
        #   Search within a list ID.
        #
        #   @return [String, nil]
        optional :list_id, String

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
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::MediaType, nil]
        optional :media_type, enum: -> { XTwitterScraper::X::UserRetrieveRepliesParams::MediaType }

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

        # @!attribute mode
        #   Optional legacy pagination override. Filters such as keywords don't apply with
        #   it.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Mode, nil]
        optional :mode, enum: -> { XTwitterScraper::X::UserRetrieveRepliesParams::Mode }

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

        # @!attribute omit
        #   Fields to drop from each row, comma-separated. It takes the same names as
        #   fields. With fields, it drops from the kept fields. A longer URL fails at the
        #   edge before Xquik reads it.
        #
        #   @return [String, nil]
        optional :omit, String

        # @!attribute page_size
        #   Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20.
        #   Continue while has_next_page is true. Deprecated aliases remain accepted.
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

        # @!attribute quotes
        #   Quote mode.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Quotes, nil]
        optional :quotes, enum: -> { XTwitterScraper::X::UserRetrieveRepliesParams::Quotes }

        # @!attribute quotes_of_tweet_id
        #   Only quotes of this tweet ID.
        #
        #   @return [String, nil]
        optional :quotes_of_tweet_id, String

        # @!attribute replies
        #   Reply mode.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Replies, nil]
        optional :replies, enum: -> { XTwitterScraper::X::UserRetrieveRepliesParams::Replies }

        # @!attribute retweets
        #   Retweet mode.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Retweets, nil]
        optional :retweets, enum: -> { XTwitterScraper::X::UserRetrieveRepliesParams::Retweets }

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
        #   Inclusive ISO bound for Tweet creation time, such as 2026-09-25T19:20:41Z. Unix
        #   seconds also work. A time without an offset is UTC.
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

        # @!attribute topic
        #   Keep only posts about this topic. AI-powered analysis asks "Is this post about
        #   <topic>?" of each post & keeps scores of 0.5 or more. It reads post text & safe
        #   photos. Each kept post costs 2 credits, the AI analysis price, instead of the
        #   read price, & a post the filter drops costs nothing. limit counts checked posts,
        #   & only kept posts come back. topicFilter states the cutoff & counts.
        #
        #   @return [String, nil]
        optional :topic, String

        # @!attribute until_date
        #   End date in YYYY-MM-DD format.
        #
        #   @return [Date, nil]
        optional :until_date, Date

        # @!attribute until_time
        #   Exclusive ISO bound for Tweet creation time. Unix seconds also work. A time
        #   without an offset is UTC.
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

        # @!method initialize(id:, advanced_query: nil, any_words: nil, blue_verified_only: nil, bounding_box: nil, card_name: nil, cashtags: nil, conversation_id: nil, cursor: nil, exact_phrase: nil, exclude_source: nil, exclude_words: nil, fields: nil, from_user: nil, geocode: nil, hashtags: nil, include_parent_tweet: nil, image_shows: nil, in_reply_to_tweet_id: nil, keywords: nil, language: nil, list_id: nil, max_faves: nil, max_id: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_bookmarks: nil, min_faves: nil, min_likes: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, mode: nil, native_retweets: nil, near: nil, news: nil, omit: nil, page_size: nil, place: nil, place_country: nil, point_radius: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, since_date: nil, since_id: nil, since_time: nil, source: nil, to_user: nil, topic: nil, until_date: nil, until_time: nil, url: nil, verified_only: nil, within: nil, within_time: nil, request_options: {})
        #   @param id [String]
        #
        #   @param advanced_query [String] Raw advanced search query appended as-is.
        #
        #   @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
        #
        #   @param blue_verified_only [Boolean] Only return tweets from Blue-verified authors.
        #
        #   @param bounding_box [String] Geo bounding box, such as -74.1 40.6 -73.9 40.8.
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
        #   @param exclude_source [String] Exclude a source application.
        #
        #   @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        #   @param from_user [String] Filter by author username.
        #
        #   @param geocode [String] Match latitude, longitude, and radius.
        #
        #   @param hashtags [String] Hashtags separated by spaces, commas, or lines.
        #
        #   @param include_parent_tweet [Boolean] Include each reply's parent tweet.
        #
        #   @param image_shows [String] Keep only posts whose photos show this. Send charts, screenshots, product_photos
        #
        #   @param in_reply_to_tweet_id [String] Only replies to this tweet ID.
        #
        #   @param keywords [String] Words the Tweets must match, in X search syntax.
        #
        #   @param language [String] Language code filter, e.g. en or tr.
        #
        #   @param list_id [String] Search within a list ID.
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
        #   @param media_type [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::MediaType] Filter by media type.
        #
        #   @param mentioning [String] Filter tweets mentioning a username.
        #
        #   @param min_bookmarks [Integer] Minimum bookmark count threshold.
        #
        #   @param min_faves [Integer] Minimum likes threshold. minLikes is also accepted.
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
        #   @param mode [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Mode] Optional legacy pagination override. Filters such as keywords don't apply with i
        #
        #   @param native_retweets [Boolean] Only return native reposts.
        #
        #   @param near [String] Match a place name.
        #
        #   @param news [Boolean] Only return news results.
        #
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        #   @param page_size [Integer] Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20. Cont
        #
        #   @param place [String] Search within a place ID.
        #
        #   @param place_country [String] Search within a country code.
        #
        #   @param point_radius [String] Geo point radius, such as -73.99 40.73 25mi.
        #
        #   @param quotes [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Quotes] Quote mode.
        #
        #   @param quotes_of_tweet_id [String] Only quotes of this tweet ID.
        #
        #   @param replies [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Replies] Reply mode.
        #
        #   @param retweets [Symbol, XTwitterScraper::Models::X::UserRetrieveRepliesParams::Retweets] Retweet mode.
        #
        #   @param retweets_of_tweet_id [String] Only retweets of this tweet ID.
        #
        #   @param safe [Boolean] Enable the safe-search filter.
        #
        #   @param since_date [Date] Start date in YYYY-MM-DD format.
        #
        #   @param since_id [String] Return Tweets newer than this Tweet ID.
        #
        #   @param since_time [String] Inclusive ISO bound for Tweet creation time, such as 2026-09-25T19:20:41Z. Unix
        #
        #   @param source [String] Match the source application.
        #
        #   @param to_user [String] Filter replies sent to a username.
        #
        #   @param topic [String] Keep only posts about this topic. AI-powered analysis asks "Is this post about <
        #
        #   @param until_date [Date] End date in YYYY-MM-DD format.
        #
        #   @param until_time [String] Exclusive ISO bound for Tweet creation time. Unix seconds also work. A time with
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

        # Optional legacy pagination override. Filters such as keywords don't apply with
        # it.
        module Mode
          extend XTwitterScraper::Internal::Type::Enum

          STANDARD = :standard

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
