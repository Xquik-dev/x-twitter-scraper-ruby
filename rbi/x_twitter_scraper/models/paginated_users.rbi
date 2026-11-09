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

      # Whole number from 0.
      sig { returns(T.nilable(Integer)) }
      attr_reader :filtered_count

      sig { params(filtered_count: Integer).void }
      attr_writer :filtered_count

      # Paginated user profiles. No-mode follower, following, and verified follower
      # requests merge independent views automatically. Response fields, page size,
      # aliases, filters, and per-returned-profile billing stay unchanged. Existing
      # unprefixed cursors retain legacy behavior. Follow next_cursor while
      # has_next_page is true.
      sig do
        params(
          has_next_page: T::Boolean,
          next_cursor: String,
          users: T::Array[XTwitterScraper::UserProfile::OrHash],
          filtered_count: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        has_next_page:,
        next_cursor:,
        users:,
        # Whole number from 0.
        filtered_count: nil
      )
      end

      sig do
        override.returns(
          {
            has_next_page: T::Boolean,
            next_cursor: String,
            users: T::Array[XTwitterScraper::UserProfile],
            filtered_count: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
