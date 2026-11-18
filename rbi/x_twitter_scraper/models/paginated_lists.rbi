# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PaginatedLists < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::PaginatedLists,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::Models::XList]) }
      attr_reader :lists

      sig do
        params(lists: T::Array[XTwitterScraper::Models::XList::OrHash]).void
      end
      attr_writer :lists

      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      # Cursor for the next page. Send it unchanged. Each next page arrives fast.
      sig { returns(String) }
      attr_accessor :next_cursor

      sig do
        params(
          lists: T::Array[XTwitterScraper::Models::XList::OrHash],
          has_next_page: T::Boolean,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(
        lists:,
        has_next_page:,
        # Cursor for the next page. Send it unchanged. Each next page arrives fast.
        next_cursor:
      )
      end

      sig do
        override.returns(
          {
            lists: T::Array[XTwitterScraper::Models::XList],
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
