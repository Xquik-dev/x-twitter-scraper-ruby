# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetMedia < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute media_url
      #   Media preview URL
      #
      #   @return [String]
      required :media_url, String, api_name: :mediaUrl

      # @!attribute type
      #
      #   @return [Symbol, XTwitterScraper::Models::TweetMedia::Type]
      required :type, enum: -> { XTwitterScraper::TweetMedia::Type }

      # @!attribute url
      #   X media link from the tweet
      #
      #   @return [String]
      required :url, String

      # @!attribute adult_content
      #   Adult-content warning.
      #
      #   @return [Boolean, nil]
      optional :adult_content, XTwitterScraper::Internal::Type::Boolean, api_name: :adultContent

      # @!attribute availability_reason
      #   Why X made the media unavailable, such as `Dmcaed` after a copyright report.
      #   Omitted on available media.
      #
      #   @return [String, nil]
      optional :availability_reason, String, api_name: :availabilityReason

      # @!attribute description
      #   Media description.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute edited_with_native_editor
      #   True when the author edited this media in X's own editor before posting. Absent
      #   when X sends no editor info.
      #
      #   @return [Boolean, nil]
      optional :edited_with_native_editor,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :editedWithNativeEditor

      # @!attribute embeddable
      #   Embeddable status.
      #
      #   @return [Boolean, nil]
      optional :embeddable, XTwitterScraper::Internal::Type::Boolean

      # @!attribute graphic_violence
      #   Graphic-violence warning.
      #
      #   @return [Boolean, nil]
      optional :graphic_violence, XTwitterScraper::Internal::Type::Boolean, api_name: :graphicViolence

      # @!attribute grok_image_annotation
      #   Prompt a Grok image came from. Absent on other media & when X sends no prompt.
      #
      #   @return [XTwitterScraper::Models::TweetMedia::GrokImageAnnotation, nil]
      optional :grok_image_annotation,
               -> { XTwitterScraper::TweetMedia::GrokImageAnnotation },
               api_name: :grokImageAnnotation

      # @!attribute grok_post_id
      #   Grok post ID associated with the media.
      #
      #   @return [String, nil]
      optional :grok_post_id, String, api_name: :grokPostId

      # @!attribute id
      #   X media entity ID.
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute allow_download
      #   Whether X permits direct media download.
      #
      #   @return [Boolean, nil]
      optional :allow_download, XTwitterScraper::Internal::Type::Boolean, api_name: :allowDownload

      # @!attribute alt_text
      #   Accessibility text supplied for the media.
      #
      #   @return [String, nil]
      optional :alt_text, String, api_name: :altText

      # @!attribute aspect_ratio
      #   Video aspect ratio as width and height.
      #
      #   @return [Array<Integer>, nil]
      optional :aspect_ratio, XTwitterScraper::Internal::Type::ArrayOf[Integer], api_name: :aspectRatio

      # @!attribute availability_status
      #   Media availability state reported by X.
      #
      #   @return [String, nil]
      optional :availability_status, String, api_name: :availabilityStatus

      # @!attribute display_url
      #   Display-friendly media URL reported by X.
      #
      #   @return [String, nil]
      optional :display_url, String, api_name: :displayUrl

      # @!attribute duration_millis
      #   Video duration in milliseconds.
      #
      #   @return [Integer, nil]
      optional :duration_millis, Integer, api_name: :durationMillis

      # @!attribute expanded_url
      #   Expanded X media URL.
      #
      #   @return [String, nil]
      optional :expanded_url, String, api_name: :expandedUrl

      # @!attribute face_rects
      #   Face-aware crop rectangles grouped by media size.
      #
      #   @return [Hash{Symbol=>Array<XTwitterScraper::Models::TweetMedia::FaceRect>}, nil]
      optional :face_rects,
               -> {
                 XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetMedia::FaceRect]]
               },
               api_name: :faceRects

      # @!attribute focus_rects
      #   Suggested image crops reported by X.
      #
      #   @return [Array<XTwitterScraper::Models::TweetMedia::FocusRect>, nil]
      optional :focus_rects,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetMedia::FocusRect] },
               api_name: :focusRects

      # @!attribute height
      #   Original media height.
      #
      #   @return [Integer, nil]
      optional :height, Integer

      # @!attribute indices
      #   Media entity offsets in the tweet text.
      #
      #   @return [Array<Integer>, nil]
      optional :indices, XTwitterScraper::Internal::Type::ArrayOf[Integer]

      # @!attribute media_key
      #   Stable X media key.
      #
      #   @return [String, nil]
      optional :media_key, String, api_name: :mediaKey

      # @!attribute monetizable
      #   Whether X reports the media as monetizable.
      #
      #   @return [Boolean, nil]
      optional :monetizable, XTwitterScraper::Internal::Type::Boolean

      # @!attribute other_sensitive_content
      #
      #   @return [Boolean, nil]
      optional :other_sensitive_content,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :otherSensitiveContent

      # @!attribute sizes
      #   Named media renditions and resize modes.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::TweetMedia::Size}, nil]
      optional :sizes, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::TweetMedia::Size] }

      # @!attribute source_status_id
      #   Source tweet ID for copied media.
      #
      #   @return [String, nil]
      optional :source_status_id, String, api_name: :sourceStatusId

      # @!attribute source_user
      #   The account that first posted the media. Some reads carry only its name, picture
      #   & badges.
      #
      #   @return [XTwitterScraper::Models::UserProfile, nil]
      optional :source_user, -> { XTwitterScraper::UserProfile }, api_name: :sourceUser

      # @!attribute source_user_id
      #   Source profile ID for copied media.
      #
      #   @return [String, nil]
      optional :source_user_id, String, api_name: :sourceUserId

      # @!attribute tags
      #   Public profiles tagged in the media.
      #
      #   @return [Array<XTwitterScraper::Models::TweetMedia::Tag>, nil]
      optional :tags, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetMedia::Tag] }

      # @!attribute title
      #   Media title.
      #
      #   @return [String, nil]
      optional :title, String

      # @!attribute video_variants
      #   Available video encodings, ordered as returned
      #
      #   @return [Array<XTwitterScraper::Models::TweetMedia::VideoVariant>, nil]
      optional :video_variants,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetMedia::VideoVariant] },
               api_name: :videoVariants

      # @!attribute visit_site_url
      #   Public destination URL.
      #
      #   @return [String, nil]
      optional :visit_site_url, String, api_name: :visitSiteUrl

      # @!attribute watch_now_url
      #   Public media action URL.
      #
      #   @return [String, nil]
      optional :watch_now_url, String, api_name: :watchNowUrl

      # @!attribute width
      #   Original media width.
      #
      #   @return [Integer, nil]
      optional :width, Integer

      # @!method initialize(media_url:, type:, url:, adult_content: nil, availability_reason: nil, description: nil, edited_with_native_editor: nil, embeddable: nil, graphic_violence: nil, grok_image_annotation: nil, grok_post_id: nil, id: nil, allow_download: nil, alt_text: nil, aspect_ratio: nil, availability_status: nil, display_url: nil, duration_millis: nil, expanded_url: nil, face_rects: nil, focus_rects: nil, height: nil, indices: nil, media_key: nil, monetizable: nil, other_sensitive_content: nil, sizes: nil, source_status_id: nil, source_user: nil, source_user_id: nil, tags: nil, title: nil, video_variants: nil, visit_site_url: nil, watch_now_url: nil, width: nil)
      #   Normalized media attached to a tweet.
      #
      #   @param media_url [String] Media preview URL
      #
      #   @param type [Symbol, XTwitterScraper::Models::TweetMedia::Type]
      #
      #   @param url [String] X media link from the tweet
      #
      #   @param adult_content [Boolean] Adult-content warning.
      #
      #   @param availability_reason [String] Why X made the media unavailable, such as `Dmcaed` after a copyright report. Omi
      #
      #   @param description [String] Media description.
      #
      #   @param edited_with_native_editor [Boolean] True when the author edited this media in X's own editor before posting. Absent
      #
      #   @param embeddable [Boolean] Embeddable status.
      #
      #   @param graphic_violence [Boolean] Graphic-violence warning.
      #
      #   @param grok_image_annotation [XTwitterScraper::Models::TweetMedia::GrokImageAnnotation] Prompt a Grok image came from. Absent on other media & when X sends no prompt.
      #
      #   @param grok_post_id [String] Grok post ID associated with the media.
      #
      #   @param id [String] X media entity ID.
      #
      #   @param allow_download [Boolean] Whether X permits direct media download.
      #
      #   @param alt_text [String] Accessibility text supplied for the media.
      #
      #   @param aspect_ratio [Array<Integer>] Video aspect ratio as width and height.
      #
      #   @param availability_status [String] Media availability state reported by X.
      #
      #   @param display_url [String] Display-friendly media URL reported by X.
      #
      #   @param duration_millis [Integer] Video duration in milliseconds.
      #
      #   @param expanded_url [String] Expanded X media URL.
      #
      #   @param face_rects [Hash{Symbol=>Array<XTwitterScraper::Models::TweetMedia::FaceRect>}] Face-aware crop rectangles grouped by media size.
      #
      #   @param focus_rects [Array<XTwitterScraper::Models::TweetMedia::FocusRect>] Suggested image crops reported by X.
      #
      #   @param height [Integer] Original media height.
      #
      #   @param indices [Array<Integer>] Media entity offsets in the tweet text.
      #
      #   @param media_key [String] Stable X media key.
      #
      #   @param monetizable [Boolean] Whether X reports the media as monetizable.
      #
      #   @param other_sensitive_content [Boolean]
      #
      #   @param sizes [Hash{Symbol=>XTwitterScraper::Models::TweetMedia::Size}] Named media renditions and resize modes.
      #
      #   @param source_status_id [String] Source tweet ID for copied media.
      #
      #   @param source_user [XTwitterScraper::Models::UserProfile] The account that first posted the media. Some reads carry only its name, picture
      #
      #   @param source_user_id [String] Source profile ID for copied media.
      #
      #   @param tags [Array<XTwitterScraper::Models::TweetMedia::Tag>] Public profiles tagged in the media.
      #
      #   @param title [String] Media title.
      #
      #   @param video_variants [Array<XTwitterScraper::Models::TweetMedia::VideoVariant>] Available video encodings, ordered as returned
      #
      #   @param visit_site_url [String] Public destination URL.
      #
      #   @param watch_now_url [String] Public media action URL.
      #
      #   @param width [Integer] Original media width.

      # @see XTwitterScraper::Models::TweetMedia#type
      module Type
        extend XTwitterScraper::Internal::Type::Enum

        PHOTO = :photo
        VIDEO = :video
        ANIMATED_GIF = :animated_gif

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class FaceRect < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute h
        #
        #   @return [Integer]
        required :h, Integer

        # @!attribute w
        #
        #   @return [Integer]
        required :w, Integer

        # @!attribute x
        #
        #   @return [Integer]
        required :x, Integer

        # @!attribute y_
        #
        #   @return [Integer]
        required :y_, Integer, api_name: :y

        # @!method initialize(h:, w:, x:, y_:)
        #   @param h [Integer]
        #   @param w [Integer]
        #   @param x [Integer]
        #   @param y_ [Integer]
      end

      class FocusRect < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute h
        #
        #   @return [Integer]
        required :h, Integer

        # @!attribute w
        #
        #   @return [Integer]
        required :w, Integer

        # @!attribute x
        #
        #   @return [Integer]
        required :x, Integer

        # @!attribute y_
        #
        #   @return [Integer]
        required :y_, Integer, api_name: :y

        # @!method initialize(h:, w:, x:, y_:)
        #   @param h [Integer]
        #   @param w [Integer]
        #   @param x [Integer]
        #   @param y_ [Integer]
      end

      class Size < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute h
        #
        #   @return [Integer]
        required :h, Integer

        # @!attribute resize
        #
        #   @return [String]
        required :resize, String

        # @!attribute w
        #
        #   @return [Integer]
        required :w, Integer

        # @!method initialize(h:, resize:, w:)
        #   @param h [Integer]
        #   @param resize [String]
        #   @param w [Integer]
      end

      class VideoVariant < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute content_type
        #
        #   @return [String]
        required :content_type, String, api_name: :contentType

        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!attribute bitrate
        #
        #   @return [Integer, nil]
        optional :bitrate, Integer

        # @!method initialize(content_type:, url:, bitrate: nil)
        #   @param content_type [String]
        #   @param url [String]
        #   @param bitrate [Integer]
      end

      # @see XTwitterScraper::Models::TweetMedia#grok_image_annotation
      class GrokImageAnnotation < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute prompt
        #   Prompt the image came from.
        #
        #   @return [String, nil]
        optional :prompt, String

        # @!attribute upsampled_prompt
        #   Grok's longer rewrite of the prompt.
        #
        #   @return [String, nil]
        optional :upsampled_prompt, String, api_name: :upsampledPrompt

        # @!method initialize(prompt: nil, upsampled_prompt: nil)
        #   Prompt a Grok image came from. Absent on other media & when X sends no prompt.
        #
        #   @param prompt [String] Prompt the image came from.
        #
        #   @param upsampled_prompt [String] Grok's longer rewrite of the prompt.
      end

      # @see XTwitterScraper::Models::TweetMedia#tags
      class Tag < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute screen_name
        #
        #   @return [String, nil]
        optional :screen_name, String

        # @!attribute type
        #
        #   @return [String, nil]
        optional :type, String

        # @!attribute user_id
        #
        #   @return [String, nil]
        optional :user_id, String

        # @!method initialize(name: nil, screen_name: nil, type: nil, user_id: nil)
        #   @param name [String]
        #   @param screen_name [String]
        #   @param type [String]
        #   @param user_id [String]
      end
    end
  end
end
