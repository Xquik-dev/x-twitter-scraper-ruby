# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityNotesNoteCounts < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CommunityNotesNoteCounts,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Notes that need more ratings.
      sig { returns(T.nilable(Integer)) }
      attr_reader :awaiting_more_ratings

      sig { params(awaiting_more_ratings: Integer).void }
      attr_writer :awaiting_more_ratings

      # Notes X rates helpful now.
      sig { returns(T.nilable(Integer)) }
      attr_reader :currently_rated_helpful

      sig { params(currently_rated_helpful: Integer).void }
      attr_writer :currently_rated_helpful

      # Notes X rates not helpful now.
      sig { returns(T.nilable(Integer)) }
      attr_reader :currently_rated_not_helpful

      sig { params(currently_rated_not_helpful: Integer).void }
      attr_writer :currently_rated_not_helpful

      # When X last counted the notes.
      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      sig do
        params(
          awaiting_more_ratings: Integer,
          currently_rated_helpful: Integer,
          currently_rated_not_helpful: Integer,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # Notes that need more ratings.
        awaiting_more_ratings: nil,
        # Notes X rates helpful now.
        currently_rated_helpful: nil,
        # Notes X rates not helpful now.
        currently_rated_not_helpful: nil,
        # When X last counted the notes.
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            awaiting_more_ratings: Integer,
            currently_rated_helpful: Integer,
            currently_rated_not_helpful: Integer,
            updated_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end
