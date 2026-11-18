# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityNotesNoteCounts < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute awaiting_more_ratings
      #   Notes that need more ratings.
      #
      #   @return [Integer, nil]
      optional :awaiting_more_ratings, Integer, api_name: :awaitingMoreRatings

      # @!attribute currently_rated_helpful
      #   Notes X rates helpful now.
      #
      #   @return [Integer, nil]
      optional :currently_rated_helpful, Integer, api_name: :currentlyRatedHelpful

      # @!attribute currently_rated_not_helpful
      #   Notes X rates not helpful now.
      #
      #   @return [Integer, nil]
      optional :currently_rated_not_helpful, Integer, api_name: :currentlyRatedNotHelpful

      # @!attribute updated_at
      #   When X last counted the notes.
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!method initialize(awaiting_more_ratings: nil, currently_rated_helpful: nil, currently_rated_not_helpful: nil, updated_at: nil)
      #   How many notes a contributor wrote, by X's current rating.
      #
      #   @param awaiting_more_ratings [Integer] Notes that need more ratings.
      #
      #   @param currently_rated_helpful [Integer] Notes X rates helpful now.
      #
      #   @param currently_rated_not_helpful [Integer] Notes X rates not helpful now.
      #
      #   @param updated_at [Time] When X last counted the notes.
    end
  end
end
