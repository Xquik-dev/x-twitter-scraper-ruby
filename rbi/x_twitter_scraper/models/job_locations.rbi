# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class JobLocations < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::JobLocations,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Matching places, best match first.
      sig { returns(T::Array[XTwitterScraper::Models::JobLocation]) }
      attr_reader :locations

      sig do
        params(
          locations: T::Array[XTwitterScraper::Models::JobLocation::OrHash]
        ).void
      end
      attr_writer :locations

      # Places returned, each charged 1 credit.
      sig { returns(Integer) }
      attr_accessor :count

      sig do
        params(
          locations: T::Array[XTwitterScraper::Models::JobLocation::OrHash],
          count: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Matching places, best match first.
        locations:,
        # Places returned, each charged 1 credit.
        count:
      )
      end

      sig do
        override.returns(
          {
            locations: T::Array[XTwitterScraper::Models::JobLocation],
            count: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
