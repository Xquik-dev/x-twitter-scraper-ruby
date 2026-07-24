# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserRetrieveFollowingParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::UserRetrieveFollowingParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Deprecated following cursor alias. Prefer cursor.
        sig { returns(T.nilable(String)) }
        attr_reader :after

        sig { params(after: String).void }
        attr_writer :after

        # Pagination cursor for following list
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Legacy page size alias. Prefer pageSize.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Maximum user profiles requested from this page (20-200, default 200). The
        # response can contain fewer profiles because the source returned fewer or
        # remaining credits cover fewer results. Keep requesting next_cursor while
        # has_next_page is true. The deprecated limit and count aliases remain accepted.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        sig do
          params(
            id: String,
            after: String,
            cursor: String,
            limit: Integer,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Deprecated following cursor alias. Prefer cursor.
          after: nil,
          # Pagination cursor for following list
          cursor: nil,
          # Legacy page size alias. Prefer pageSize.
          limit: nil,
          # Maximum user profiles requested from this page (20-200, default 200). The
          # response can contain fewer profiles because the source returned fewer or
          # remaining credits cover fewer results. Keep requesting next_cursor while
          # has_next_page is true. The deprecated limit and count aliases remain accepted.
          page_size: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              after: String,
              cursor: String,
              limit: Integer,
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
