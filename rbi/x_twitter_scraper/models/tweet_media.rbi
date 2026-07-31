# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetMedia < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::TweetMedia, XTwitterScraper::Internal::AnyHash)
        end

      # Media preview URL
      sig { returns(String) }
      attr_accessor :media_url

      sig { returns(XTwitterScraper::TweetMedia::Type::TaggedSymbol) }
      attr_accessor :type

      # X media link from the tweet
      sig { returns(String) }
      attr_accessor :url

      # X media entity ID.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Whether X permits direct media download.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :allow_download

      sig { params(allow_download: T::Boolean).void }
      attr_writer :allow_download

      # Accessibility text supplied for the media.
      sig { returns(T.nilable(String)) }
      attr_reader :alt_text

      sig { params(alt_text: String).void }
      attr_writer :alt_text

      # Video aspect ratio as width and height.
      sig { returns(T.nilable(T::Array[Integer])) }
      attr_reader :aspect_ratio

      sig { params(aspect_ratio: T::Array[Integer]).void }
      attr_writer :aspect_ratio

      # Media availability state reported by X.
      sig { returns(T.nilable(String)) }
      attr_reader :availability_status

      sig { params(availability_status: String).void }
      attr_writer :availability_status

      # Display-friendly media URL reported by X.
      sig { returns(T.nilable(String)) }
      attr_reader :display_url

      sig { params(display_url: String).void }
      attr_writer :display_url

      # Video duration in milliseconds.
      sig { returns(T.nilable(Integer)) }
      attr_reader :duration_millis

      sig { params(duration_millis: Integer).void }
      attr_writer :duration_millis

      # Expanded X media URL.
      sig { returns(T.nilable(String)) }
      attr_reader :expanded_url

      sig { params(expanded_url: String).void }
      attr_writer :expanded_url

      # Face-aware crop rectangles grouped by media size.
      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T::Array[XTwitterScraper::TweetMedia::FaceRect]]
          )
        )
      end
      attr_reader :face_rects

      sig do
        params(
          face_rects:
            T::Hash[
              Symbol,
              T::Array[XTwitterScraper::TweetMedia::FaceRect::OrHash]
            ]
        ).void
      end
      attr_writer :face_rects

      # Suggested image crops reported by X.
      sig do
        returns(T.nilable(T::Array[XTwitterScraper::TweetMedia::FocusRect]))
      end
      attr_reader :focus_rects

      sig do
        params(
          focus_rects: T::Array[XTwitterScraper::TweetMedia::FocusRect::OrHash]
        ).void
      end
      attr_writer :focus_rects

      # Original media height.
      sig { returns(T.nilable(Integer)) }
      attr_reader :height

      sig { params(height: Integer).void }
      attr_writer :height

      # Media entity offsets in the tweet text.
      sig { returns(T.nilable(T::Array[Integer])) }
      attr_reader :indices

      sig { params(indices: T::Array[Integer]).void }
      attr_writer :indices

      # Stable X media key.
      sig { returns(T.nilable(String)) }
      attr_reader :media_key

      sig { params(media_key: String).void }
      attr_writer :media_key

      # Whether X reports the media as monetizable.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :monetizable

      sig { params(monetizable: T::Boolean).void }
      attr_writer :monetizable

      # Named media renditions and resize modes.
      sig do
        returns(T.nilable(T::Hash[Symbol, XTwitterScraper::TweetMedia::Size]))
      end
      attr_reader :sizes

      sig do
        params(
          sizes: T::Hash[Symbol, XTwitterScraper::TweetMedia::Size::OrHash]
        ).void
      end
      attr_writer :sizes

      # Available video encodings, ordered as returned
      sig do
        returns(T.nilable(T::Array[XTwitterScraper::TweetMedia::VideoVariant]))
      end
      attr_reader :video_variants

      sig do
        params(
          video_variants:
            T::Array[XTwitterScraper::TweetMedia::VideoVariant::OrHash]
        ).void
      end
      attr_writer :video_variants

      # Original media width.
      sig { returns(T.nilable(Integer)) }
      attr_reader :width

      sig { params(width: Integer).void }
      attr_writer :width

      # Normalized media attached to a tweet.
      sig do
        params(
          media_url: String,
          type: XTwitterScraper::TweetMedia::Type::OrSymbol,
          url: String,
          id: String,
          allow_download: T::Boolean,
          alt_text: String,
          aspect_ratio: T::Array[Integer],
          availability_status: String,
          display_url: String,
          duration_millis: Integer,
          expanded_url: String,
          face_rects:
            T::Hash[
              Symbol,
              T::Array[XTwitterScraper::TweetMedia::FaceRect::OrHash]
            ],
          focus_rects: T::Array[XTwitterScraper::TweetMedia::FocusRect::OrHash],
          height: Integer,
          indices: T::Array[Integer],
          media_key: String,
          monetizable: T::Boolean,
          sizes: T::Hash[Symbol, XTwitterScraper::TweetMedia::Size::OrHash],
          video_variants:
            T::Array[XTwitterScraper::TweetMedia::VideoVariant::OrHash],
          width: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Media preview URL
        media_url:,
        type:,
        # X media link from the tweet
        url:,
        # X media entity ID.
        id: nil,
        # Whether X permits direct media download.
        allow_download: nil,
        # Accessibility text supplied for the media.
        alt_text: nil,
        # Video aspect ratio as width and height.
        aspect_ratio: nil,
        # Media availability state reported by X.
        availability_status: nil,
        # Display-friendly media URL reported by X.
        display_url: nil,
        # Video duration in milliseconds.
        duration_millis: nil,
        # Expanded X media URL.
        expanded_url: nil,
        # Face-aware crop rectangles grouped by media size.
        face_rects: nil,
        # Suggested image crops reported by X.
        focus_rects: nil,
        # Original media height.
        height: nil,
        # Media entity offsets in the tweet text.
        indices: nil,
        # Stable X media key.
        media_key: nil,
        # Whether X reports the media as monetizable.
        monetizable: nil,
        # Named media renditions and resize modes.
        sizes: nil,
        # Available video encodings, ordered as returned
        video_variants: nil,
        # Original media width.
        width: nil
      )
      end

      sig do
        override.returns(
          {
            media_url: String,
            type: XTwitterScraper::TweetMedia::Type::TaggedSymbol,
            url: String,
            id: String,
            allow_download: T::Boolean,
            alt_text: String,
            aspect_ratio: T::Array[Integer],
            availability_status: String,
            display_url: String,
            duration_millis: Integer,
            expanded_url: String,
            face_rects:
              T::Hash[Symbol, T::Array[XTwitterScraper::TweetMedia::FaceRect]],
            focus_rects: T::Array[XTwitterScraper::TweetMedia::FocusRect],
            height: Integer,
            indices: T::Array[Integer],
            media_key: String,
            monetizable: T::Boolean,
            sizes: T::Hash[Symbol, XTwitterScraper::TweetMedia::Size],
            video_variants: T::Array[XTwitterScraper::TweetMedia::VideoVariant],
            width: Integer
          }
        )
      end
      def to_hash
      end

      module Type
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::TweetMedia::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PHOTO = T.let(:photo, XTwitterScraper::TweetMedia::Type::TaggedSymbol)
        VIDEO = T.let(:video, XTwitterScraper::TweetMedia::Type::TaggedSymbol)
        ANIMATED_GIF =
          T.let(:animated_gif, XTwitterScraper::TweetMedia::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[XTwitterScraper::TweetMedia::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class FaceRect < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TweetMedia::FaceRect,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :h

        sig { returns(Integer) }
        attr_accessor :w

        sig { returns(Integer) }
        attr_accessor :x

        sig { returns(Integer) }
        attr_accessor :y_

        sig do
          params(h: Integer, w: Integer, x: Integer, y_: Integer).returns(
            T.attached_class
          )
        end
        def self.new(h:, w:, x:, y_:)
        end

        sig do
          override.returns({ h: Integer, w: Integer, x: Integer, y_: Integer })
        end
        def to_hash
        end
      end

      class FocusRect < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TweetMedia::FocusRect,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :h

        sig { returns(Integer) }
        attr_accessor :w

        sig { returns(Integer) }
        attr_accessor :x

        sig { returns(Integer) }
        attr_accessor :y_

        sig do
          params(h: Integer, w: Integer, x: Integer, y_: Integer).returns(
            T.attached_class
          )
        end
        def self.new(h:, w:, x:, y_:)
        end

        sig do
          override.returns({ h: Integer, w: Integer, x: Integer, y_: Integer })
        end
        def to_hash
        end
      end

      class Size < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TweetMedia::Size,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :h

        sig { returns(String) }
        attr_accessor :resize

        sig { returns(Integer) }
        attr_accessor :w

        sig do
          params(h: Integer, resize: String, w: Integer).returns(
            T.attached_class
          )
        end
        def self.new(h:, resize:, w:)
        end

        sig { override.returns({ h: Integer, resize: String, w: Integer }) }
        def to_hash
        end
      end

      class VideoVariant < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TweetMedia::VideoVariant,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :content_type

        sig { returns(String) }
        attr_accessor :url

        sig { returns(T.nilable(Integer)) }
        attr_reader :bitrate

        sig { params(bitrate: Integer).void }
        attr_writer :bitrate

        sig do
          params(content_type: String, url: String, bitrate: Integer).returns(
            T.attached_class
          )
        end
        def self.new(content_type:, url:, bitrate: nil)
        end

        sig do
          override.returns(
            { content_type: String, url: String, bitrate: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
