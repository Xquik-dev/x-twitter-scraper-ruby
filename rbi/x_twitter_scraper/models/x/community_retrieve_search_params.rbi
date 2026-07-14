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

        # Numeric ID of the community whose posts to search
        sig { returns(String) }
        attr_accessor :community_id

        # Search query
        sig { returns(String) }
        attr_accessor :q

        # Pagination cursor for community search
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Maximum items requested from this page (1-100, default 20). The response can
        # contain fewer items because the source returned fewer, filters removed items, or
        # remaining credits cover fewer results. Keep requesting next_cursor while
        # has_next_page is true, even when a page is empty. The deprecated limit and count
        # aliases remain accepted.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        # Sort order (Latest or Top)
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::CommunityRetrieveSearchParams::QueryType::OrSymbol
            )
          )
        end
        attr_reader :query_type

        sig do
          params(
            query_type:
              XTwitterScraper::X::CommunityRetrieveSearchParams::QueryType::OrSymbol
          ).void
        end
        attr_writer :query_type

        sig do
          params(
            community_id: String,
            q: String,
            cursor: String,
            page_size: Integer,
            query_type:
              XTwitterScraper::X::CommunityRetrieveSearchParams::QueryType::OrSymbol,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Numeric ID of the community whose posts to search
          community_id:,
          # Search query
          q:,
          # Pagination cursor for community search
          cursor: nil,
          # Maximum items requested from this page (1-100, default 20). The response can
          # contain fewer items because the source returned fewer, filters removed items, or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true, even when a page is empty. The deprecated limit and count
          # aliases remain accepted.
          page_size: nil,
          # Sort order (Latest or Top)
          query_type: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              community_id: String,
              q: String,
              cursor: String,
              page_size: Integer,
              query_type:
                XTwitterScraper::X::CommunityRetrieveSearchParams::QueryType::OrSymbol,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Sort order (Latest or Top)
        module QueryType
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::X::CommunityRetrieveSearchParams::QueryType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LATEST =
            T.let(
              :Latest,
              XTwitterScraper::X::CommunityRetrieveSearchParams::QueryType::TaggedSymbol
            )
          TOP =
            T.let(
              :Top,
              XTwitterScraper::X::CommunityRetrieveSearchParams::QueryType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::CommunityRetrieveSearchParams::QueryType::TaggedSymbol
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
