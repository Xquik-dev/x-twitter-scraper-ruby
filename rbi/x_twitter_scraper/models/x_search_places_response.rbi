# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XSearchPlacesResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XSearchPlacesResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::Models::PlaceSearchResult]) }
      attr_reader :places

      sig do
        params(
          places: T::Array[XTwitterScraper::Models::PlaceSearchResult::OrHash]
        ).void
      end
      attr_writer :places

      # Places returned & charged.
      sig { returns(Integer) }
      attr_accessor :count

      # Places X found, before limit.
      sig { returns(Integer) }
      attr_accessor :total

      # What to send instead. Present only when X finds no place.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      sig do
        params(
          places: T::Array[XTwitterScraper::Models::PlaceSearchResult::OrHash],
          count: Integer,
          total: Integer,
          message: String
        ).returns(T.attached_class)
      end
      def self.new(
        places:,
        # Places returned & charged.
        count:,
        # Places X found, before limit.
        total:,
        # What to send instead. Present only when X finds no place.
        message: nil
      )
      end

      sig do
        override.returns(
          {
            places: T::Array[XTwitterScraper::Models::PlaceSearchResult],
            count: Integer,
            total: Integer,
            message: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
