# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserRetrieveSearchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::UserRetrieveSearchParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Search query
        sig { returns(String) }
        attr_accessor :q

        # Pagination cursor
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        sig do
          params(
            q: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Search query
          q:,
          # Pagination cursor
          cursor: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              q: String,
              cursor: String,
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
