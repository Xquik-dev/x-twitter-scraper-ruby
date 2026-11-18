# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XGetTrendLocationsResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XGetTrendLocationsResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::Models::TrendLocation]) }
      attr_reader :locations

      sig do
        params(
          locations: T::Array[XTwitterScraper::Models::TrendLocation::OrHash]
        ).void
      end
      attr_writer :locations

      # Locations returned & charged.
      sig { returns(Integer) }
      attr_accessor :count

      # Locations that match the filters, before limit.
      sig { returns(Integer) }
      attr_accessor :total

      # What to send instead. Present only when no location matches.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      sig do
        params(
          locations: T::Array[XTwitterScraper::Models::TrendLocation::OrHash],
          count: Integer,
          total: Integer,
          message: String
        ).returns(T.attached_class)
      end
      def self.new(
        locations:,
        # Locations returned & charged.
        count:,
        # Locations that match the filters, before limit.
        total:,
        # What to send instead. Present only when no location matches.
        message: nil
      )
      end

      sig do
        override.returns(
          {
            locations: T::Array[XTwitterScraper::Models::TrendLocation],
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
