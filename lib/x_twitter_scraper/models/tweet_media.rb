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

      # @!attribute sizes
      #   Named media renditions and resize modes.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::TweetMedia::Size}, nil]
      optional :sizes, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::TweetMedia::Size] }

      # @!attribute video_variants
      #   Available video encodings, ordered as returned
      #
      #   @return [Array<XTwitterScraper::Models::TweetMedia::VideoVariant>, nil]
      optional :video_variants,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetMedia::VideoVariant] },
               api_name: :videoVariants

      # @!attribute width
      #   Original media width.
      #
      #   @return [Integer, nil]
      optional :width, Integer

      # @!method initialize(media_url:, type:, url:, id: nil, allow_download: nil, alt_text: nil, aspect_ratio: nil, availability_status: nil, display_url: nil, duration_millis: nil, expanded_url: nil, face_rects: nil, focus_rects: nil, height: nil, indices: nil, media_key: nil, monetizable: nil, sizes: nil, video_variants: nil, width: nil)
      #   Normalized media attached to a tweet.
      #
      #   @param media_url [String] Media preview URL
      #
      #   @param type [Symbol, XTwitterScraper::Models::TweetMedia::Type]
      #
      #   @param url [String] X media link from the tweet
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
      #   @param sizes [Hash{Symbol=>XTwitterScraper::Models::TweetMedia::Size}] Named media renditions and resize modes.
      #
      #   @param video_variants [Array<XTwitterScraper::Models::TweetMedia::VideoVariant>] Available video encodings, ordered as returned
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
    end
  end
end
