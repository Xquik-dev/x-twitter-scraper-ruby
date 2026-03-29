# typed: strong

module XTwitterScraper
  module Models
    module X
      class BookmarkListParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::BookmarkListParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Pagination cursor from previous response
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Optional bookmark folder ID
        sig { returns(T.nilable(String)) }
        attr_reader :folder_id

        sig { params(folder_id: String).void }
        attr_writer :folder_id

        sig do
          params(
            cursor: String,
            folder_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Pagination cursor from previous response
          cursor: nil,
          # Optional bookmark folder ID
          folder_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              cursor: String,
              folder_id: String,
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
