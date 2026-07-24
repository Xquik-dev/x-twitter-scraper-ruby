# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class RadarRetrieveTrendingTopicsResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T::Array[XTwitterScraper::RadarItem]) }
      attr_accessor :items

      # Opaque cursor for the next page (present only when hasMore is true).
      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig do
        params(
          has_more: T::Boolean,
          items: T::Array[XTwitterScraper::RadarItem::OrHash],
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(
        has_more:,
        items:,
        # Opaque cursor for the next page (present only when hasMore is true).
        next_cursor: nil
      )
      end

      sig do
        override.returns(
          {
            has_more: T::Boolean,
            items: T::Array[XTwitterScraper::RadarItem],
            next_cursor: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
