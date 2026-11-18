# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityPage < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CommunityPage,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Communities in X's order
      sig { returns(T::Array[XTwitterScraper::Models::Community]) }
      attr_reader :communities

      sig do
        params(
          communities: T::Array[XTwitterScraper::Models::Community::OrHash]
        ).void
      end
      attr_writer :communities

      # Whether another page of communities follows
      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      # Cursor for the next page of communities. Empty at the end.
      sig { returns(String) }
      attr_accessor :next_cursor

      sig do
        params(
          communities: T::Array[XTwitterScraper::Models::Community::OrHash],
          has_next_page: T::Boolean,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Communities in X's order
        communities:,
        # Whether another page of communities follows
        has_next_page:,
        # Cursor for the next page of communities. Empty at the end.
        next_cursor:
      )
      end

      sig do
        override.returns(
          {
            communities: T::Array[XTwitterScraper::Models::Community],
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
