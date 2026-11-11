# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

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

        # Pagination cursor for bookmarks
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Optional bookmark folder ID
        sig { returns(T.nilable(String)) }
        attr_reader :folder_id

        sig { params(folder_id: String).void }
        attr_writer :folder_id

        # Items per page, 1 to 100, default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        sig do
          params(
            cursor: String,
            folder_id: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Pagination cursor for bookmarks
          cursor: nil,
          # Optional bookmark folder ID
          folder_id: nil,
          # Items per page, 1 to 100, default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages.
          page_size: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              cursor: String,
              folder_id: String,
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
