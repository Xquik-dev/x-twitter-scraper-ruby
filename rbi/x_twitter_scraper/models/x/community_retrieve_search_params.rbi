# typed: strong

module XTwitterScraper
  module Models
    module X
      class CommunityRetrieveSearchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::CommunityRetrieveSearchParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Search query
        sig { returns(String) }
        attr_accessor :q

        # Pagination cursor for community search
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Sort order (Latest or Top)
        sig { returns(T.nilable(String)) }
        attr_reader :query_type

        sig { params(query_type: String).void }
        attr_writer :query_type

        sig do
          params(
            q: String,
            cursor: String,
            query_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Search query
          q:,
          # Pagination cursor for community search
          cursor: nil,
          # Sort order (Latest or Top)
          query_type: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              q: String,
              cursor: String,
              query_type: String,
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
