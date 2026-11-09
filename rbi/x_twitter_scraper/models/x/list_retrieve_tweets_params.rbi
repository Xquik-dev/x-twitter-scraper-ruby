# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class ListRetrieveTweetsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::ListRetrieveTweetsParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Raw advanced search query appended as-is.
        sig { returns(T.nilable(String)) }
        attr_reader :advanced_query

        sig { params(advanced_query: String).void }
        attr_writer :advanced_query

        # Legacy cursor alias. Prefer cursor.
        sig { returns(T.nilable(String)) }
        attr_reader :after

        sig { params(after: String).void }
        attr_writer :after

        # Words or quoted phrases where any one can match. Separate with spaces, commas,
        # or lines.
        sig { returns(T.nilable(String)) }
        attr_reader :any_words

        sig { params(any_words: String).void }
        attr_writer :any_words

        # Only return tweets from Blue-verified authors.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :blue_verified_only

        sig { params(blue_verified_only: T::Boolean).void }
        attr_writer :blue_verified_only

        # Geo bounding box, such as -74.1 40.6 -73.9 40.8.
        sig { returns(T.nilable(String)) }
        attr_reader :bounding_box

        sig { params(bounding_box: String).void }
        attr_writer :bounding_box

        # Keep only Tweets with this card type, such as poll2choice_text_only. Every
        # returned Tweet has it.
        sig { returns(T.nilable(String)) }
        attr_reader :card_name

        sig { params(card_name: String).void }
        attr_writer :card_name

        # Cashtags separated by spaces, commas, or lines.
        sig { returns(T.nilable(String)) }
        attr_reader :cashtags

        sig { params(cashtags: String).void }
        attr_writer :cashtags

        # Conversation ID filter.
        sig { returns(T.nilable(String)) }
        attr_reader :conversation_id

        sig { params(conversation_id: String).void }
        attr_writer :conversation_id

        # Pagination cursor for list tweets
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Match this exact phrase, word for word.
        sig { returns(T.nilable(String)) }
        attr_reader :exact_phrase

        sig { params(exact_phrase: String).void }
        attr_writer :exact_phrase

        # `excludeSource` isn't supported. A Tweet search with it answers 424 & charges
        # nothing.
        sig { returns(T.nilable(String)) }
        attr_reader :exclude_source

        sig { params(exclude_source: String).void }
        attr_writer :exclude_source

        # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        sig { returns(T.nilable(String)) }
        attr_reader :exclude_words

        sig { params(exclude_words: String).void }
        attr_writer :exclude_words

        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        sig { returns(T.nilable(String)) }
        attr_reader :fields

        sig { params(fields: String).void }
        attr_writer :fields

        # Filter by author username. Account searches include all of the account's posts &
        # reposts.
        sig { returns(T.nilable(String)) }
        attr_reader :from_user

        sig { params(from_user: String).void }
        attr_writer :from_user

        # `geocode` isn't supported. A Tweet search with it answers 424 & charges nothing.
        sig { returns(T.nilable(String)) }
        attr_reader :geocode

        sig { params(geocode: String).void }
        attr_writer :geocode

        # Hashtags separated by spaces, commas, or lines.
        sig { returns(T.nilable(String)) }
        attr_reader :hashtags

        sig { params(hashtags: String).void }
        attr_writer :hashtags

        # Only replies to this tweet ID.
        sig { returns(T.nilable(String)) }
        attr_reader :in_reply_to_tweet_id

        sig { params(in_reply_to_tweet_id: String).void }
        attr_writer :in_reply_to_tweet_id

        # Include replies (default false)
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_replies

        sig { params(include_replies: T::Boolean).void }
        attr_writer :include_replies

        # Words the Tweets must match, in X search syntax.
        sig { returns(T.nilable(String)) }
        attr_reader :keywords

        sig { params(keywords: String).void }
        attr_writer :keywords

        # Filter by language. Its alias is `lang`. Language filters work for every
        # language X tags.
        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

        # Maximum likes threshold. maxLikes & max_likes also work.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_faves

        sig { params(max_faves: Integer).void }
        attr_writer :max_faves

        # Return Tweets at or below this ID.
        sig { returns(T.nilable(String)) }
        attr_reader :max_id

        sig { params(max_id: String).void }
        attr_writer :max_id

        # Maximum quotes threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_quotes

        sig { params(max_quotes: Integer).void }
        attr_writer :max_quotes

        # Maximum replies threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_replies

        sig { params(max_replies: Integer).void }
        attr_writer :max_replies

        # Maximum retweets threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_retweets

        sig { params(max_retweets: Integer).void }
        attr_writer :max_retweets

        # Filter media. Its aliases are has_video & has_media.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::ListRetrieveTweetsParams::MediaType::OrSymbol
            )
          )
        end
        attr_reader :media_type

        sig do
          params(
            media_type:
              XTwitterScraper::X::ListRetrieveTweetsParams::MediaType::OrSymbol
          ).void
        end
        attr_writer :media_type

        # Filter tweets mentioning a username.
        sig { returns(T.nilable(String)) }
        attr_reader :mentioning

        sig { params(mentioning: String).void }
        attr_writer :mentioning

        # Minimum bookmark count threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_bookmarks

        sig { params(min_bookmarks: Integer).void }
        attr_writer :min_bookmarks

        # Minimum likes. Its aliases are minFaves, min_likes & min_faves.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_likes

        sig { params(min_likes: Integer).void }
        attr_writer :min_likes

        # Minimum quote count threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_quotes

        sig { params(min_quotes: Integer).void }
        attr_writer :min_quotes

        # Minimum replies threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_replies

        sig { params(min_replies: Integer).void }
        attr_writer :min_replies

        # Minimum retweets threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_retweets

        sig { params(min_retweets: Integer).void }
        attr_writer :min_retweets

        # Minimum view count threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_views

        sig { params(min_views: Integer).void }
        attr_writer :min_views

        # Omit mode for resumable maximum coverage. Standard keeps legacy pagination.
        # Coverage returns diagnostics once and rejects cursors.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::ListRetrieveTweetsParams::Mode::OrSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode: XTwitterScraper::X::ListRetrieveTweetsParams::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Only return native reposts.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :native_retweets

        sig { params(native_retweets: T::Boolean).void }
        attr_writer :native_retweets

        # A place name, such as a city or a country. Matching Tweets are tagged in or
        # about that place.
        sig { returns(T.nilable(String)) }
        attr_reader :near

        sig { params(near: String).void }
        attr_writer :near

        # `news` isn't supported. A Tweet search with it answers 424 & charges nothing.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :news

        sig { params(news: T::Boolean).void }
        attr_writer :news

        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        sig { returns(T.nilable(String)) }
        attr_reader :omit

        sig { params(omit: String).void }
        attr_writer :omit

        # Maximum page items (1-100, default 20). Source, filters, or credits can reduce
        # results. Continue while has_next_page is true. Deprecated limit and count
        # aliases remain accepted.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        # Search within a place ID.
        sig { returns(T.nilable(String)) }
        attr_reader :place

        sig { params(place: String).void }
        attr_writer :place

        # Search within a country code.
        sig { returns(T.nilable(String)) }
        attr_reader :place_country

        sig { params(place_country: String).void }
        attr_writer :place_country

        # Geo point radius, such as -73.99 40.73 25mi.
        sig { returns(T.nilable(String)) }
        attr_reader :point_radius

        sig { params(point_radius: String).void }
        attr_writer :point_radius

        # Only when the caller requests a quote mode.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::ListRetrieveTweetsParams::Quotes::OrSymbol
            )
          )
        end
        attr_reader :quotes

        sig do
          params(
            quotes:
              XTwitterScraper::X::ListRetrieveTweetsParams::Quotes::OrSymbol
          ).void
        end
        attr_writer :quotes

        # Only quotes of this tweet ID.
        sig { returns(T.nilable(String)) }
        attr_reader :quotes_of_tweet_id

        sig { params(quotes_of_tweet_id: String).void }
        attr_writer :quotes_of_tweet_id

        # Reply mode. Exclude keeps own-thread replies.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::ListRetrieveTweetsParams::Replies::OrSymbol
            )
          )
        end
        attr_reader :replies

        sig do
          params(
            replies:
              XTwitterScraper::X::ListRetrieveTweetsParams::Replies::OrSymbol
          ).void
        end
        attr_writer :replies

        # Only when the caller requests a repost mode.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::ListRetrieveTweetsParams::Retweets::OrSymbol
            )
          )
        end
        attr_reader :retweets

        sig do
          params(
            retweets:
              XTwitterScraper::X::ListRetrieveTweetsParams::Retweets::OrSymbol
          ).void
        end
        attr_writer :retweets

        # Only retweets of this tweet ID.
        sig { returns(T.nilable(String)) }
        attr_reader :retweets_of_tweet_id

        sig { params(retweets_of_tweet_id: String).void }
        attr_writer :retweets_of_tweet_id

        # Enable the safe-search filter.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :safe

        sig { params(safe: T::Boolean).void }
        attr_writer :safe

        # Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any
        # common form.
        sig { returns(T.nilable(Date)) }
        attr_reader :since_date

        sig { params(since_date: Date).void }
        attr_writer :since_date

        # Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id`
        # bounds.
        sig { returns(T.nilable(String)) }
        attr_reader :since_id

        sig { params(since_id: String).void }
        attr_writer :since_id

        # Unix timestamp - filter after
        sig { returns(T.nilable(String)) }
        attr_reader :since_time

        sig { params(since_time: String).void }
        attr_writer :since_time

        # `source` isn't supported. A Tweet search with it answers 424 & charges nothing.
        sig { returns(T.nilable(String)) }
        attr_reader :source

        sig { params(source: String).void }
        attr_writer :source

        # Filter replies sent to a username.
        sig { returns(T.nilable(String)) }
        attr_reader :to_user

        sig { params(to_user: String).void }
        attr_writer :to_user

        # End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
        sig { returns(T.nilable(Date)) }
        attr_reader :until_date

        sig { params(until_date: Date).void }
        attr_writer :until_date

        # Unix timestamp - filter before
        sig { returns(T.nilable(String)) }
        attr_reader :until_time

        sig { params(until_time: String).void }
        attr_writer :until_time

        # URL substring or domain filter.
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # Only return tweets from verified authors.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :verified_only

        sig { params(verified_only: T::Boolean).void }
        attr_writer :verified_only

        # `within` isn't supported. A Tweet search with it answers 424 & charges nothing.
        # Use near alone.
        sig { returns(T.nilable(String)) }
        attr_reader :within

        sig { params(within: String).void }
        attr_writer :within

        # Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
        # h or d.
        sig { returns(T.nilable(String)) }
        attr_reader :within_time

        sig { params(within_time: String).void }
        attr_writer :within_time

        sig do
          params(
            id: String,
            advanced_query: String,
            after: String,
            any_words: String,
            blue_verified_only: T::Boolean,
            bounding_box: String,
            card_name: String,
            cashtags: String,
            conversation_id: String,
            cursor: String,
            exact_phrase: String,
            exclude_source: String,
            exclude_words: String,
            fields: String,
            from_user: String,
            geocode: String,
            hashtags: String,
            in_reply_to_tweet_id: String,
            include_replies: T::Boolean,
            keywords: String,
            language: String,
            max_faves: Integer,
            max_id: String,
            max_quotes: Integer,
            max_replies: Integer,
            max_retweets: Integer,
            media_type:
              XTwitterScraper::X::ListRetrieveTweetsParams::MediaType::OrSymbol,
            mentioning: String,
            min_bookmarks: Integer,
            min_likes: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            min_views: Integer,
            mode: XTwitterScraper::X::ListRetrieveTweetsParams::Mode::OrSymbol,
            native_retweets: T::Boolean,
            near: String,
            news: T::Boolean,
            omit: String,
            page_size: Integer,
            place: String,
            place_country: String,
            point_radius: String,
            quotes:
              XTwitterScraper::X::ListRetrieveTweetsParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::ListRetrieveTweetsParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::ListRetrieveTweetsParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            safe: T::Boolean,
            since_date: Date,
            since_id: String,
            since_time: String,
            source: String,
            to_user: String,
            until_date: Date,
            until_time: String,
            url: String,
            verified_only: T::Boolean,
            within: String,
            within_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Raw advanced search query appended as-is.
          advanced_query: nil,
          # Legacy cursor alias. Prefer cursor.
          after: nil,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
          # Geo bounding box, such as -74.1 40.6 -73.9 40.8.
          bounding_box: nil,
          # Keep only Tweets with this card type, such as poll2choice_text_only. Every
          # returned Tweet has it.
          card_name: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for list tweets
          cursor: nil,
          # Match this exact phrase, word for word.
          exact_phrase: nil,
          # `excludeSource` isn't supported. A Tweet search with it answers 424 & charges
          # nothing.
          exclude_source: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Filter by author username. Account searches include all of the account's posts &
          # reposts.
          from_user: nil,
          # `geocode` isn't supported. A Tweet search with it answers 424 & charges nothing.
          geocode: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Include replies (default false)
          include_replies: nil,
          # Words the Tweets must match, in X search syntax.
          keywords: nil,
          # Filter by language. Its alias is `lang`. Language filters work for every
          # language X tags.
          language: nil,
          # Maximum likes threshold. maxLikes & max_likes also work.
          max_faves: nil,
          # Return Tweets at or below this ID.
          max_id: nil,
          # Maximum quotes threshold.
          max_quotes: nil,
          # Maximum replies threshold.
          max_replies: nil,
          # Maximum retweets threshold.
          max_retweets: nil,
          # Filter media. Its aliases are has_video & has_media.
          media_type: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Minimum bookmark count threshold.
          min_bookmarks: nil,
          # Minimum likes. Its aliases are minFaves, min_likes & min_faves.
          min_likes: nil,
          # Minimum quote count threshold.
          min_quotes: nil,
          # Minimum replies threshold.
          min_replies: nil,
          # Minimum retweets threshold.
          min_retweets: nil,
          # Minimum view count threshold.
          min_views: nil,
          # Omit mode for resumable maximum coverage. Standard keeps legacy pagination.
          # Coverage returns diagnostics once and rejects cursors.
          mode: nil,
          # Only return native reposts.
          native_retweets: nil,
          # A place name, such as a city or a country. Matching Tweets are tagged in or
          # about that place.
          near: nil,
          # `news` isn't supported. A Tweet search with it answers 424 & charges nothing.
          news: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          # Maximum page items (1-100, default 20). Source, filters, or credits can reduce
          # results. Continue while has_next_page is true. Deprecated limit and count
          # aliases remain accepted.
          page_size: nil,
          # Search within a place ID.
          place: nil,
          # Search within a country code.
          place_country: nil,
          # Geo point radius, such as -73.99 40.73 25mi.
          point_radius: nil,
          # Only when the caller requests a quote mode.
          quotes: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Reply mode. Exclude keeps own-thread replies.
          replies: nil,
          # Only when the caller requests a repost mode.
          retweets: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Enable the safe-search filter.
          safe: nil,
          # Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any
          # common form.
          since_date: nil,
          # Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id`
          # bounds.
          since_id: nil,
          # Unix timestamp - filter after
          since_time: nil,
          # `source` isn't supported. A Tweet search with it answers 424 & charges nothing.
          source: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
          until_date: nil,
          # Unix timestamp - filter before
          until_time: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          # `within` isn't supported. A Tweet search with it answers 424 & charges nothing.
          # Use near alone.
          within: nil,
          # Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
          # h or d.
          within_time: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              advanced_query: String,
              after: String,
              any_words: String,
              blue_verified_only: T::Boolean,
              bounding_box: String,
              card_name: String,
              cashtags: String,
              conversation_id: String,
              cursor: String,
              exact_phrase: String,
              exclude_source: String,
              exclude_words: String,
              fields: String,
              from_user: String,
              geocode: String,
              hashtags: String,
              in_reply_to_tweet_id: String,
              include_replies: T::Boolean,
              keywords: String,
              language: String,
              max_faves: Integer,
              max_id: String,
              max_quotes: Integer,
              max_replies: Integer,
              max_retweets: Integer,
              media_type:
                XTwitterScraper::X::ListRetrieveTweetsParams::MediaType::OrSymbol,
              mentioning: String,
              min_bookmarks: Integer,
              min_likes: Integer,
              min_quotes: Integer,
              min_replies: Integer,
              min_retweets: Integer,
              min_views: Integer,
              mode:
                XTwitterScraper::X::ListRetrieveTweetsParams::Mode::OrSymbol,
              native_retweets: T::Boolean,
              near: String,
              news: T::Boolean,
              omit: String,
              page_size: Integer,
              place: String,
              place_country: String,
              point_radius: String,
              quotes:
                XTwitterScraper::X::ListRetrieveTweetsParams::Quotes::OrSymbol,
              quotes_of_tweet_id: String,
              replies:
                XTwitterScraper::X::ListRetrieveTweetsParams::Replies::OrSymbol,
              retweets:
                XTwitterScraper::X::ListRetrieveTweetsParams::Retweets::OrSymbol,
              retweets_of_tweet_id: String,
              safe: T::Boolean,
              since_date: Date,
              since_id: String,
              since_time: String,
              source: String,
              to_user: String,
              until_date: Date,
              until_time: String,
              url: String,
              verified_only: T::Boolean,
              within: String,
              within_time: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Filter media. Its aliases are has_video & has_media.
        module MediaType
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::X::ListRetrieveTweetsParams::MediaType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGES =
            T.let(
              :images,
              XTwitterScraper::X::ListRetrieveTweetsParams::MediaType::TaggedSymbol
            )
          VIDEOS =
            T.let(
              :videos,
              XTwitterScraper::X::ListRetrieveTweetsParams::MediaType::TaggedSymbol
            )
          GIFS =
            T.let(
              :gifs,
              XTwitterScraper::X::ListRetrieveTweetsParams::MediaType::TaggedSymbol
            )
          MEDIA =
            T.let(
              :media,
              XTwitterScraper::X::ListRetrieveTweetsParams::MediaType::TaggedSymbol
            )
          LINKS =
            T.let(
              :links,
              XTwitterScraper::X::ListRetrieveTweetsParams::MediaType::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              XTwitterScraper::X::ListRetrieveTweetsParams::MediaType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::ListRetrieveTweetsParams::MediaType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Omit mode for resumable maximum coverage. Standard keeps legacy pagination.
        # Coverage returns diagnostics once and rejects cursors.
        module Mode
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::X::ListRetrieveTweetsParams::Mode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STANDARD =
            T.let(
              :standard,
              XTwitterScraper::X::ListRetrieveTweetsParams::Mode::TaggedSymbol
            )
          COVERAGE =
            T.let(
              :coverage,
              XTwitterScraper::X::ListRetrieveTweetsParams::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::ListRetrieveTweetsParams::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Only when the caller requests a quote mode.
        module Quotes
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::X::ListRetrieveTweetsParams::Quotes
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::ListRetrieveTweetsParams::Quotes::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::ListRetrieveTweetsParams::Quotes::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::ListRetrieveTweetsParams::Quotes::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::ListRetrieveTweetsParams::Quotes::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Reply mode. Exclude keeps own-thread replies.
        module Replies
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::X::ListRetrieveTweetsParams::Replies
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::ListRetrieveTweetsParams::Replies::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::ListRetrieveTweetsParams::Replies::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::ListRetrieveTweetsParams::Replies::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::ListRetrieveTweetsParams::Replies::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Only when the caller requests a repost mode.
        module Retweets
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::X::ListRetrieveTweetsParams::Retweets
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::ListRetrieveTweetsParams::Retweets::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::ListRetrieveTweetsParams::Retweets::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::ListRetrieveTweetsParams::Retweets::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::ListRetrieveTweetsParams::Retweets::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
