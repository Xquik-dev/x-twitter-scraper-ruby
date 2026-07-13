# typed: strong

module XTwitterScraper
  module Models
    module X
      module Communities
        class TweetListByCommunityParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::X::Communities::TweetListByCommunityParams,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # Pagination cursor for community tweets
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

          sig do
            params(
              id: String,
              cursor: String,
              page_size: Integer,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            # Pagination cursor for community tweets
            cursor: nil,
            # Maximum items requested from this page (1-100, default 20). The response can
            # contain fewer items because the source returned fewer, filters removed items, or
            # remaining credits cover fewer results. Keep requesting next_cursor while
            # has_next_page is true, even when a page is empty. The deprecated limit and count
            # aliases remain accepted.
            page_size: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                id: String,
                cursor: String,
                page_size: Integer,
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
end
