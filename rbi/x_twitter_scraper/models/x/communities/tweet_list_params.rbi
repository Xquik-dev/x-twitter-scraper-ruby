# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      module Communities
        class TweetListParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::X::Communities::TweetListParams,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Numeric ID of the community to search
          sig { returns(String) }
          attr_accessor :community_id

          # Keyword query within the selected community
          sig { returns(String) }
          attr_accessor :q

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

          # Pagination cursor for community results
          sig { returns(T.nilable(String)) }
          attr_reader :cursor

          sig { params(cursor: String).void }
          attr_writer :cursor

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
                XTwitterScraper::X::Communities::TweetListParams::MediaType::OrSymbol
              )
            )
          end
          attr_reader :media_type

          sig do
            params(
              media_type:
                XTwitterScraper::X::Communities::TweetListParams::MediaType::OrSymbol
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

          # Only return native reposts.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :native_retweets

          sig { params(native_retweets: T::Boolean).void }
          attr_writer :native_retweets

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

          # Sort order for community results (Latest or Top)
          sig do
            returns(
              T.nilable(
                XTwitterScraper::X::Communities::TweetListParams::QueryType::OrSymbol
              )
            )
          end
          attr_reader :query_type

          sig do
            params(
              query_type:
                XTwitterScraper::X::Communities::TweetListParams::QueryType::OrSymbol
            ).void
          end
          attr_writer :query_type

          # Only when the caller requests a quote mode.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::X::Communities::TweetListParams::Quotes::OrSymbol
              )
            )
          end
          attr_reader :quotes

          sig do
            params(
              quotes:
                XTwitterScraper::X::Communities::TweetListParams::Quotes::OrSymbol
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
                XTwitterScraper::X::Communities::TweetListParams::Replies::OrSymbol
              )
            )
          end
          attr_reader :replies

          sig do
            params(
              replies:
                XTwitterScraper::X::Communities::TweetListParams::Replies::OrSymbol
            ).void
          end
          attr_writer :replies

          # Only when the caller requests a repost mode.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::X::Communities::TweetListParams::Retweets::OrSymbol
              )
            )
          end
          attr_reader :retweets

          sig do
            params(
              retweets:
                XTwitterScraper::X::Communities::TweetListParams::Retweets::OrSymbol
            ).void
          end
          attr_writer :retweets

          # Only retweets of this tweet ID.
          sig { returns(T.nilable(String)) }
          attr_reader :retweets_of_tweet_id

          sig { params(retweets_of_tweet_id: String).void }
          attr_writer :retweets_of_tweet_id

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

          # Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
          # h or d.
          sig { returns(T.nilable(String)) }
          attr_reader :within_time

          sig { params(within_time: String).void }
          attr_writer :within_time

          sig do
            params(
              community_id: String,
              q: String,
              any_words: String,
              blue_verified_only: T::Boolean,
              cashtags: String,
              conversation_id: String,
              cursor: String,
              exact_phrase: String,
              exclude_words: String,
              fields: String,
              from_user: String,
              hashtags: String,
              in_reply_to_tweet_id: String,
              language: String,
              max_faves: Integer,
              max_id: String,
              max_quotes: Integer,
              max_replies: Integer,
              max_retweets: Integer,
              media_type:
                XTwitterScraper::X::Communities::TweetListParams::MediaType::OrSymbol,
              mentioning: String,
              min_bookmarks: Integer,
              min_likes: Integer,
              min_quotes: Integer,
              min_replies: Integer,
              min_retweets: Integer,
              min_views: Integer,
              native_retweets: T::Boolean,
              omit: String,
              page_size: Integer,
              query_type:
                XTwitterScraper::X::Communities::TweetListParams::QueryType::OrSymbol,
              quotes:
                XTwitterScraper::X::Communities::TweetListParams::Quotes::OrSymbol,
              quotes_of_tweet_id: String,
              replies:
                XTwitterScraper::X::Communities::TweetListParams::Replies::OrSymbol,
              retweets:
                XTwitterScraper::X::Communities::TweetListParams::Retweets::OrSymbol,
              retweets_of_tweet_id: String,
              since_date: Date,
              since_id: String,
              to_user: String,
              until_date: Date,
              url: String,
              verified_only: T::Boolean,
              within_time: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Numeric ID of the community to search
            community_id:,
            # Keyword query within the selected community
            q:,
            # Words or quoted phrases where any one can match. Separate with spaces, commas,
            # or lines.
            any_words: nil,
            # Only return tweets from Blue-verified authors.
            blue_verified_only: nil,
            # Cashtags separated by spaces, commas, or lines.
            cashtags: nil,
            # Conversation ID filter.
            conversation_id: nil,
            # Pagination cursor for community results
            cursor: nil,
            # Match this exact phrase, word for word.
            exact_phrase: nil,
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
            # Hashtags separated by spaces, commas, or lines.
            hashtags: nil,
            # Only replies to this tweet ID.
            in_reply_to_tweet_id: nil,
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
            # Only return native reposts.
            native_retweets: nil,
            # Fields to drop from each row, comma-separated. It takes the same names as
            # fields. With fields, it drops from the kept fields. A longer URL fails at the
            # edge before Xquik reads it.
            omit: nil,
            # Maximum page items (1-100, default 20). Source, filters, or credits can reduce
            # results. Continue while has_next_page is true. Deprecated limit and count
            # aliases remain accepted.
            page_size: nil,
            # Sort order for community results (Latest or Top)
            query_type: nil,
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
            # Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any
            # common form.
            since_date: nil,
            # Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id`
            # bounds.
            since_id: nil,
            # Filter replies sent to a username.
            to_user: nil,
            # End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
            until_date: nil,
            # URL substring or domain filter.
            url: nil,
            # Only return tweets from verified authors.
            verified_only: nil,
            # Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
            # h or d.
            within_time: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                community_id: String,
                q: String,
                any_words: String,
                blue_verified_only: T::Boolean,
                cashtags: String,
                conversation_id: String,
                cursor: String,
                exact_phrase: String,
                exclude_words: String,
                fields: String,
                from_user: String,
                hashtags: String,
                in_reply_to_tweet_id: String,
                language: String,
                max_faves: Integer,
                max_id: String,
                max_quotes: Integer,
                max_replies: Integer,
                max_retweets: Integer,
                media_type:
                  XTwitterScraper::X::Communities::TweetListParams::MediaType::OrSymbol,
                mentioning: String,
                min_bookmarks: Integer,
                min_likes: Integer,
                min_quotes: Integer,
                min_replies: Integer,
                min_retweets: Integer,
                min_views: Integer,
                native_retweets: T::Boolean,
                omit: String,
                page_size: Integer,
                query_type:
                  XTwitterScraper::X::Communities::TweetListParams::QueryType::OrSymbol,
                quotes:
                  XTwitterScraper::X::Communities::TweetListParams::Quotes::OrSymbol,
                quotes_of_tweet_id: String,
                replies:
                  XTwitterScraper::X::Communities::TweetListParams::Replies::OrSymbol,
                retweets:
                  XTwitterScraper::X::Communities::TweetListParams::Retweets::OrSymbol,
                retweets_of_tweet_id: String,
                since_date: Date,
                since_id: String,
                to_user: String,
                until_date: Date,
                url: String,
                verified_only: T::Boolean,
                within_time: String,
                request_options: XTwitterScraper::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Sort order for community results (Latest or Top)
          module QueryType
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::X::Communities::TweetListParams::QueryType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LATEST =
              T.let(
                :Latest,
                XTwitterScraper::X::Communities::TweetListParams::QueryType::TaggedSymbol
              )
            TOP =
              T.let(
                :Top,
                XTwitterScraper::X::Communities::TweetListParams::QueryType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::X::Communities::TweetListParams::QueryType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Filter media. Its aliases are has_video & has_media.
          module MediaType
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::X::Communities::TweetListParams::MediaType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            IMAGES =
              T.let(
                :images,
                XTwitterScraper::X::Communities::TweetListParams::MediaType::TaggedSymbol
              )
            VIDEOS =
              T.let(
                :videos,
                XTwitterScraper::X::Communities::TweetListParams::MediaType::TaggedSymbol
              )
            GIFS =
              T.let(
                :gifs,
                XTwitterScraper::X::Communities::TweetListParams::MediaType::TaggedSymbol
              )
            MEDIA =
              T.let(
                :media,
                XTwitterScraper::X::Communities::TweetListParams::MediaType::TaggedSymbol
              )
            LINKS =
              T.let(
                :links,
                XTwitterScraper::X::Communities::TweetListParams::MediaType::TaggedSymbol
              )
            NONE =
              T.let(
                :none,
                XTwitterScraper::X::Communities::TweetListParams::MediaType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::X::Communities::TweetListParams::MediaType::TaggedSymbol
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
                  XTwitterScraper::X::Communities::TweetListParams::Quotes
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INCLUDE =
              T.let(
                :include,
                XTwitterScraper::X::Communities::TweetListParams::Quotes::TaggedSymbol
              )
            EXCLUDE =
              T.let(
                :exclude,
                XTwitterScraper::X::Communities::TweetListParams::Quotes::TaggedSymbol
              )
            ONLY =
              T.let(
                :only,
                XTwitterScraper::X::Communities::TweetListParams::Quotes::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::X::Communities::TweetListParams::Quotes::TaggedSymbol
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
                  XTwitterScraper::X::Communities::TweetListParams::Replies
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INCLUDE =
              T.let(
                :include,
                XTwitterScraper::X::Communities::TweetListParams::Replies::TaggedSymbol
              )
            EXCLUDE =
              T.let(
                :exclude,
                XTwitterScraper::X::Communities::TweetListParams::Replies::TaggedSymbol
              )
            ONLY =
              T.let(
                :only,
                XTwitterScraper::X::Communities::TweetListParams::Replies::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::X::Communities::TweetListParams::Replies::TaggedSymbol
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
                  XTwitterScraper::X::Communities::TweetListParams::Retweets
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INCLUDE =
              T.let(
                :include,
                XTwitterScraper::X::Communities::TweetListParams::Retweets::TaggedSymbol
              )
            EXCLUDE =
              T.let(
                :exclude,
                XTwitterScraper::X::Communities::TweetListParams::Retweets::TaggedSymbol
              )
            ONLY =
              T.let(
                :only,
                XTwitterScraper::X::Communities::TweetListParams::Retweets::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::X::Communities::TweetListParams::Retweets::TaggedSymbol
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
end
