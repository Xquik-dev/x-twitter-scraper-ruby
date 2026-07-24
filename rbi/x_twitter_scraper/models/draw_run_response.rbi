# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class DrawRunResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::DrawRunResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Candidate entries inspected for this draw after the credit-derived cap. This may
      # be lower than the source tweet's full reply count.
      sig { returns(Integer) }
      attr_accessor :total_entries

      sig { returns(String) }
      attr_accessor :tweet_id

      # Entries from the inspected candidate set that passed all filters. This is not
      # necessarily every valid reply on the source tweet when credits cap inspection.
      sig { returns(Integer) }
      attr_accessor :valid_entries

      sig { returns(T::Array[XTwitterScraper::Winner]) }
      attr_accessor :winners

      sig do
        params(
          id: String,
          total_entries: Integer,
          tweet_id: String,
          valid_entries: Integer,
          winners: T::Array[XTwitterScraper::Winner::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Candidate entries inspected for this draw after the credit-derived cap. This may
        # be lower than the source tweet's full reply count.
        total_entries:,
        tweet_id:,
        # Entries from the inspected candidate set that passed all filters. This is not
        # necessarily every valid reply on the source tweet when credits cap inspection.
        valid_entries:,
        winners:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            total_entries: Integer,
            tweet_id: String,
            valid_entries: Integer,
            winners: T::Array[XTwitterScraper::Winner]
          }
        )
      end
      def to_hash
      end
    end
  end
end
