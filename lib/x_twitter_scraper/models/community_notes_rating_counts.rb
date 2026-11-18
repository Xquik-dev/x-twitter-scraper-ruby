# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityNotesRatingCounts < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute awaiting_more_ratings
      #   Ratings on notes that need more ratings.
      #
      #   @return [Integer, nil]
      optional :awaiting_more_ratings, Integer, api_name: :awaitingMoreRatings

      # @!attribute rated_after_decision
      #   Ratings made after X rated the note.
      #
      #   @return [Integer, nil]
      optional :rated_after_decision, Integer, api_name: :ratedAfterDecision

      # @!attribute successful
      #   Ratings that matched the rating X gave the note.
      #
      #   @return [XTwitterScraper::Models::CommunityNotesRatingOutcome, nil]
      optional :successful, -> { XTwitterScraper::Models::CommunityNotesRatingOutcome }

      # @!attribute unsuccessful
      #   Ratings that went against the rating X gave the note.
      #
      #   @return [XTwitterScraper::Models::CommunityNotesRatingOutcome, nil]
      optional :unsuccessful, -> { XTwitterScraper::Models::CommunityNotesRatingOutcome }

      # @!attribute updated_at
      #   When X last counted the ratings.
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(awaiting_more_ratings: nil, rated_after_decision: nil, successful: nil, unsuccessful: nil, updated_at: nil)
      #   How a contributor's ratings of other notes went.
      #
      #   @param awaiting_more_ratings [Integer] Ratings on notes that need more ratings.
      #
      #   @param rated_after_decision [Integer] Ratings made after X rated the note.
      #
      #   @param successful [XTwitterScraper::Models::CommunityNotesRatingOutcome] Ratings that matched the rating X gave the note.
      #
      #   @param unsuccessful [XTwitterScraper::Models::CommunityNotesRatingOutcome] Ratings that went against the rating X gave the note.
      #
      #   @param updated_at [Time] When X last counted the ratings.
    end
  end
end
