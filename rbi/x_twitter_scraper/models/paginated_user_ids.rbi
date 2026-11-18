# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PaginatedUserIds < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::PaginatedUserIds,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X user IDs, newest relationship first.
      sig { returns(T::Array[String]) }
      attr_accessor :ids

      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      # Cursor for the next page. Send it unchanged. Each next page arrives fast.
      sig { returns(String) }
      attr_accessor :next_cursor

      sig do
        params(
          ids: T::Array[String],
          has_next_page: T::Boolean,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(
        # X user IDs, newest relationship first.
        ids:,
        has_next_page:,
        # Cursor for the next page. Send it unchanged. Each next page arrives fast.
        next_cursor:
      )
      end

      sig do
        override.returns(
          {
            ids: T::Array[String],
            has_next_page: T::Boolean,
            next_cursor: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
