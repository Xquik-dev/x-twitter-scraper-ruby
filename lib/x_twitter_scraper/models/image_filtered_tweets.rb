# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class ImageFilteredTweets < XTwitterScraper::Models::PaginatedTweets
      # @!attribute image_filter
      #   What the image filter asked & how many posts it kept.
      #
      #   @return [XTwitterScraper::Models::ImageFilterSummary]
      required :image_filter, -> { XTwitterScraper::ImageFilterSummary }, api_name: :imageFilter

      # @!attribute tweets
      #
      #   @return [Array<XTwitterScraper::Models::ImageFilteredTweets::Tweet>]
      required :tweets, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::ImageFilteredTweets::Tweet] }

      # @!method initialize(image_filter:, tweets:)
      #   Posts kept by the image filter. Each kept post carries its imageScore. Follow
      #   next_cursor to check the next posts.
      #
      #   @param image_filter [XTwitterScraper::Models::ImageFilterSummary] What the image filter asked & how many posts it kept.
      #
      #   @param tweets [Array<XTwitterScraper::Models::ImageFilteredTweets::Tweet>]

      class Tweet < XTwitterScraper::Models::SearchTweet
        # @!attribute image_score
        #   How likely a photo shows what you asked for.
        #
        #   @return [Float]
        required :image_score, Float, api_name: :imageScore

        # @!method initialize(image_score:)
        #   @param image_score [Float] How likely a photo shows what you asked for.
      end
    end
  end
end
