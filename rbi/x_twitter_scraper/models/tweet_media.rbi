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

      # Adult-content warning.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :adult_content

      sig { params(adult_content: T::Boolean).void }
      attr_writer :adult_content

      # Why X made the media unavailable, such as `Dmcaed` after a copyright report.
      # Omitted on available media.
      sig { returns(T.nilable(String)) }
      attr_reader :availability_reason

      sig { params(availability_reason: String).void }
      attr_writer :availability_reason

      # Media description.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # True when the author edited this media in X's own editor before posting. Absent
      # when X sends no editor info.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :edited_with_native_editor

      sig { params(edited_with_native_editor: T::Boolean).void }
      attr_writer :edited_with_native_editor

      # Embeddable status.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :embeddable

      sig { params(embeddable: T::Boolean).void }
      attr_writer :embeddable

      # Graphic-violence warning.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :graphic_violence

      sig { params(graphic_violence: T::Boolean).void }
      attr_writer :graphic_violence

      # Prompt a Grok image came from. Absent on other media & when X sends no prompt.
      sig do
        returns(T.nilable(XTwitterScraper::TweetMedia::GrokImageAnnotation))
      end
      attr_reader :grok_image_annotation

      sig do
        params(
          grok_image_annotation:
            XTwitterScraper::TweetMedia::GrokImageAnnotation::OrHash
        ).void
      end
      attr_writer :grok_image_annotation

      # Grok post ID associated with the media.
      sig { returns(T.nilable(String)) }
      attr_reader :grok_post_id

      sig { params(grok_post_id: String).void }
      attr_writer :grok_post_id

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

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :other_sensitive_content

      sig { params(other_sensitive_content: T::Boolean).void }
      attr_writer :other_sensitive_content

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

      # Source tweet ID for copied media.
      sig { returns(T.nilable(String)) }
      attr_reader :source_status_id

      sig { params(source_status_id: String).void }
      attr_writer :source_status_id

      # The account that first posted the media. Some reads carry only its name, picture
      # & badges.
      sig { returns(T.nilable(XTwitterScraper::UserProfile)) }
      attr_reader :source_user

      sig { params(source_user: XTwitterScraper::UserProfile::OrHash).void }
      attr_writer :source_user

      # Source profile ID for copied media.
      sig { returns(T.nilable(String)) }
      attr_reader :source_user_id

      sig { params(source_user_id: String).void }
      attr_writer :source_user_id

      # Public profiles tagged in the media.
      sig { returns(T.nilable(T::Array[XTwitterScraper::TweetMedia::Tag])) }
      attr_reader :tags

      sig do
        params(tags: T::Array[XTwitterScraper::TweetMedia::Tag::OrHash]).void
      end
      attr_writer :tags

      # Media title.
      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

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

      # Public destination URL.
      sig { returns(T.nilable(String)) }
      attr_reader :visit_site_url

      sig { params(visit_site_url: String).void }
      attr_writer :visit_site_url

      # Public media action URL.
      sig { returns(T.nilable(String)) }
      attr_reader :watch_now_url

      sig { params(watch_now_url: String).void }
      attr_writer :watch_now_url

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
          adult_content: T::Boolean,
          availability_reason: String,
          description: String,
          edited_with_native_editor: T::Boolean,
          embeddable: T::Boolean,
          graphic_violence: T::Boolean,
          grok_image_annotation:
            XTwitterScraper::TweetMedia::GrokImageAnnotation::OrHash,
          grok_post_id: String,
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
          other_sensitive_content: T::Boolean,
          sizes: T::Hash[Symbol, XTwitterScraper::TweetMedia::Size::OrHash],
          source_status_id: String,
          source_user: XTwitterScraper::UserProfile::OrHash,
          source_user_id: String,
          tags: T::Array[XTwitterScraper::TweetMedia::Tag::OrHash],
          title: String,
          video_variants:
            T::Array[XTwitterScraper::TweetMedia::VideoVariant::OrHash],
          visit_site_url: String,
          watch_now_url: String,
          width: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Media preview URL
        media_url:,
        type:,
        # X media link from the tweet
        url:,
        # Adult-content warning.
        adult_content: nil,
        # Why X made the media unavailable, such as `Dmcaed` after a copyright report.
        # Omitted on available media.
        availability_reason: nil,
        # Media description.
        description: nil,
        # True when the author edited this media in X's own editor before posting. Absent
        # when X sends no editor info.
        edited_with_native_editor: nil,
        # Embeddable status.
        embeddable: nil,
        # Graphic-violence warning.
        graphic_violence: nil,
        # Prompt a Grok image came from. Absent on other media & when X sends no prompt.
        grok_image_annotation: nil,
        # Grok post ID associated with the media.
        grok_post_id: nil,
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
        other_sensitive_content: nil,
        # Named media renditions and resize modes.
        sizes: nil,
        # Source tweet ID for copied media.
        source_status_id: nil,
        # The account that first posted the media. Some reads carry only its name, picture
        # & badges.
        source_user: nil,
        # Source profile ID for copied media.
        source_user_id: nil,
        # Public profiles tagged in the media.
        tags: nil,
        # Media title.
        title: nil,
        # Available video encodings, ordered as returned
        video_variants: nil,
        # Public destination URL.
        visit_site_url: nil,
        # Public media action URL.
        watch_now_url: nil,
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
            adult_content: T::Boolean,
            availability_reason: String,
            description: String,
            edited_with_native_editor: T::Boolean,
            embeddable: T::Boolean,
            graphic_violence: T::Boolean,
            grok_image_annotation:
              XTwitterScraper::TweetMedia::GrokImageAnnotation,
            grok_post_id: String,
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
            other_sensitive_content: T::Boolean,
            sizes: T::Hash[Symbol, XTwitterScraper::TweetMedia::Size],
            source_status_id: String,
            source_user: XTwitterScraper::UserProfile,
            source_user_id: String,
            tags: T::Array[XTwitterScraper::TweetMedia::Tag],
            title: String,
            video_variants: T::Array[XTwitterScraper::TweetMedia::VideoVariant],
            visit_site_url: String,
            watch_now_url: String,
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

      class GrokImageAnnotation < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TweetMedia::GrokImageAnnotation,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Prompt the image came from.
        sig { returns(T.nilable(String)) }
        attr_reader :prompt

        sig { params(prompt: String).void }
        attr_writer :prompt

        # Grok's longer rewrite of the prompt.
        sig { returns(T.nilable(String)) }
        attr_reader :upsampled_prompt

        sig { params(upsampled_prompt: String).void }
        attr_writer :upsampled_prompt

        # Prompt a Grok image came from. Absent on other media & when X sends no prompt.
        sig do
          params(prompt: String, upsampled_prompt: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Prompt the image came from.
          prompt: nil,
          # Grok's longer rewrite of the prompt.
          upsampled_prompt: nil
        )
        end

        sig { override.returns({ prompt: String, upsampled_prompt: String }) }
        def to_hash
        end
      end

      class Tag < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TweetMedia::Tag,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(String)) }
        attr_reader :screen_name

        sig { params(screen_name: String).void }
        attr_writer :screen_name

        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        sig { returns(T.nilable(String)) }
        attr_reader :user_id

        sig { params(user_id: String).void }
        attr_writer :user_id

        sig do
          params(
            name: String,
            screen_name: String,
            type: String,
            user_id: String
          ).returns(T.attached_class)
        end
        def self.new(name: nil, screen_name: nil, type: nil, user_id: nil)
        end

        sig do
          override.returns(
            { name: String, screen_name: String, type: String, user_id: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
