# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserRetrieveVerifiedFollowersParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::UserRetrieveVerifiedFollowersParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Pagination cursor for verified followers
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

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
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Pagination cursor for verified followers
          cursor: nil,
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
