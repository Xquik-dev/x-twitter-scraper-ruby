# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityNotesRatingOutcome < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute helpful_count
      #   Ratings that called a note helpful.
      #
      #   @return [Integer, nil]
      optional :helpful_count, Integer, api_name: :helpfulCount

      # @!attribute not_helpful_count
      #   Ratings that called a note not helpful.
      #
      #   @return [Integer, nil]
      optional :not_helpful_count, Integer, api_name: :notHelpfulCount

      # @!attribute total
      #   All ratings in the group, when X sends the sum.
      #
      #   @return [Integer, nil]
      optional :total, Integer

      # @!method initialize(helpful_count: nil, not_helpful_count: nil, total: nil)
      #   A group of a contributor's ratings, by what each one said.
      #
      #   @param helpful_count [Integer] Ratings that called a note helpful.
      #
      #   @param not_helpful_count [Integer] Ratings that called a note not helpful.
      #
      #   @param total [Integer] All ratings in the group, when X sends the sum.
    end
  end
end
