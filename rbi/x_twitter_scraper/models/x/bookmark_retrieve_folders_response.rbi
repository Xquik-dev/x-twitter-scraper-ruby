# typed: strong

module XTwitterScraper
  module Models
    module X
      class BookmarkRetrieveFoldersResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder
            ]
          )
        end
        attr_accessor :folders

        sig { returns(T::Boolean) }
        attr_accessor :has_next_page

        sig { returns(String) }
        attr_accessor :next_cursor

        sig do
          params(
            folders:
              T::Array[
                XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder::OrHash
              ],
            has_next_page: T::Boolean,
            next_cursor: String
          ).returns(T.attached_class)
        end
        def self.new(folders:, has_next_page:, next_cursor:)
        end

        sig do
          override.returns(
            {
              folders:
                T::Array[
                  XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder
                ],
              has_next_page: T::Boolean,
              next_cursor: String
            }
          )
        end
        def to_hash
        end

        class Folder < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :name

          sig { params(id: String, name: String).returns(T.attached_class) }
          def self.new(id:, name:)
          end

          sig { override.returns({ id: String, name: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
