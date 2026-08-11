# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetGetRepliesParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetGetRepliesParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

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

        # Exclude replies written by the source-post author.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :exclude_original_author

        sig { params(exclude_original_author: T::Boolean).void }
        attr_writer :exclude_original_author

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

        # Only return replies containing media.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_media_only

        sig { params(has_media_only: T::Boolean).void }
        attr_writer :has_media_only

        # Include the source post and count it toward limit.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_original_post

        sig { params(include_original_post: T::Boolean).void }
        attr_writer :include_original_post

        # Only replies to this tweet ID.
        sig { returns(T.nilable(String)) }
        attr_reader :in_reply_to_tweet_id

        sig { params(in_reply_to_tweet_id: String).void }
        attr_writer :in_reply_to_tweet_id

        # Language code filter, e.g. en or tr.
        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

        # With mode=complete, maximum combined direct and nested reply rows (1-25000,
        # default 25000). Automatic pages accept 1-300. Standard pages accept 1-100.
        # Prefer pageSize outside complete mode.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Maximum reply depth from the source post.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_depth

        sig { params(max_depth: Integer).void }
        attr_writer :max_depth

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
              XTwitterScraper::X::TweetGetRepliesParams::MediaType::OrSymbol
            )
          )
        end
        attr_reader :media_type

        sig do
          params(
            media_type:
              XTwitterScraper::X::TweetGetRepliesParams::MediaType::OrSymbol
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

        # Minimum likes threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_faves

        sig { params(min_faves: Integer).void }
        attr_writer :min_faves

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

        # Optional advanced override. Omit mode for automatic maximum direct reply
        # coverage with pagination. Standard keeps legacy pagination. Complete returns
        # direct and nested replies with diagnostics, scope, depth, sorting, and
        # original-post controls.
        sig do
          returns(
            T.nilable(XTwitterScraper::X::TweetGetRepliesParams::Mode::OrSymbol)
          )
        end
        attr_reader :mode

        sig do
          params(
            mode: XTwitterScraper::X::TweetGetRepliesParams::Mode::OrSymbol
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

        # Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20.
        # Continue while has_next_page is true. Deprecated aliases remain accepted.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        # Quote mode.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::TweetGetRepliesParams::Quotes::OrSymbol
            )
          )
        end
        attr_reader :quotes

        sig do
          params(
            quotes: XTwitterScraper::X::TweetGetRepliesParams::Quotes::OrSymbol
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
              XTwitterScraper::X::TweetGetRepliesParams::Replies::OrSymbol
            )
          )
        end
        attr_reader :replies

        sig do
          params(
            replies:
              XTwitterScraper::X::TweetGetRepliesParams::Replies::OrSymbol
          ).void
        end
        attr_writer :replies

        # Retweet mode.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::TweetGetRepliesParams::Retweets::OrSymbol
            )
          )
        end
        attr_reader :retweets

        sig do
          params(
            retweets:
              XTwitterScraper::X::TweetGetRepliesParams::Retweets::OrSymbol
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

        # Select all replies, direct replies, or nested replies.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::TweetGetRepliesParams::Scope::OrSymbol
            )
          )
        end
        attr_reader :scope

        sig do
          params(
            scope: XTwitterScraper::X::TweetGetRepliesParams::Scope::OrSymbol
          ).void
        end
        attr_writer :scope

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

        # Unix timestamp - return replies posted after this time
        sig { returns(T.nilable(String)) }
        attr_reader :since_time

        sig { params(since_time: String).void }
        attr_writer :since_time

        # Sort the selected replies before applying limit.
        sig do
          returns(
            T.nilable(XTwitterScraper::X::TweetGetRepliesParams::Sort::OrSymbol)
          )
        end
        attr_reader :sort

        sig do
          params(
            sort: XTwitterScraper::X::TweetGetRepliesParams::Sort::OrSymbol
          ).void
        end
        attr_writer :sort

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

        # End date in YYYY-MM-DD format.
        sig { returns(T.nilable(Date)) }
        attr_reader :until_date

        sig { params(until_date: Date).void }
        attr_writer :until_date

        # Unix timestamp - return replies posted before this time
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
            any_words: String,
            blue_verified_only: T::Boolean,
            card_name: String,
            cashtags: String,
            conversation_id: String,
            cursor: String,
            exact_phrase: String,
            exclude_original_author: T::Boolean,
            exclude_source: String,
            exclude_words: String,
            from_user: String,
            geocode: String,
            hashtags: String,
            has_media_only: T::Boolean,
            include_original_post: T::Boolean,
            in_reply_to_tweet_id: String,
            language: String,
            limit: Integer,
            max_depth: Integer,
            max_faves: Integer,
            max_id: String,
            max_quotes: Integer,
            max_replies: Integer,
            max_retweets: Integer,
            media_type:
              XTwitterScraper::X::TweetGetRepliesParams::MediaType::OrSymbol,
            mentioning: String,
            min_bookmarks: Integer,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            min_views: Integer,
            mode: XTwitterScraper::X::TweetGetRepliesParams::Mode::OrSymbol,
            native_retweets: T::Boolean,
            near: String,
            news: T::Boolean,
            page_size: Integer,
            quotes: XTwitterScraper::X::TweetGetRepliesParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::TweetGetRepliesParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::TweetGetRepliesParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            safe: T::Boolean,
            scope: XTwitterScraper::X::TweetGetRepliesParams::Scope::OrSymbol,
            since_date: Date,
            since_id: String,
            since_time: String,
            sort: XTwitterScraper::X::TweetGetRepliesParams::Sort::OrSymbol,
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
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
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
          # Exclude replies written by the source-post author.
          exclude_original_author: nil,
          # Exclude a source application.
          exclude_source: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Filter by author username.
          from_user: nil,
          # Match latitude, longitude, and radius.
          geocode: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Only return replies containing media.
          has_media_only: nil,
          # Include the source post and count it toward limit.
          include_original_post: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Language code filter, e.g. en or tr.
          language: nil,
          # With mode=complete, maximum combined direct and nested reply rows (1-25000,
          # default 25000). Automatic pages accept 1-300. Standard pages accept 1-100.
          # Prefer pageSize outside complete mode.
          limit: nil,
          # Maximum reply depth from the source post.
          max_depth: nil,
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
          # Minimum likes threshold.
          min_faves: nil,
          # Minimum quote count threshold.
          min_quotes: nil,
          # Minimum replies threshold.
          min_replies: nil,
          # Minimum retweets threshold.
          min_retweets: nil,
          # Minimum view count threshold.
          min_views: nil,
          # Optional advanced override. Omit mode for automatic maximum direct reply
          # coverage with pagination. Standard keeps legacy pagination. Complete returns
          # direct and nested replies with diagnostics, scope, depth, sorting, and
          # original-post controls.
          mode: nil,
          # Only return native reposts.
          native_retweets: nil,
          # Match a place name.
          near: nil,
          # Only return news results.
          news: nil,
          # Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20.
          # Continue while has_next_page is true. Deprecated aliases remain accepted.
          page_size: nil,
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
          # Select all replies, direct replies, or nested replies.
          scope: nil,
          # Start date in YYYY-MM-DD format.
          since_date: nil,
          # Return Tweets newer than this Tweet ID.
          since_id: nil,
          # Unix timestamp - return replies posted after this time
          since_time: nil,
          # Sort the selected replies before applying limit.
          sort: nil,
          # Match the source application.
          source: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # Unix timestamp - return replies posted before this time
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
              any_words: String,
              blue_verified_only: T::Boolean,
              card_name: String,
              cashtags: String,
              conversation_id: String,
              cursor: String,
              exact_phrase: String,
              exclude_original_author: T::Boolean,
              exclude_source: String,
              exclude_words: String,
              from_user: String,
              geocode: String,
              hashtags: String,
              has_media_only: T::Boolean,
              include_original_post: T::Boolean,
              in_reply_to_tweet_id: String,
              language: String,
              limit: Integer,
              max_depth: Integer,
              max_faves: Integer,
              max_id: String,
              max_quotes: Integer,
              max_replies: Integer,
              max_retweets: Integer,
              media_type:
                XTwitterScraper::X::TweetGetRepliesParams::MediaType::OrSymbol,
              mentioning: String,
              min_bookmarks: Integer,
              min_faves: Integer,
              min_quotes: Integer,
              min_replies: Integer,
              min_retweets: Integer,
              min_views: Integer,
              mode: XTwitterScraper::X::TweetGetRepliesParams::Mode::OrSymbol,
              native_retweets: T::Boolean,
              near: String,
              news: T::Boolean,
              page_size: Integer,
              quotes:
                XTwitterScraper::X::TweetGetRepliesParams::Quotes::OrSymbol,
              quotes_of_tweet_id: String,
              replies:
                XTwitterScraper::X::TweetGetRepliesParams::Replies::OrSymbol,
              retweets:
                XTwitterScraper::X::TweetGetRepliesParams::Retweets::OrSymbol,
              retweets_of_tweet_id: String,
              safe: T::Boolean,
              scope: XTwitterScraper::X::TweetGetRepliesParams::Scope::OrSymbol,
              since_date: Date,
              since_id: String,
              since_time: String,
              sort: XTwitterScraper::X::TweetGetRepliesParams::Sort::OrSymbol,
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

        # Filter by media type.
        module MediaType
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::X::TweetGetRepliesParams::MediaType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGES =
            T.let(
              :images,
              XTwitterScraper::X::TweetGetRepliesParams::MediaType::TaggedSymbol
            )
          VIDEOS =
            T.let(
              :videos,
              XTwitterScraper::X::TweetGetRepliesParams::MediaType::TaggedSymbol
            )
          GIFS =
            T.let(
              :gifs,
              XTwitterScraper::X::TweetGetRepliesParams::MediaType::TaggedSymbol
            )
          MEDIA =
            T.let(
              :media,
              XTwitterScraper::X::TweetGetRepliesParams::MediaType::TaggedSymbol
            )
          LINKS =
            T.let(
              :links,
              XTwitterScraper::X::TweetGetRepliesParams::MediaType::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              XTwitterScraper::X::TweetGetRepliesParams::MediaType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetGetRepliesParams::MediaType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Optional advanced override. Omit mode for automatic maximum direct reply
        # coverage with pagination. Standard keeps legacy pagination. Complete returns
        # direct and nested replies with diagnostics, scope, depth, sorting, and
        # original-post controls.
        module Mode
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::X::TweetGetRepliesParams::Mode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STANDARD =
            T.let(
              :standard,
              XTwitterScraper::X::TweetGetRepliesParams::Mode::TaggedSymbol
            )
          COMPLETE =
            T.let(
              :complete,
              XTwitterScraper::X::TweetGetRepliesParams::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetGetRepliesParams::Mode::TaggedSymbol
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
              T.all(Symbol, XTwitterScraper::X::TweetGetRepliesParams::Quotes)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::TweetGetRepliesParams::Quotes::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::TweetGetRepliesParams::Quotes::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::TweetGetRepliesParams::Quotes::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetGetRepliesParams::Quotes::TaggedSymbol
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
              T.all(Symbol, XTwitterScraper::X::TweetGetRepliesParams::Replies)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::TweetGetRepliesParams::Replies::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::TweetGetRepliesParams::Replies::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::TweetGetRepliesParams::Replies::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetGetRepliesParams::Replies::TaggedSymbol
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
              T.all(Symbol, XTwitterScraper::X::TweetGetRepliesParams::Retweets)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::TweetGetRepliesParams::Retweets::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::TweetGetRepliesParams::Retweets::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::TweetGetRepliesParams::Retweets::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetGetRepliesParams::Retweets::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Select all replies, direct replies, or nested replies.
        module Scope
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::X::TweetGetRepliesParams::Scope)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALL =
            T.let(
              :all,
              XTwitterScraper::X::TweetGetRepliesParams::Scope::TaggedSymbol
            )
          DIRECT =
            T.let(
              :direct,
              XTwitterScraper::X::TweetGetRepliesParams::Scope::TaggedSymbol
            )
          NESTED =
            T.let(
              :nested,
              XTwitterScraper::X::TweetGetRepliesParams::Scope::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetGetRepliesParams::Scope::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Sort the selected replies before applying limit.
        module Sort
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::X::TweetGetRepliesParams::Sort)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RELEVANCE =
            T.let(
              :relevance,
              XTwitterScraper::X::TweetGetRepliesParams::Sort::TaggedSymbol
            )
          LATEST =
            T.let(
              :latest,
              XTwitterScraper::X::TweetGetRepliesParams::Sort::TaggedSymbol
            )
          OLDEST =
            T.let(
              :oldest,
              XTwitterScraper::X::TweetGetRepliesParams::Sort::TaggedSymbol
            )
          LIKES =
            T.let(
              :likes,
              XTwitterScraper::X::TweetGetRepliesParams::Sort::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetGetRepliesParams::Sort::TaggedSymbol
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
