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

        # Pagination cursor
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Include replies (default false)
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_replies

        sig { params(include_replies: T::Boolean).void }
        attr_writer :include_replies

        # Unix timestamp - filter after
        sig { returns(T.nilable(String)) }
        attr_reader :since_time

        sig { params(since_time: String).void }
        attr_writer :since_time

        # Unix timestamp - filter before
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
          # Pagination cursor
          cursor: nil,
          # Include replies (default false)
          include_replies: nil,
          # Unix timestamp - filter after
          since_time: nil,
          # Unix timestamp - filter before
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
