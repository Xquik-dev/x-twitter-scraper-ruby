# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityBanner < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute url
      #   Banner image URL at its original size
      #
      #   @return [String]
      required :url, String

      # @!attribute width
      #   Banner width in pixels
      #
      #   @return [Integer, nil]
      optional :width, Integer

      # @!attribute height
      #   Banner height in pixels
      #
      #   @return [Integer, nil]
      optional :height, Integer

      # @!attribute colors
      #   Main colors of the banner, largest share first
      #
      #   @return [Array<XTwitterScraper::Models::CommunityBanner::Color>, nil]
      optional :colors, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::CommunityBanner::Color] }

      # @!attribute focus
      #   Area X keeps in view when it crops the banner, in pixels from the top left
      #
      #   @return [XTwitterScraper::Models::CommunityBanner::Focus, nil]
      optional :focus, -> { XTwitterScraper::Models::CommunityBanner::Focus }

      # @!method initialize(url:, width: nil, height: nil, colors: nil, focus: nil)
      #   The banner X shows for a community, with its size & colors.
      #
      #   @param url [String] Banner image URL at its original size
      #
      #   @param width [Integer] Banner width in pixels
      #
      #   @param height [Integer] Banner height in pixels
      #
      #   @param colors [Array<XTwitterScraper::Models::CommunityBanner::Color>] Main colors of the banner, largest share first
      #
      #   @param focus [XTwitterScraper::Models::CommunityBanner::Focus] Area X keeps in view when it crops the banner, in pixels from the top left

      class Color < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute percentage
        #   Share of the banner in this color
        #
        #   @return [Float]
        required :percentage, Float

        # @!attribute red
        #   Red value of the color
        #
        #   @return [Integer]
        required :red, Integer

        # @!attribute green
        #   Green value of the color
        #
        #   @return [Integer]
        required :green, Integer

        # @!attribute blue
        #   Blue value of the color
        #
        #   @return [Integer]
        required :blue, Integer

        # @!method initialize(percentage:, red:, green:, blue:)
        #   @param percentage [Float] Share of the banner in this color
        #
        #   @param red [Integer] Red value of the color
        #
        #   @param green [Integer] Green value of the color
        #
        #   @param blue [Integer] Blue value of the color
      end

      class Focus < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute left
        #   Distance from the left edge
        #
        #   @return [Integer, nil]
        optional :left, Integer

        # @!attribute top
        #   Distance from the top edge
        #
        #   @return [Integer, nil]
        optional :top, Integer

        # @!attribute width
        #   Width of the area
        #
        #   @return [Integer, nil]
        optional :width, Integer

        # @!attribute height
        #   Height of the area
        #
        #   @return [Integer, nil]
        optional :height, Integer

        # @!method initialize(left: nil, top: nil, width: nil, height: nil)
        #   Area X keeps in view when it crops the banner, in pixels from the top left
        #
        #   @param left [Integer] Distance from the left edge
        #
        #   @param top [Integer] Distance from the top edge
        #
        #   @param width [Integer] Width of the area
        #
        #   @param height [Integer] Height of the area
      end
    end
  end
end
