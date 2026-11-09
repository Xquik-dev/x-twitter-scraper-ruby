# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserRetrieveTweetsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::UserRetrieveTweetsParams,
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

        # Match the Tweet card name.
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

        # Cursor from the previous response. Xquik cursors resume automatic coverage.
        # Existing unprefixed cursors keep legacy standard behavior.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Exact phrase to match.
        sig { returns(T.nilable(String)) }
        attr_reader :exact_phrase

        sig { params(exact_phrase: String).void }
        attr_writer :exact_phrase

        # Exclude a source application.
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

        # Filter by author username.
        sig { returns(T.nilable(String)) }
        attr_reader :from_user

        sig { params(from_user: String).void }
        attr_writer :from_user

        # Match latitude, longitude, and radius.
        sig { returns(T.nilable(String)) }
        attr_reader :geocode

        sig { params(geocode: String).void }
        attr_writer :geocode

        # Hashtags separated by spaces, commas, or lines.
        sig { returns(T.nilable(String)) }
        attr_reader :hashtags

        sig { params(hashtags: String).void }
        attr_writer :hashtags

        # Include parent tweet for replies
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_parent_tweet

        sig { params(include_parent_tweet: T::Boolean).void }
        attr_writer :include_parent_tweet

        # Include reply tweets
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_replies

        sig { params(include_replies: T::Boolean).void }
        attr_writer :include_replies

        # Keep only posts whose photos show this. Send charts, screenshots,
        # product_photos, memes or people, or describe it in words, such as a rocket.
        # AI-powered analysis checks posts with photos X doesn't mark sensitive & keeps
        # scores of 0.5 or more. Other posts stay out at no charge. Each kept post costs 2
        # credits, the AI analysis price, instead of the read price, & a post the filter
        # drops costs nothing. imageFilter states the cutoff & counts.
        sig { returns(T.nilable(String)) }
        attr_reader :image_shows

        sig { params(image_shows: String).void }
        attr_writer :image_shows

        # Only replies to this tweet ID.
        sig { returns(T.nilable(String)) }
        attr_reader :in_reply_to_tweet_id

        sig { params(in_reply_to_tweet_id: String).void }
        attr_writer :in_reply_to_tweet_id

        # Words the Tweets must match, in X search syntax.
        sig { returns(T.nilable(String)) }
        attr_reader :keywords

        sig { params(keywords: String).void }
        attr_writer :keywords

        # Language code filter, e.g. en or tr.
        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

        # Search within a list ID.
        sig { returns(T.nilable(String)) }
        attr_reader :list_id

        sig { params(list_id: String).void }
        attr_writer :list_id

        # Maximum likes threshold. maxLikes is also accepted.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_faves

        sig { params(max_faves: Integer).void }
        attr_writer :max_faves

        # Return Tweets older than this Tweet ID.
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

        # Filter by media type.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::OrSymbol
            )
          )
        end
        attr_reader :media_type

        sig do
          params(
            media_type:
              XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::OrSymbol
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

        # Minimum likes threshold. minLikes is also accepted.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_faves

        sig { params(min_faves: Integer).void }
        attr_writer :min_faves

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

        # Optional legacy pagination override. Filters such as keywords don't apply with
        # it.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::UserRetrieveTweetsParams::Mode::OrSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode: XTwitterScraper::X::UserRetrieveTweetsParams::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Only return native reposts.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :native_retweets

        sig { params(native_retweets: T::Boolean).void }
        attr_writer :native_retweets

        # Match a place name.
        sig { returns(T.nilable(String)) }
        attr_reader :near

        sig { params(near: String).void }
        attr_writer :near

        # Only return news results.
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

        # Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20.
        # Continue while has_next_page is true. Deprecated aliases remain accepted.
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

        # Quote mode.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::UserRetrieveTweetsParams::Quotes::OrSymbol
            )
          )
        end
        attr_reader :quotes

        sig do
          params(
            quotes:
              XTwitterScraper::X::UserRetrieveTweetsParams::Quotes::OrSymbol
          ).void
        end
        attr_writer :quotes

        # Only quotes of this tweet ID.
        sig { returns(T.nilable(String)) }
        attr_reader :quotes_of_tweet_id

        sig { params(quotes_of_tweet_id: String).void }
        attr_writer :quotes_of_tweet_id

        # Reply mode.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::UserRetrieveTweetsParams::Replies::OrSymbol
            )
          )
        end
        attr_reader :replies

        sig do
          params(
            replies:
              XTwitterScraper::X::UserRetrieveTweetsParams::Replies::OrSymbol
          ).void
        end
        attr_writer :replies

        # Retweet mode.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::UserRetrieveTweetsParams::Retweets::OrSymbol
            )
          )
        end
        attr_reader :retweets

        sig do
          params(
            retweets:
              XTwitterScraper::X::UserRetrieveTweetsParams::Retweets::OrSymbol
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

        # Start date in YYYY-MM-DD format.
        sig { returns(T.nilable(Date)) }
        attr_reader :since_date

        sig { params(since_date: Date).void }
        attr_writer :since_date

        # Return Tweets newer than this Tweet ID.
        sig { returns(T.nilable(String)) }
        attr_reader :since_id

        sig { params(since_id: String).void }
        attr_writer :since_id

        # Inclusive ISO bound for Tweet creation time, such as 2026-09-25T19:20:41Z. Unix
        # seconds also work. A time without an offset is UTC.
        sig { returns(T.nilable(String)) }
        attr_reader :since_time

        sig { params(since_time: String).void }
        attr_writer :since_time

        # Match the source application.
        sig { returns(T.nilable(String)) }
        attr_reader :source

        sig { params(source: String).void }
        attr_writer :source

        # Filter replies sent to a username.
        sig { returns(T.nilable(String)) }
        attr_reader :to_user

        sig { params(to_user: String).void }
        attr_writer :to_user

        # Keep only posts about this topic. AI-powered analysis asks "Is this post about
        # <topic>?" of each post & keeps scores of 0.5 or more. It reads post text & safe
        # photos. Each kept post costs 2 credits, the AI analysis price, instead of the
        # read price, & a post the filter drops costs nothing. limit counts checked posts,
        # & only kept posts come back. topicFilter states the cutoff & counts.
        sig { returns(T.nilable(String)) }
        attr_reader :topic

        sig { params(topic: String).void }
        attr_writer :topic

        # End date in YYYY-MM-DD format.
        sig { returns(T.nilable(Date)) }
        attr_reader :until_date

        sig { params(until_date: Date).void }
        attr_writer :until_date

        # Exclusive ISO bound for Tweet creation time. Unix seconds also work. A time
        # without an offset is UTC.
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

        # Set the radius for the near filter.
        sig { returns(T.nilable(String)) }
        attr_reader :within

        sig { params(within: String).void }
        attr_writer :within

        # Match Tweets inside a recent time window.
        sig { returns(T.nilable(String)) }
        attr_reader :within_time

        sig { params(within_time: String).void }
        attr_writer :within_time

        sig do
          params(
            id: String,
            advanced_query: String,
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
            include_parent_tweet: T::Boolean,
            include_replies: T::Boolean,
            image_shows: String,
            in_reply_to_tweet_id: String,
            keywords: String,
            language: String,
            list_id: String,
            max_faves: Integer,
            max_id: String,
            max_quotes: Integer,
            max_replies: Integer,
            max_retweets: Integer,
            media_type:
              XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::OrSymbol,
            mentioning: String,
            min_bookmarks: Integer,
            min_faves: Integer,
            min_likes: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            min_views: Integer,
            mode: XTwitterScraper::X::UserRetrieveTweetsParams::Mode::OrSymbol,
            native_retweets: T::Boolean,
            near: String,
            news: T::Boolean,
            omit: String,
            page_size: Integer,
            place: String,
            place_country: String,
            point_radius: String,
            quotes:
              XTwitterScraper::X::UserRetrieveTweetsParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::UserRetrieveTweetsParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::UserRetrieveTweetsParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            safe: T::Boolean,
            since_date: Date,
            since_id: String,
            since_time: String,
            source: String,
            to_user: String,
            topic: String,
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
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
          # Geo bounding box, such as -74.1 40.6 -73.9 40.8.
          bounding_box: nil,
          # Match the Tweet card name.
          card_name: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Cursor from the previous response. Xquik cursors resume automatic coverage.
          # Existing unprefixed cursors keep legacy standard behavior.
          cursor: nil,
          # Exact phrase to match.
          exact_phrase: nil,
          # Exclude a source application.
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
          # Filter by author username.
          from_user: nil,
          # Match latitude, longitude, and radius.
          geocode: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Include parent tweet for replies
          include_parent_tweet: nil,
          # Include reply tweets
          include_replies: nil,
          # Keep only posts whose photos show this. Send charts, screenshots,
          # product_photos, memes or people, or describe it in words, such as a rocket.
          # AI-powered analysis checks posts with photos X doesn't mark sensitive & keeps
          # scores of 0.5 or more. Other posts stay out at no charge. Each kept post costs 2
          # credits, the AI analysis price, instead of the read price, & a post the filter
          # drops costs nothing. imageFilter states the cutoff & counts.
          image_shows: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Words the Tweets must match, in X search syntax.
          keywords: nil,
          # Language code filter, e.g. en or tr.
          language: nil,
          # Search within a list ID.
          list_id: nil,
          # Maximum likes threshold. maxLikes is also accepted.
          max_faves: nil,
          # Return Tweets older than this Tweet ID.
          max_id: nil,
          # Maximum quotes threshold.
          max_quotes: nil,
          # Maximum replies threshold.
          max_replies: nil,
          # Maximum retweets threshold.
          max_retweets: nil,
          # Filter by media type.
          media_type: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Minimum bookmark count threshold.
          min_bookmarks: nil,
          # Minimum likes threshold. minLikes is also accepted.
          min_faves: nil,
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
          # Optional legacy pagination override. Filters such as keywords don't apply with
          # it.
          mode: nil,
          # Only return native reposts.
          native_retweets: nil,
          # Match a place name.
          near: nil,
          # Only return news results.
          news: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          # Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20.
          # Continue while has_next_page is true. Deprecated aliases remain accepted.
          page_size: nil,
          # Search within a place ID.
          place: nil,
          # Search within a country code.
          place_country: nil,
          # Geo point radius, such as -73.99 40.73 25mi.
          point_radius: nil,
          # Quote mode.
          quotes: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Reply mode.
          replies: nil,
          # Retweet mode.
          retweets: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Enable the safe-search filter.
          safe: nil,
          # Start date in YYYY-MM-DD format.
          since_date: nil,
          # Return Tweets newer than this Tweet ID.
          since_id: nil,
          # Inclusive ISO bound for Tweet creation time, such as 2026-09-25T19:20:41Z. Unix
          # seconds also work. A time without an offset is UTC.
          since_time: nil,
          # Match the source application.
          source: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # Keep only posts about this topic. AI-powered analysis asks "Is this post about
          # <topic>?" of each post & keeps scores of 0.5 or more. It reads post text & safe
          # photos. Each kept post costs 2 credits, the AI analysis price, instead of the
          # read price, & a post the filter drops costs nothing. limit counts checked posts,
          # & only kept posts come back. topicFilter states the cutoff & counts.
          topic: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # Exclusive ISO bound for Tweet creation time. Unix seconds also work. A time
          # without an offset is UTC.
          until_time: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          # Set the radius for the near filter.
          within: nil,
          # Match Tweets inside a recent time window.
          within_time: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              advanced_query: String,
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
              include_parent_tweet: T::Boolean,
              include_replies: T::Boolean,
              image_shows: String,
              in_reply_to_tweet_id: String,
              keywords: String,
              language: String,
              list_id: String,
              max_faves: Integer,
              max_id: String,
              max_quotes: Integer,
              max_replies: Integer,
              max_retweets: Integer,
              media_type:
                XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::OrSymbol,
              mentioning: String,
              min_bookmarks: Integer,
              min_faves: Integer,
              min_likes: Integer,
              min_quotes: Integer,
              min_replies: Integer,
              min_retweets: Integer,
              min_views: Integer,
              mode:
                XTwitterScraper::X::UserRetrieveTweetsParams::Mode::OrSymbol,
              native_retweets: T::Boolean,
              near: String,
              news: T::Boolean,
              omit: String,
              page_size: Integer,
              place: String,
              place_country: String,
              point_radius: String,
              quotes:
                XTwitterScraper::X::UserRetrieveTweetsParams::Quotes::OrSymbol,
              quotes_of_tweet_id: String,
              replies:
                XTwitterScraper::X::UserRetrieveTweetsParams::Replies::OrSymbol,
              retweets:
                XTwitterScraper::X::UserRetrieveTweetsParams::Retweets::OrSymbol,
              retweets_of_tweet_id: String,
              safe: T::Boolean,
              since_date: Date,
              since_id: String,
              since_time: String,
              source: String,
              to_user: String,
              topic: String,
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

        # Filter by media type.
        module MediaType
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::X::UserRetrieveTweetsParams::MediaType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGES =
            T.let(
              :images,
              XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::TaggedSymbol
            )
          VIDEOS =
            T.let(
              :videos,
              XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::TaggedSymbol
            )
          GIFS =
            T.let(
              :gifs,
              XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::TaggedSymbol
            )
          MEDIA =
            T.let(
              :media,
              XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::TaggedSymbol
            )
          LINKS =
            T.let(
              :links,
              XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Quote mode.
        module Quotes
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::X::UserRetrieveTweetsParams::Quotes
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::UserRetrieveTweetsParams::Quotes::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::UserRetrieveTweetsParams::Quotes::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::UserRetrieveTweetsParams::Quotes::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::UserRetrieveTweetsParams::Quotes::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Reply mode.
        module Replies
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::X::UserRetrieveTweetsParams::Replies
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::UserRetrieveTweetsParams::Replies::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::UserRetrieveTweetsParams::Replies::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::UserRetrieveTweetsParams::Replies::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::UserRetrieveTweetsParams::Replies::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Retweet mode.
        module Retweets
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::X::UserRetrieveTweetsParams::Retweets
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::UserRetrieveTweetsParams::Retweets::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::UserRetrieveTweetsParams::Retweets::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::UserRetrieveTweetsParams::Retweets::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::UserRetrieveTweetsParams::Retweets::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Optional legacy pagination override. Filters such as keywords don't apply with
        # it.
        module Mode
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::X::UserRetrieveTweetsParams::Mode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STANDARD =
            T.let(
              :standard,
              XTwitterScraper::X::UserRetrieveTweetsParams::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::UserRetrieveTweetsParams::Mode::TaggedSymbol
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
