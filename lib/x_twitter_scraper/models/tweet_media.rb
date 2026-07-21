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

      # @!attribute video_variants
      #   Available video encodings, ordered as returned
      #
      #   @return [Array<XTwitterScraper::Models::TweetMedia::VideoVariant>, nil]
      optional :video_variants,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetMedia::VideoVariant] },
               api_name: :videoVariants

      # @!method initialize(media_url:, type:, url:, video_variants: nil)
      #   Normalized media attached to a tweet.
      #
      #   @param media_url [String] Media preview URL
      #
      #   @param type [Symbol, XTwitterScraper::Models::TweetMedia::Type]
      #
      #   @param url [String] X media link from the tweet
      #
      #   @param video_variants [Array<XTwitterScraper::Models::TweetMedia::VideoVariant>] Available video encodings, ordered as returned

      # @see XTwitterScraper::Models::TweetMedia#type
      module Type
        extend XTwitterScraper::Internal::Type::Enum

        PHOTO = :photo
        VIDEO = :video
        ANIMATED_GIF = :animated_gif

        # @!method self.values
        #   @return [Array<Symbol>]
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
