# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityNotesRatingCounts < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CommunityNotesRatingCounts,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Ratings on notes that need more ratings.
      sig { returns(T.nilable(Integer)) }
      attr_reader :awaiting_more_ratings

      sig { params(awaiting_more_ratings: Integer).void }
      attr_writer :awaiting_more_ratings

      # Ratings made after X rated the note.
      sig { returns(T.nilable(Integer)) }
      attr_reader :rated_after_decision

      sig { params(rated_after_decision: Integer).void }
      attr_writer :rated_after_decision

      # Ratings that matched the rating X gave the note.
      sig do
        returns(T.nilable(XTwitterScraper::Models::CommunityNotesRatingOutcome))
      end
      attr_reader :successful

      sig do
        params(
          successful:
            XTwitterScraper::Models::CommunityNotesRatingOutcome::OrHash
        ).void
      end
      attr_writer :successful

      # Ratings that went against the rating X gave the note.
      sig do
        returns(T.nilable(XTwitterScraper::Models::CommunityNotesRatingOutcome))
      end
      attr_reader :unsuccessful

      sig do
        params(
          unsuccessful:
            XTwitterScraper::Models::CommunityNotesRatingOutcome::OrHash
        ).void
      end
      attr_writer :unsuccessful

      # When X last counted the ratings.
      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      sig do
        params(
          awaiting_more_ratings: Integer,
          rated_after_decision: Integer,
          successful:
            XTwitterScraper::Models::CommunityNotesRatingOutcome::OrHash,
          unsuccessful:
            XTwitterScraper::Models::CommunityNotesRatingOutcome::OrHash,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # Ratings on notes that need more ratings.
        awaiting_more_ratings: nil,
        # Ratings made after X rated the note.
        rated_after_decision: nil,
        # Ratings that matched the rating X gave the note.
        successful: nil,
        # Ratings that went against the rating X gave the note.
        unsuccessful: nil,
        # When X last counted the ratings.
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            awaiting_more_ratings: Integer,
            rated_after_decision: Integer,
            successful: XTwitterScraper::Models::CommunityNotesRatingOutcome,
            unsuccessful: XTwitterScraper::Models::CommunityNotesRatingOutcome,
            updated_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end
