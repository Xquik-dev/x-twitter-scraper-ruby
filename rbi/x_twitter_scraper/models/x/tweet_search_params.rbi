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

        # Pagination cursor from previous response
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Max tweets to return (server paginates internally). Omit for single page (~20).
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Sort order — Latest (chronological) or Top (engagement-ranked)
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

        # ISO 8601 timestamp — only return tweets after this time
        sig { returns(T.nilable(String)) }
        attr_reader :since_time

        sig { params(since_time: String).void }
        attr_writer :since_time

        # ISO 8601 timestamp — only return tweets before this time
        sig { returns(T.nilable(String)) }
        attr_reader :until_time

        sig { params(until_time: String).void }
        attr_writer :until_time

        sig do
          params(
            q: String,
            cursor: String,
            limit: Integer,
            query_type:
              XTwitterScraper::X::TweetSearchParams::QueryType::OrSymbol,
            since_time: String,
            until_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Search query (keywords,
          q:,
          # Pagination cursor from previous response
          cursor: nil,
          # Max tweets to return (server paginates internally). Omit for single page (~20).
          limit: nil,
          # Sort order — Latest (chronological) or Top (engagement-ranked)
          query_type: nil,
          # ISO 8601 timestamp — only return tweets after this time
          since_time: nil,
          # ISO 8601 timestamp — only return tweets before this time
          until_time: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              q: String,
              cursor: String,
              limit: Integer,
              query_type:
                XTwitterScraper::X::TweetSearchParams::QueryType::OrSymbol,
              since_time: String,
              until_time: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Sort order — Latest (chronological) or Top (engagement-ranked)
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
      end
    end
  end
end
