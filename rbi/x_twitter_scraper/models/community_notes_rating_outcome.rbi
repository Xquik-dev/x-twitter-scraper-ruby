# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityNotesRatingOutcome < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CommunityNotesRatingOutcome,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Ratings that called a note helpful.
      sig { returns(T.nilable(Integer)) }
      attr_reader :helpful_count

      sig { params(helpful_count: Integer).void }
      attr_writer :helpful_count

      # Ratings that called a note not helpful.
      sig { returns(T.nilable(Integer)) }
      attr_reader :not_helpful_count

      sig { params(not_helpful_count: Integer).void }
      attr_writer :not_helpful_count

      # All ratings in the group, when X sends the sum.
      sig { returns(T.nilable(Integer)) }
      attr_reader :total

      sig { params(total: Integer).void }
      attr_writer :total

      sig do
        params(
          helpful_count: Integer,
          not_helpful_count: Integer,
          total: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Ratings that called a note helpful.
        helpful_count: nil,
        # Ratings that called a note not helpful.
        not_helpful_count: nil,
        # All ratings in the group, when X sends the sum.
        total: nil
      )
      end

      sig do
        override.returns(
          { helpful_count: Integer, not_helpful_count: Integer, total: Integer }
        )
      end
      def to_hash
      end
    end
  end
end
