# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetSearchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetSearchParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Search query (keywords,
        sig { returns(String) }
        attr_accessor :q

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

        # Geo bounding box, e.g. -74.1 40.6 -73.9 40.8.
        sig { returns(T.nilable(String)) }
        attr_reader :bounding_box

        sig { params(bounding_box: String).void }
        attr_writer :bounding_box

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

        # Pagination cursor from previous response
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

        # Max tweets to return (server paginates internally). Omit for single page (~20).
        # This is an upper bound for paid authenticated calls: remaining credits can
        # reduce the returned page size, and zero affordable results returns 402
        # insufficient_credits.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Search within a list ID.
        sig { returns(T.nilable(String)) }
        attr_reader :list_id

        sig { params(list_id: String).void }
        attr_writer :list_id

        # Filter by media type.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::TweetSearchParams::MediaType::OrSymbol
            )
          )
        end
        attr_reader :media_type

        sig do
          params(
            media_type:
              XTwitterScraper::X::TweetSearchParams::MediaType::OrSymbol
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

        # Geo point radius, e.g. -73.99 40.73 25mi.
        sig { returns(T.nilable(String)) }
        attr_reader :point_radius

        sig { params(point_radius: String).void }
        attr_writer :point_radius

        # Sort order - Latest (chronological) or Top (engagement-ranked)
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::TweetSearchParams::QueryType::OrSymbol
            )
          )
        end
        attr_reader :query_type

        sig do
          params(
            query_type:
              XTwitterScraper::X::TweetSearchParams::QueryType::OrSymbol
          ).void
        end
        attr_writer :query_type

        # Quote mode.
        sig do
          returns(
            T.nilable(XTwitterScraper::X::TweetSearchParams::Quotes::OrSymbol)
          )
        end
        attr_reader :quotes

        sig do
          params(
            quotes: XTwitterScraper::X::TweetSearchParams::Quotes::OrSymbol
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
            T.nilable(XTwitterScraper::X::TweetSearchParams::Replies::OrSymbol)
          )
        end
        attr_reader :replies

        sig do
          params(
            replies: XTwitterScraper::X::TweetSearchParams::Replies::OrSymbol
          ).void
        end
        attr_writer :replies

        # Retweet mode.
        sig do
          returns(
            T.nilable(XTwitterScraper::X::TweetSearchParams::Retweets::OrSymbol)
          )
        end
        attr_reader :retweets

        sig do
          params(
            retweets: XTwitterScraper::X::TweetSearchParams::Retweets::OrSymbol
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

        # ISO 8601 timestamp - only return tweets after this time
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

        # ISO 8601 timestamp - only return tweets before this time
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
            q: String,
            advanced_query: String,
            any_words: String,
            bounding_box: String,
            cashtags: String,
            conversation_id: String,
            cursor: String,
            exact_phrase: String,
            exclude_words: String,
            from_user: String,
            hashtags: String,
            in_reply_to_tweet_id: String,
            language: String,
            limit: Integer,
            list_id: String,
            media_type:
              XTwitterScraper::X::TweetSearchParams::MediaType::OrSymbol,
            mentioning: String,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            place: String,
            place_country: String,
            point_radius: String,
            query_type:
              XTwitterScraper::X::TweetSearchParams::QueryType::OrSymbol,
            quotes: XTwitterScraper::X::TweetSearchParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies: XTwitterScraper::X::TweetSearchParams::Replies::OrSymbol,
            retweets: XTwitterScraper::X::TweetSearchParams::Retweets::OrSymbol,
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
          # Search query (keywords,
          q:,
          # Raw advanced search query appended as-is.
          advanced_query: nil,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Geo bounding box, e.g. -74.1 40.6 -73.9 40.8.
          bounding_box: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor from previous response
          cursor: nil,
          # Exact phrase to match.
          exact_phrase: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Filter by author username.
          from_user: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Language code filter, e.g. en or tr.
          language: nil,
          # Max tweets to return (server paginates internally). Omit for single page (~20).
          # This is an upper bound for paid authenticated calls: remaining credits can
          # reduce the returned page size, and zero affordable results returns 402
          # insufficient_credits.
          limit: nil,
          # Search within a list ID.
          list_id: nil,
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
          # Search within a place ID.
          place: nil,
          # Search within a country code.
          place_country: nil,
          # Geo point radius, e.g. -73.99 40.73 25mi.
          point_radius: nil,
          # Sort order - Latest (chronological) or Top (engagement-ranked)
          query_type: nil,
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
          # ISO 8601 timestamp - only return tweets after this time
          since_time: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # ISO 8601 timestamp - only return tweets before this time
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
              q: String,
              advanced_query: String,
              any_words: String,
              bounding_box: String,
              cashtags: String,
              conversation_id: String,
              cursor: String,
              exact_phrase: String,
              exclude_words: String,
              from_user: String,
              hashtags: String,
              in_reply_to_tweet_id: String,
              language: String,
              limit: Integer,
              list_id: String,
              media_type:
                XTwitterScraper::X::TweetSearchParams::MediaType::OrSymbol,
              mentioning: String,
              min_faves: Integer,
              min_quotes: Integer,
              min_replies: Integer,
              min_retweets: Integer,
              place: String,
              place_country: String,
              point_radius: String,
              query_type:
                XTwitterScraper::X::TweetSearchParams::QueryType::OrSymbol,
              quotes: XTwitterScraper::X::TweetSearchParams::Quotes::OrSymbol,
              quotes_of_tweet_id: String,
              replies: XTwitterScraper::X::TweetSearchParams::Replies::OrSymbol,
              retweets:
                XTwitterScraper::X::TweetSearchParams::Retweets::OrSymbol,
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
              T.all(Symbol, XTwitterScraper::X::TweetSearchParams::MediaType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGES =
            T.let(
              :images,
              XTwitterScraper::X::TweetSearchParams::MediaType::TaggedSymbol
            )
          VIDEOS =
            T.let(
              :videos,
              XTwitterScraper::X::TweetSearchParams::MediaType::TaggedSymbol
            )
          GIFS =
            T.let(
              :gifs,
              XTwitterScraper::X::TweetSearchParams::MediaType::TaggedSymbol
            )
          MEDIA =
            T.let(
              :media,
              XTwitterScraper::X::TweetSearchParams::MediaType::TaggedSymbol
            )
          LINKS =
            T.let(
              :links,
              XTwitterScraper::X::TweetSearchParams::MediaType::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              XTwitterScraper::X::TweetSearchParams::MediaType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetSearchParams::MediaType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Sort order - Latest (chronological) or Top (engagement-ranked)
        module QueryType
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::X::TweetSearchParams::QueryType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LATEST =
            T.let(
              :Latest,
              XTwitterScraper::X::TweetSearchParams::QueryType::TaggedSymbol
            )
          TOP =
            T.let(
              :Top,
              XTwitterScraper::X::TweetSearchParams::QueryType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetSearchParams::QueryType::TaggedSymbol
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
              T.all(Symbol, XTwitterScraper::X::TweetSearchParams::Quotes)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::TweetSearchParams::Quotes::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::TweetSearchParams::Quotes::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::TweetSearchParams::Quotes::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetSearchParams::Quotes::TaggedSymbol
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
              T.all(Symbol, XTwitterScraper::X::TweetSearchParams::Replies)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::TweetSearchParams::Replies::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::TweetSearchParams::Replies::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::TweetSearchParams::Replies::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetSearchParams::Replies::TaggedSymbol
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
              T.all(Symbol, XTwitterScraper::X::TweetSearchParams::Retweets)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INCLUDE =
            T.let(
              :include,
              XTwitterScraper::X::TweetSearchParams::Retweets::TaggedSymbol
            )
          EXCLUDE =
            T.let(
              :exclude,
              XTwitterScraper::X::TweetSearchParams::Retweets::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              XTwitterScraper::X::TweetSearchParams::Retweets::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetSearchParams::Retweets::TaggedSymbol
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
