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

        # Pagination cursor for quote tweets
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Include reply quotes (default false)
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_replies

        sig { params(include_replies: T::Boolean).void }
        attr_writer :include_replies

        # Unix timestamp - return quotes posted after this time
        sig { returns(T.nilable(String)) }
        attr_reader :since_time

        sig { params(since_time: String).void }
        attr_writer :since_time

        # Unix timestamp - return quotes posted before this time
        sig { returns(T.nilable(String)) }
        attr_reader :until_time

        sig { params(until_time: String).void }
        attr_writer :until_time

        sig do
          params(
            id: String,
            cursor: String,
            include_replies: T::Boolean,
            since_time: String,
            until_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Pagination cursor for quote tweets
          cursor: nil,
          # Include reply quotes (default false)
          include_replies: nil,
          # Unix timestamp - return quotes posted after this time
          since_time: nil,
          # Unix timestamp - return quotes posted before this time
          until_time: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              cursor: String,
              include_replies: T::Boolean,
              since_time: String,
              until_time: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
