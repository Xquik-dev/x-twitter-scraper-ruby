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

      # Present on a last page that X cut short. `stalled` means X returned no new
      # results 2 times in a row, 30 s apart. The list may hold more. Read it again
      # later without cursor.
      sig do
        returns(T.nilable(XTwitterScraper::Models::CoverageEndReason::TaggedSymbol))
      end
      attr_reader :end_reason

      sig do
        params(
          end_reason: XTwitterScraper::Models::CoverageEndReason::OrSymbol
        ).void
      end
      attr_writer :end_reason

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
          filtered_count: Integer,
          end_reason: XTwitterScraper::Models::CoverageEndReason::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        has_next_page:,
        next_cursor:,
        users:,
        # Whole number from 0.
        filtered_count: nil,
        # Present on a last page that X cut short. `stalled` means X returned no new
        # results 2 times in a row, 30 s apart. The list may hold more. Read it again
        # later without cursor.
        end_reason: nil
      )
      end

      sig do
        override.returns(
          {
            has_next_page: T::Boolean,
            next_cursor: String,
            users: T::Array[XTwitterScraper::UserProfile],
            filtered_count: Integer,
            end_reason: XTwitterScraper::Models::CoverageEndReason::TaggedSymbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
