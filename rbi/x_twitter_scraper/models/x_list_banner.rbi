# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XListBanner < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XListBanner,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Banner image URL.
      sig { returns(String) }
      attr_accessor :url

      # Banner width in pixels.
      sig { returns(T.nilable(Integer)) }
      attr_reader :width

      sig { params(width: Integer).void }
      attr_writer :width

      # Banner height in pixels.
      sig { returns(T.nilable(Integer)) }
      attr_reader :height

      sig { params(height: Integer).void }
      attr_writer :height

      # Area X marks as the subject of the banner, in pixels.
      sig do
        returns(T.nilable(XTwitterScraper::Models::XListBanner::SalientRect))
      end
      attr_reader :salient_rect

      sig do
        params(
          salient_rect:
            XTwitterScraper::Models::XListBanner::SalientRect::OrHash
        ).void
      end
      attr_writer :salient_rect

      # Media ID of an uploaded banner.
      sig { returns(T.nilable(String)) }
      attr_reader :media_id

      sig { params(media_id: String).void }
      attr_writer :media_id

      # Stable media key of an uploaded banner.
      sig { returns(T.nilable(String)) }
      attr_reader :media_key

      sig { params(media_key: String).void }
      attr_writer :media_key

      # Dominant colors of an uploaded banner and their shares.
      sig do
        returns(
          T.nilable(T::Array[XTwitterScraper::Models::XListBanner::Palette])
        )
      end
      attr_reader :palette

      sig do
        params(
          palette:
            T::Array[XTwitterScraper::Models::XListBanner::Palette::OrHash]
        ).void
      end
      attr_writer :palette

      sig do
        params(
          url: String,
          width: Integer,
          height: Integer,
          salient_rect:
            XTwitterScraper::Models::XListBanner::SalientRect::OrHash,
          media_id: String,
          media_key: String,
          palette:
            T::Array[XTwitterScraper::Models::XListBanner::Palette::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Banner image URL.
        url:,
        # Banner width in pixels.
        width: nil,
        # Banner height in pixels.
        height: nil,
        # Area X marks as the subject of the banner, in pixels.
        salient_rect: nil,
        # Media ID of an uploaded banner.
        media_id: nil,
        # Stable media key of an uploaded banner.
        media_key: nil,
        # Dominant colors of an uploaded banner and their shares.
        palette: nil
      )
      end

      sig do
        override.returns(
          {
            url: String,
            width: Integer,
            height: Integer,
            salient_rect: XTwitterScraper::Models::XListBanner::SalientRect,
            media_id: String,
            media_key: String,
            palette: T::Array[XTwitterScraper::Models::XListBanner::Palette]
          }
        )
      end
      def to_hash
      end

      class SalientRect < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::XListBanner::SalientRect,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Pixels from the banner's left.
        sig { returns(T.nilable(Integer)) }
        attr_reader :left

        sig { params(left: Integer).void }
        attr_writer :left

        # Pixels from the banner's top.
        sig { returns(T.nilable(Integer)) }
        attr_reader :top

        sig { params(top: Integer).void }
        attr_writer :top

        # Width of the marked area.
        sig { returns(T.nilable(Integer)) }
        attr_reader :width

        sig { params(width: Integer).void }
        attr_writer :width

        # Height of the marked area.
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
          # Pixels from the banner's left.
          left: nil,
          # Pixels from the banner's top.
          top: nil,
          # Width of the marked area.
          width: nil,
          # Height of the marked area.
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

      class Palette < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::XListBanner::Palette,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Share of the banner, from 0 to 100.
        sig { returns(T.nilable(Float)) }
        attr_reader :percentage

        sig { params(percentage: Float).void }
        attr_writer :percentage

        # The color's red, green and blue values.
        sig do
          returns(T.nilable(XTwitterScraper::Models::XListBanner::Palette::Rgb))
        end
        attr_reader :rgb

        sig do
          params(
            rgb: XTwitterScraper::Models::XListBanner::Palette::Rgb::OrHash
          ).void
        end
        attr_writer :rgb

        sig do
          params(
            percentage: Float,
            rgb: XTwitterScraper::Models::XListBanner::Palette::Rgb::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Share of the banner, from 0 to 100.
          percentage: nil,
          # The color's red, green and blue values.
          rgb: nil
        )
        end

        sig do
          override.returns(
            {
              percentage: Float,
              rgb: XTwitterScraper::Models::XListBanner::Palette::Rgb
            }
          )
        end
        def to_hash
        end

        class Rgb < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::XListBanner::Palette::Rgb,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :red

          sig { params(red: Integer).void }
          attr_writer :red

          sig { returns(T.nilable(Integer)) }
          attr_reader :green

          sig { params(green: Integer).void }
          attr_writer :green

          sig { returns(T.nilable(Integer)) }
          attr_reader :blue

          sig { params(blue: Integer).void }
          attr_writer :blue

          sig do
            params(red: Integer, green: Integer, blue: Integer).returns(
              T.attached_class
            )
          end
          def self.new(red: nil, green: nil, blue: nil)
          end

          sig do
            override.returns({ red: Integer, green: Integer, blue: Integer })
          end
          def to_hash
          end
        end
      end
    end
  end
end
