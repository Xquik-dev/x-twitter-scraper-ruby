# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class XListBanner < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute url
      #   Banner image URL.
      #
      #   @return [String]
      required :url, String

      # @!attribute width
      #   Banner width in pixels.
      #
      #   @return [Integer, nil]
      optional :width, Integer

      # @!attribute height
      #   Banner height in pixels.
      #
      #   @return [Integer, nil]
      optional :height, Integer

      # @!attribute salient_rect
      #   Area X marks as the subject of the banner, in pixels.
      #
      #   @return [XTwitterScraper::Models::XListBanner::SalientRect, nil]
      optional :salient_rect, -> { XTwitterScraper::Models::XListBanner::SalientRect }, api_name: :salientRect

      # @!attribute media_id
      #   Media ID of an uploaded banner.
      #
      #   @return [String, nil]
      optional :media_id, String, api_name: :mediaId

      # @!attribute media_key
      #   Stable media key of an uploaded banner.
      #
      #   @return [String, nil]
      optional :media_key, String, api_name: :mediaKey

      # @!attribute palette
      #   Dominant colors of an uploaded banner and their shares.
      #
      #   @return [Array<XTwitterScraper::Models::XListBanner::Palette>, nil]
      optional :palette, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XListBanner::Palette] }

      # @!method initialize(url:, width: nil, height: nil, salient_rect: nil, media_id: nil, media_key: nil, palette: nil)
      #   Banner image of an X List.
      #
      #   @param url [String] Banner image URL.
      #
      #   @param width [Integer] Banner width in pixels.
      #
      #   @param height [Integer] Banner height in pixels.
      #
      #   @param salient_rect [XTwitterScraper::Models::XListBanner::SalientRect] Area X marks as the subject of the banner, in pixels.
      #
      #   @param media_id [String] Media ID of an uploaded banner.
      #
      #   @param media_key [String] Stable media key of an uploaded banner.
      #
      #   @param palette [Array<XTwitterScraper::Models::XListBanner::Palette>] Dominant colors of an uploaded banner and their shares.

      class SalientRect < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute left
        #   Pixels from the banner's left.
        #
        #   @return [Integer, nil]
        optional :left, Integer

        # @!attribute top
        #   Pixels from the banner's top.
        #
        #   @return [Integer, nil]
        optional :top, Integer

        # @!attribute width
        #   Width of the marked area.
        #
        #   @return [Integer, nil]
        optional :width, Integer

        # @!attribute height
        #   Height of the marked area.
        #
        #   @return [Integer, nil]
        optional :height, Integer

        # @!method initialize(left: nil, top: nil, width: nil, height: nil)
        #   Area X marks as the subject of the banner, in pixels.
        #
        #   @param left [Integer] Pixels from the banner's left.
        #
        #   @param top [Integer] Pixels from the banner's top.
        #
        #   @param width [Integer] Width of the marked area.
        #
        #   @param height [Integer] Height of the marked area.
      end

      class Palette < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute percentage
        #   Share of the banner, from 0 to 100.
        #
        #   @return [Float, nil]
        optional :percentage, Float

        # @!attribute rgb
        #   The color's red, green and blue values.
        #
        #   @return [XTwitterScraper::Models::XListBanner::Palette::Rgb, nil]
        optional :rgb, -> { XTwitterScraper::Models::XListBanner::Palette::Rgb }

        # @!method initialize(percentage: nil, rgb: nil)
        #   @param percentage [Float] Share of the banner, from 0 to 100.
        #
        #   @param rgb [XTwitterScraper::Models::XListBanner::Palette::Rgb] The color's red, green and blue values.

        class Rgb < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute red
          #
          #   @return [Integer, nil]
          optional :red, Integer

          # @!attribute green
          #
          #   @return [Integer, nil]
          optional :green, Integer

          # @!attribute blue
          #
          #   @return [Integer, nil]
          optional :blue, Integer

          # @!method initialize(red: nil, green: nil, blue: nil)
          #   The color's red, green and blue values.
          #
          #   @param red [Integer]
          #
          #   @param green [Integer]
          #
          #   @param blue [Integer]
        end
      end
    end
  end
end
