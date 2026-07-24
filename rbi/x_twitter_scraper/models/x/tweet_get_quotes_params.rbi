# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetGetQuotesParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetGetQuotesParams,
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

        # Pagination cursor for quote tweets
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Exact phrase to match.
        sig { returns(T.nilable(String)) }
        attr_reader :exact_phrase

        sig { params(exact_phrase: String).void }
        attr_writer :exact_phrase

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

        # Hashtags separated by spaces, commas, or lines.
        sig { returns(T.nilable(String)) }
        attr_reader :hashtags

        sig { params(hashtags: String).void }
        attr_writer :hashtags

        # Include reply quotes (default false)
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_replies

        sig { params(include_replies: T::Boolean).void }
        attr_writer :include_replies

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

        # Filter by media type.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::TweetGetQuotesParams::MediaType::OrSymbol
            )
          )
        end
        attr_reader :media_type

        sig do
          params(
            media_type:
              XTwitterScraper::X::TweetGetQuotesParams::MediaType::OrSymbol
          ).void
        end
        attr_writer :media_type

        # Filter tweets mentioning a username.
        sig { returns(T.nilable(String)) }
        attr_reader :mentioning

        sig { params(mentioning: String).void }
        attr_writer :mentioning

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

        # Maximum items requested from this page (1-100, default 20). The response can
        # contain fewer items because the source returned fewer, filters removed items, or
        # remaining credits cover fewer results. Keep requesting next_cursor while
        # has_next_page is true, even when a page is empty. The deprecated limit and count
        # aliases remain accepted.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        # Quote mode.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::TweetGetQuotesParams::Quotes::OrSymbol
            )
          )
        end
        attr_reader :quotes

        sig do
          params(
            quotes: XTwitterScraper::X::TweetGetQuotesParams::Quotes::OrSymbol
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
              XTwitterScraper::X::TweetGetQuotesParams::Replies::OrSymbol
            )
          )
        end
        attr_reader :replies

        sig do
          params(
            replies: XTwitterScraper::X::TweetGetQuotesParams::Replies::OrSymbol
          ).void
        end
        attr_writer :replies

        # Retweet mode.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::TweetGetQuotesParams::Retweets::OrSymbol
            )
          )
        end
        attr_reader :retweets

        sig do
          params(
            retweets:
              XTwitterScraper::X::TweetGetQuotesParams::Retweets::OrSymbol
          ).void
        end
        attr_writer :retweets

        # Only retweets of this tweet ID.
        sig { returns(T.nilable(String)) }
        attr_reader :retweets_of_tweet_id

        sig { params(retweets_of_tweet_id: String).void }
        attr_writer :retweets_of_tweet_id

        # Start date in YYYY-MM-DD format.
        sig { returns(T.nilable(Date)) }
        attr_reader :since_date

        sig { params(since_date: Date).void }
        attr_writer :since_date

        # Unix timestamp - return quotes posted after this time
        sig { returns(T.nilable(String)) }
        attr_reader :since_time

        sig { params(since_time: String).void }
        attr_writer :since_time

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

        # Unix timestamp - return quotes posted before this time
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

        sig do
          params(
            id: String,
            any_words: String,
            cashtags: String,
            conversation_id: String,
            cursor: String,
            exact_phrase: String,
            exclude_words: String,
            from_user: String,
            hashtags: String,
            include_replies: T::Boolean,
            in_reply_to_tweet_id: String,
            language: String,
            media_type:
              XTwitterScraper::X::TweetGetQuotesParams::MediaType::OrSymbol,
            mentioning: String,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            page_size: Integer,
            quotes: XTwitterScraper::X::TweetGetQuotesParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::TweetGetQuotesParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::TweetGetQuotesParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            since_date: Date,
            since_time: String,
            to_user: String,
            until_date: Date,
            until_time: String,
            url: String,
            verified_only: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for quote tweets
          cursor: nil,
          # Exact phrase to match.
          exact_phrase: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Filter by author username.
          from_user: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Include reply quotes (default false)
          include_replies: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Language code filter, e.g. en or tr.
          language: nil,
          # Filter by media type.
          media_type: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Minimum likes threshold.
          min_faves: nil,
          # Minimum quote count threshold.
          min_quotes: nil,
          # Minimum replies threshold.
          min_replies: nil,
          # Minimum retweets threshold.
          min_retweets: nil,
          # Maximum items requested from this page (1-100, default 20). The response can
          # contain fewer items because the source returned fewer, filters removed items, or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true, even when a page is empty. The deprecated limit and count
          # aliases remain accepted.
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
          # Start date in YYYY-MM-DD format.
          since_date: nil,
          # Unix timestamp - return quotes posted after this time
          since_time: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # Unix timestamp - return quotes posted before this time
          until_time: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              any_words: String,
              cashtags: String,
              conversation_id: String,
              cursor: String,
              exact_phrase: String,
              exclude_words: String,
              from_user: String,
              hashtags: String,
              include_replies: T::Boolean,
              in_reply_to_tweet_id: String,
              language: String,
              media_type:
                XTwitterScraper::X::TweetGetQuotesParams::MediaType::OrSymbol,
              mentioning: String,
              min_faves: Integer,
              min_quotes: Integer,
              min_replies: Integer,
              min_retweets: Integer,
              page_size: Integer,
              quotes:
                XTwitterScraper::X::TweetGetQuotesParams::Quotes::OrSymbol,
              quotes_of_tweet_id: String,
              replies:
                XTwitterScraper::X::TweetGetQuotesParams::Replies::OrSymbol,
              retweets:
                XTwitterScraper::X::TweetGetQuotesParams::Retweets::OrSymbol,
              retweets_of_tweet_id: String,
              since_date: Date,
              since_time: String,
              to_user: String,
              until_date: Date,
              until_time: String,
              url: String,
              verified_only: T::Boolean,
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
              T.all(Symbol, XTwitterScraper::X::TweetGetQuotesParams::MediaType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGES =
            T.let(
              :images,
              XTwitterScraper::X::TweetGetQuotesParams::MediaType::TaggedSymbol
            )
          VIDEOS =
            T.let(
              :videos,
              XTwitterScraper::X::TweetGetQuotesParams::MediaType::TaggedSymbol
            )
          GIFS =
            T.let(
              :gifs,
              XTwitterScraper::X::TweetGetQuotesParams::MediaType::TaggedSymbol
            )
          MEDIA =
            T.let(
              :media,
              XTwitterScraper::X::TweetGetQuotesParams::MediaType::TaggedSymbol
            )
          LINKS =
            T.let(
              :links,
              XTwitterScraper::X::TweetGetQuotesParams::MediaType::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              XTwitterScraper::X::TweetGetQuotesParams::MediaType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetGetQuotesParams::MediaType::TaggedSymbol
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
              T.all(Symbol, XTwitterScraper::X::TweetGetQuotesParams::Quotes)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::TweetGetQuotesParams::Quotes::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::TweetGetQuotesParams::Quotes::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::TweetGetQuotesParams::Quotes::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetGetQuotesParams::Quotes::TaggedSymbol
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
              T.all(Symbol, XTwitterScraper::X::TweetGetQuotesParams::Replies)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::TweetGetQuotesParams::Replies::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::TweetGetQuotesParams::Replies::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::TweetGetQuotesParams::Replies::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetGetQuotesParams::Replies::TaggedSymbol
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
              T.all(Symbol, XTwitterScraper::X::TweetGetQuotesParams::Retweets)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::TweetGetQuotesParams::Retweets::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::TweetGetQuotesParams::Retweets::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::TweetGetQuotesParams::Retweets::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetGetQuotesParams::Retweets::TaggedSymbol
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
