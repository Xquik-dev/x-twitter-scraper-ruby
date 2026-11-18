# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserRetrieveArticlesParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::UserRetrieveArticlesParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Pagination cursor for collection results. Also read as next_cursor, next_token,
        # pagination_token or continuation_token.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Items per page. A page holds up to 10,000, so a larger pageSize gets the largest
        # page. Default 20. Source, filters or credits can return fewer. Follow
        # next_cursor for more pages. Its aliases are limit, count, max_results, maxItems,
        # max_items & per_page.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        # Filter by author username. Account searches include all of the account's posts &
        # reposts.
        sig { returns(T.nilable(String)) }
        attr_reader :from_user

        sig { params(from_user: String).void }
        attr_writer :from_user

        # Filter replies sent to a username.
        sig { returns(T.nilable(String)) }
        attr_reader :to_user

        sig { params(to_user: String).void }
        attr_writer :to_user

        # Filter tweets mentioning a username.
        sig { returns(T.nilable(String)) }
        attr_reader :mentioning

        sig { params(mentioning: String).void }
        attr_writer :mentioning

        # Filter by language. Its alias is `lang`. Language filters work for every
        # language X tags.
        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

        # Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any
        # common form.
        sig { returns(T.nilable(Date)) }
        attr_reader :since_date

        sig { params(since_date: Date).void }
        attr_writer :since_date

        # End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
        sig { returns(T.nilable(Date)) }
        attr_reader :until_date

        sig { params(until_date: Date).void }
        attr_writer :until_date

        # Filter media. Its aliases are has_video & has_media.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType::TaggedSymbol
            )
          )
        end
        attr_reader :media_type

        sig do
          params(
            media_type:
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType::OrSymbol
          ).void
        end
        attr_writer :media_type

        # Minimum likes. Its aliases are minFaves, min_likes & min_faves.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_likes

        sig { params(min_likes: Integer).void }
        attr_writer :min_likes

        # Minimum retweets threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_retweets

        sig { params(min_retweets: Integer).void }
        attr_writer :min_retweets

        # Minimum replies threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_replies

        sig { params(min_replies: Integer).void }
        attr_writer :min_replies

        # Minimum quote count threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_quotes

        sig { params(min_quotes: Integer).void }
        attr_writer :min_quotes

        # Minimum view count threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_views

        sig { params(min_views: Integer).void }
        attr_writer :min_views

        # Minimum bookmark count threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_bookmarks

        sig { params(min_bookmarks: Integer).void }
        attr_writer :min_bookmarks

        # Maximum likes threshold. maxLikes & max_likes also work.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_faves

        sig { params(max_faves: Integer).void }
        attr_writer :max_faves

        # Maximum retweets threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_retweets

        sig { params(max_retweets: Integer).void }
        attr_writer :max_retweets

        # Maximum replies threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_replies

        sig { params(max_replies: Integer).void }
        attr_writer :max_replies

        # Maximum quotes threshold.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_quotes

        sig { params(max_quotes: Integer).void }
        attr_writer :max_quotes

        # Only return tweets from Blue-verified authors.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :blue_verified_only

        sig { params(blue_verified_only: T::Boolean).void }
        attr_writer :blue_verified_only

        # Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id`
        # bounds.
        sig { returns(T.nilable(String)) }
        attr_reader :since_id

        sig { params(since_id: String).void }
        attr_writer :since_id

        # Return Tweets at or below this ID.
        sig { returns(T.nilable(String)) }
        attr_reader :max_id

        sig { params(max_id: String).void }
        attr_writer :max_id

        # Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
        # h or d.
        sig { returns(T.nilable(String)) }
        attr_reader :within_time

        sig { params(within_time: String).void }
        attr_writer :within_time

        # Only return native reposts.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :native_retweets

        sig { params(native_retweets: T::Boolean).void }
        attr_writer :native_retweets

        # Only return tweets from verified authors.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :verified_only

        sig { params(verified_only: T::Boolean).void }
        attr_writer :verified_only

        # Reply mode. Exclude keeps own-thread replies.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Replies::TaggedSymbol
            )
          )
        end
        attr_reader :replies

        sig do
          params(
            replies:
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Replies::OrSymbol
          ).void
        end
        attr_writer :replies

        # Only when the caller requests a repost mode.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Retweets::TaggedSymbol
            )
          )
        end
        attr_reader :retweets

        sig do
          params(
            retweets:
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Retweets::OrSymbol
          ).void
        end
        attr_writer :retweets

        # Only when the caller requests a quote mode.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Quotes::TaggedSymbol
            )
          )
        end
        attr_reader :quotes

        sig do
          params(
            quotes:
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Quotes::OrSymbol
          ).void
        end
        attr_writer :quotes

        # Match this exact phrase, word for word.
        sig { returns(T.nilable(String)) }
        attr_reader :exact_phrase

        sig { params(exact_phrase: String).void }
        attr_writer :exact_phrase

        # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        sig { returns(T.nilable(String)) }
        attr_reader :exclude_words

        sig { params(exclude_words: String).void }
        attr_writer :exclude_words

        # Words or quoted phrases where any one can match. Separate with spaces, commas,
        # or lines.
        sig { returns(T.nilable(String)) }
        attr_reader :any_words

        sig { params(any_words: String).void }
        attr_writer :any_words

        # Hashtags separated by spaces, commas, or lines.
        sig { returns(T.nilable(String)) }
        attr_reader :hashtags

        sig { params(hashtags: String).void }
        attr_writer :hashtags

        # Cashtags separated by spaces, commas, or lines.
        sig { returns(T.nilable(String)) }
        attr_reader :cashtags

        sig { params(cashtags: String).void }
        attr_writer :cashtags

        # URL substring or domain filter.
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # Conversation ID filter.
        sig { returns(T.nilable(String)) }
        attr_reader :conversation_id

        sig { params(conversation_id: String).void }
        attr_writer :conversation_id

        # Only replies to this tweet ID.
        sig { returns(T.nilable(String)) }
        attr_reader :in_reply_to_tweet_id

        sig { params(in_reply_to_tweet_id: String).void }
        attr_writer :in_reply_to_tweet_id

        # Only quotes of this tweet ID.
        sig { returns(T.nilable(String)) }
        attr_reader :quotes_of_tweet_id

        sig { params(quotes_of_tweet_id: String).void }
        attr_writer :quotes_of_tweet_id

        # Only retweets of this tweet ID.
        sig { returns(T.nilable(String)) }
        attr_reader :retweets_of_tweet_id

        sig { params(retweets_of_tweet_id: String).void }
        attr_writer :retweets_of_tweet_id

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

        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        sig { returns(T.nilable(String)) }
        attr_reader :omit

        sig { params(omit: String).void }
        attr_writer :omit

        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            from_user: String,
            to_user: String,
            mentioning: String,
            language: String,
            since_date: Date,
            until_date: Date,
            media_type:
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType::OrSymbol,
            min_likes: Integer,
            min_retweets: Integer,
            min_replies: Integer,
            min_quotes: Integer,
            min_views: Integer,
            min_bookmarks: Integer,
            max_faves: Integer,
            max_retweets: Integer,
            max_replies: Integer,
            max_quotes: Integer,
            blue_verified_only: T::Boolean,
            since_id: String,
            max_id: String,
            within_time: String,
            native_retweets: T::Boolean,
            verified_only: T::Boolean,
            replies:
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Retweets::OrSymbol,
            quotes:
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Quotes::OrSymbol,
            exact_phrase: String,
            exclude_words: String,
            any_words: String,
            hashtags: String,
            cashtags: String,
            url: String,
            conversation_id: String,
            in_reply_to_tweet_id: String,
            quotes_of_tweet_id: String,
            retweets_of_tweet_id: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Items per page. A page holds up to 10,000, so a larger pageSize gets the largest
          # page. Default 20. Source, filters or credits can return fewer. Follow
          # next_cursor for more pages. Its aliases are limit, count, max_results, maxItems,
          # max_items & per_page.
          page_size: nil,
          # Filter by author username. Account searches include all of the account's posts &
          # reposts.
          from_user: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Filter by language. Its alias is `lang`. Language filters work for every
          # language X tags.
          language: nil,
          # Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any
          # common form.
          since_date: nil,
          # End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
          until_date: nil,
          # Filter media. Its aliases are has_video & has_media.
          media_type: nil,
          # Minimum likes. Its aliases are minFaves, min_likes & min_faves.
          min_likes: nil,
          # Minimum retweets threshold.
          min_retweets: nil,
          # Minimum replies threshold.
          min_replies: nil,
          # Minimum quote count threshold.
          min_quotes: nil,
          # Minimum view count threshold.
          min_views: nil,
          # Minimum bookmark count threshold.
          min_bookmarks: nil,
          # Maximum likes threshold. maxLikes & max_likes also work.
          max_faves: nil,
          # Maximum retweets threshold.
          max_retweets: nil,
          # Maximum replies threshold.
          max_replies: nil,
          # Maximum quotes threshold.
          max_quotes: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
          # Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id`
          # bounds.
          since_id: nil,
          # Return Tweets at or below this ID.
          max_id: nil,
          # Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
          # h or d.
          within_time: nil,
          # Only return native reposts.
          native_retweets: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          # Reply mode. Exclude keeps own-thread replies.
          replies: nil,
          # Only when the caller requests a repost mode.
          retweets: nil,
          # Only when the caller requests a quote mode.
          quotes: nil,
          # Match this exact phrase, word for word.
          exact_phrase: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # URL substring or domain filter.
          url: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              cursor: String,
              page_size: Integer,
              from_user: String,
              to_user: String,
              mentioning: String,
              language: String,
              since_date: Date,
              until_date: Date,
              media_type:
                XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType::TaggedSymbol,
              min_likes: Integer,
              min_retweets: Integer,
              min_replies: Integer,
              min_quotes: Integer,
              min_views: Integer,
              min_bookmarks: Integer,
              max_faves: Integer,
              max_retweets: Integer,
              max_replies: Integer,
              max_quotes: Integer,
              blue_verified_only: T::Boolean,
              since_id: String,
              max_id: String,
              within_time: String,
              native_retweets: T::Boolean,
              verified_only: T::Boolean,
              replies:
                XTwitterScraper::Models::X::UserRetrieveArticlesParams::Replies::TaggedSymbol,
              retweets:
                XTwitterScraper::Models::X::UserRetrieveArticlesParams::Retweets::TaggedSymbol,
              quotes:
                XTwitterScraper::Models::X::UserRetrieveArticlesParams::Quotes::TaggedSymbol,
              exact_phrase: String,
              exclude_words: String,
              any_words: String,
              hashtags: String,
              cashtags: String,
              url: String,
              conversation_id: String,
              in_reply_to_tweet_id: String,
              quotes_of_tweet_id: String,
              retweets_of_tweet_id: String,
              fields: String,
              omit: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end

        module MediaType
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGES =
            T.let(
              :images,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType::TaggedSymbol
            )
          VIDEOS =
            T.let(
              :videos,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType::TaggedSymbol
            )
          GIFS =
            T.let(
              :gifs,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType::TaggedSymbol
            )
          MEDIA =
            T.let(
              :media,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType::TaggedSymbol
            )
          LINKS =
            T.let(
              :links,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Replies
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::X::UserRetrieveArticlesParams::Replies
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Replies::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Replies::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Replies::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::UserRetrieveArticlesParams::Replies::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Retweets
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::X::UserRetrieveArticlesParams::Retweets
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Retweets::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Retweets::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Retweets::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::UserRetrieveArticlesParams::Retweets::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Quotes
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::X::UserRetrieveArticlesParams::Quotes
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Quotes::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Quotes::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Quotes::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::UserRetrieveArticlesParams::Quotes::TaggedSymbol
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
