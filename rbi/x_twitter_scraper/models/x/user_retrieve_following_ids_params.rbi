# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserRetrieveFollowingIdsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::UserRetrieveFollowingIdsParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Pagination cursor for collection results. Also read as next_cursor, next_token,
        # pagination_token or continuation_token.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # User IDs to request from this page (1-5000, default 5000). A low credit balance
        # can return fewer. Follow next_cursor for more pages. Its aliases are limit,
        # count, max_results, maxItems, max_items & per_page.
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
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # User IDs to request from this page (1-5000, default 5000). A low credit balance
          # can return fewer. Follow next_cursor for more pages. Its aliases are limit,
          # count, max_results, maxItems, max_items & per_page.
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
