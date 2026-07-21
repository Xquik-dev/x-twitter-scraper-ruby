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

          # Pagination cursor for community results
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

          sig do
            params(
              community_id: String,
              q: String,
              cursor: String,
              page_size: Integer,
              query_type:
                XTwitterScraper::X::Communities::TweetListParams::QueryType::OrSymbol,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Numeric ID of the community to search
            community_id:,
            # Keyword query within the selected community
            q:,
            # Pagination cursor for community results
            cursor: nil,
            # Maximum items requested from this page (1-100, default 20). The response can
            # contain fewer items because the source returned fewer, filters removed items, or
            # remaining credits cover fewer results. Keep requesting next_cursor while
            # has_next_page is true, even when a page is empty. The deprecated limit and count
            # aliases remain accepted.
            page_size: nil,
            # Sort order for community results (Latest or Top)
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
                  XTwitterScraper::X::Communities::TweetListParams::QueryType::OrSymbol,
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
        end
      end
    end
  end
end
