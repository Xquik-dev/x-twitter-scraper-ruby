# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class ImageFilterSummary < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute image_shows
      #   What you asked the photos to show.
      #
      #   @return [String]
      required :image_shows, String, api_name: :imageShows

      # @!attribute question
      #   The question asked of each post's photos.
      #
      #   @return [String]
      required :question, String

      # @!attribute cutoff
      #   The lowest imageScore a kept post has.
      #
      #   @return [Float]
      required :cutoff, Float

      # @!attribute checked
      #   Posts whose photos were checked. Only kept posts are billed.
      #
      #   @return [Integer]
      required :checked, Integer

      # @!attribute kept
      #   Posts whose photos show it, all returned & billed at 2 credits each.
      #
      #   @return [Integer]
      required :kept, Integer

      # @!attribute unchecked
      #   Posts without a safe photo & posts the check couldn't answer. They aren't billed
      #   or returned.
      #
      #   @return [Array<XTwitterScraper::Models::ImageFilterSummary::Unchecked>]
      required :unchecked,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::ImageFilterSummary::Unchecked] }

      # @!method initialize(image_shows:, question:, cutoff:, checked:, kept:, unchecked:)
      #   What the image filter asked & how many posts it kept.
      #
      #   @param image_shows [String] What you asked the photos to show.
      #
      #   @param question [String] The question asked of each post's photos.
      #
      #   @param cutoff [Float] The lowest imageScore a kept post has.
      #
      #   @param checked [Integer] Posts whose photos were checked. Only kept posts are billed.
      #
      #   @param kept [Integer] Posts whose photos show it, all returned & billed at 2 credits each.
      #
      #   @param unchecked [Array<XTwitterScraper::Models::ImageFilterSummary::Unchecked>] Posts without a safe photo & posts the check couldn't answer. They aren't billed

      # @see XTwitterScraper::Models::ImageFilterSummary#unchecked
      class Unchecked < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute reason
        #
        #   @return [String]
        required :reason, String

        # @!method initialize(id:, reason:)
        #   @param id [String]
        #   @param reason [String]
      end
    end
  end
end
