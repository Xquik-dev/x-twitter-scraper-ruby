# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PaginatedUsers < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::PaginatedUsers,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      sig { returns(String) }
      attr_accessor :next_cursor

      sig { returns(T::Array[XTwitterScraper::UserProfile]) }
      attr_accessor :users

      # Paginated user profiles. The item count can be lower than pageSize when the
      # source returns fewer profiles or remaining credits cover fewer results. Follow
      # next_cursor while has_next_page is true. A relationship can naturally contain
      # fewer profiles than requested. Zero affordable results returns 402
      # insufficient_credits.
      sig do
        params(
          has_next_page: T::Boolean,
          next_cursor: String,
          users: T::Array[XTwitterScraper::UserProfile::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(has_next_page:, next_cursor:, users:)
      end

      sig do
        override.returns(
          {
            has_next_page: T::Boolean,
            next_cursor: String,
            users: T::Array[XTwitterScraper::UserProfile]
          }
        )
      end
      def to_hash
      end
    end
  end
end
