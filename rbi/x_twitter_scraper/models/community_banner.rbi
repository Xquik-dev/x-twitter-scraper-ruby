# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityBanner < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CommunityBanner,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Banner image URL at its original size
      sig { returns(String) }
      attr_accessor :url

      # Banner width in pixels
      sig { returns(T.nilable(Integer)) }
      attr_reader :width

      sig { params(width: Integer).void }
      attr_writer :width

      # Banner height in pixels
      sig { returns(T.nilable(Integer)) }
      attr_reader :height

      sig { params(height: Integer).void }
      attr_writer :height

      # Main colors of the banner, largest share first
      sig do
        returns(
          T.nilable(T::Array[XTwitterScraper::Models::CommunityBanner::Color])
        )
      end
      attr_reader :colors

      sig do
        params(
          colors:
            T::Array[XTwitterScraper::Models::CommunityBanner::Color::OrHash]
        ).void
      end
      attr_writer :colors

      # Area X keeps in view when it crops the banner, in pixels from the top left
      sig do
        returns(T.nilable(XTwitterScraper::Models::CommunityBanner::Focus))
      end
      attr_reader :focus

      sig do
        params(
          focus: XTwitterScraper::Models::CommunityBanner::Focus::OrHash
        ).void
      end
      attr_writer :focus

      sig do
        params(
          url: String,
          width: Integer,
          height: Integer,
          colors:
            T::Array[XTwitterScraper::Models::CommunityBanner::Color::OrHash],
          focus: XTwitterScraper::Models::CommunityBanner::Focus::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Banner image URL at its original size
        url:,
        # Banner width in pixels
        width: nil,
        # Banner height in pixels
        height: nil,
        # Main colors of the banner, largest share first
        colors: nil,
        # Area X keeps in view when it crops the banner, in pixels from the top left
        focus: nil
      )
      end

      sig do
        override.returns(
          {
            url: String,
            width: Integer,
            height: Integer,
            colors: T::Array[XTwitterScraper::Models::CommunityBanner::Color],
            focus: XTwitterScraper::Models::CommunityBanner::Focus
          }
        )
      end
      def to_hash
      end

      class Color < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::CommunityBanner::Color,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Share of the banner in this color
        sig { returns(Float) }
        attr_accessor :percentage

        # Red value of the color
        sig { returns(Integer) }
        attr_accessor :red

        # Green value of the color
        sig { returns(Integer) }
        attr_accessor :green

        # Blue value of the color
        sig { returns(Integer) }
        attr_accessor :blue

        sig do
          params(
            percentage: Float,
            red: Integer,
            green: Integer,
            blue: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Share of the banner in this color
          percentage:,
          # Red value of the color
          red:,
          # Green value of the color
          green:,
          # Blue value of the color
          blue:
        )
        end

        sig do
          override.returns(
            { percentage: Float, red: Integer, green: Integer, blue: Integer }
          )
        end
        def to_hash
        end
      end

      class Focus < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::CommunityBanner::Focus,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Distance from the left edge
        sig { returns(T.nilable(Integer)) }
        attr_reader :left

        sig { params(left: Integer).void }
        attr_writer :left

        # Distance from the top edge
        sig { returns(T.nilable(Integer)) }
        attr_reader :top

        sig { params(top: Integer).void }
        attr_writer :top

        # Width of the area
        sig { returns(T.nilable(Integer)) }
        attr_reader :width

        sig { params(width: Integer).void }
        attr_writer :width

        # Height of the area
        sig { returns(T.nilable(Integer)) }
        attr_reader :height

        sig { params(height: Integer).void }
        attr_writer :height

        sig do
          params(
            left: Integer,
            top: Integer,
            width: Integer,
            height: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Distance from the left edge
          left: nil,
          # Distance from the top edge
          top: nil,
          # Width of the area
          width: nil,
          # Height of the area
          height: nil
        )
        end

        sig do
          override.returns(
            { left: Integer, top: Integer, width: Integer, height: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
