# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Media#download
      class MediaDownloadResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute cache_hit
        #
        #   @return [Boolean, nil]
        optional :cache_hit, XTwitterScraper::Internal::Type::Boolean, api_name: :cacheHit

        # @!attribute gallery_url
        #
        #   @return [String, nil]
        optional :gallery_url, String, api_name: :galleryUrl

        # @!attribute image_filter
        #
        #   @return [XTwitterScraper::Models::ImageFilterSummary, nil]
        optional :image_filter, -> { XTwitterScraper::ImageFilterSummary }, api_name: :imageFilter

        # @!attribute items
        #   The post's files saved to your gallery. Single downloads only. Empty when
        #   imageShows kept no photo.
        #
        #   @return [Array<XTwitterScraper::Models::X::MediaDownloadResponse::Item>, nil]
        optional :items,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::MediaDownloadResponse::Item] }

        # @!attribute total_media
        #
        #   @return [Integer, nil]
        optional :total_media, Integer, api_name: :totalMedia

        # @!attribute total_tweets
        #
        #   @return [Integer, nil]
        optional :total_tweets, Integer, api_name: :totalTweets

        # @!attribute tweet_id
        #
        #   @return [String, nil]
        optional :tweet_id, String, api_name: :tweetId

        # @!attribute unprocessed_tweet_ids
        #   Posts Xquik had no time to read, at no charge. Send them again.
        #
        #   @return [Array<String>, nil]
        optional :unprocessed_tweet_ids,
                 XTwitterScraper::Internal::Type::ArrayOf[String],
                 api_name: :unprocessedTweetIds

        # @!method initialize(cache_hit: nil, gallery_url: nil, image_filter: nil, items: nil, total_media: nil, total_tweets: nil, tweet_id: nil, unprocessed_tweet_ids: nil)
        #   @param cache_hit [Boolean]
        #   @param gallery_url [String]
        #   @param image_filter [XTwitterScraper::Models::ImageFilterSummary]
        #   @param items [Array<XTwitterScraper::Models::X::MediaDownloadResponse::Item>] The post's files saved to your gallery. Single downloads only. Empty when imageS
        #   @param total_media [Integer]
        #   @param total_tweets [Integer]
        #   @param tweet_id [String]
        #   @param unprocessed_tweet_ids [Array<String>] Posts Xquik had no time to read, at no charge. Send them again.

        # @see XTwitterScraper::Models::X::MediaDownloadResponse#items
        class Item < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #   Gallery file ID
          #
          #   @return [String]
          required :id, String

          # @!attribute tweet_id
          #
          #   @return [String]
          required :tweet_id, String, api_name: :tweetId

          # @!attribute media_type
          #
          #   @return [Symbol, XTwitterScraper::Models::X::MediaDownloadResponse::Item::MediaType]
          required :media_type,
                   enum: -> { XTwitterScraper::X::MediaDownloadResponse::Item::MediaType },
                   api_name: :mediaType

          # @!attribute media_url
          #   Link to the file. It goes to X when X flagged the post or its media at save
          #   time, or sent no post flag. Xquik keeps no copy of those files.
          #
          #   @return [String]
          required :media_url, String, api_name: :mediaUrl

          # @!attribute poster_url
          #   Cover image of a video or GIF. Null for photos & files first saved to Xquik
          #   before 2026-11-03.
          #
          #   @return [String, nil]
          required :poster_url, String, api_name: :posterUrl, nil?: true

          # @!attribute qualities
          #   The MP4 sizes X stores for a video, highest bitrate first. Empty for photos,
          #   GIFs & files first saved to Xquik before 2026-11-03.
          #
          #   @return [Array<XTwitterScraper::Models::X::MediaDownloadResponse::Item::Quality>]
          required :qualities,
                   -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::MediaDownloadResponse::Item::Quality] }

          # @!attribute file_size
          #   File size in bytes, as a string
          #
          #   @return [String, nil]
          required :file_size, String, api_name: :fileSize, nil?: true

          # @!attribute created_at
          #   When the file joined your gallery
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt

          # @!attribute author_username
          #
          #   @return [String]
          required :author_username, String, api_name: :authorUsername

          # @!attribute author_display_name
          #
          #   @return [String]
          required :author_display_name, String, api_name: :authorDisplayName

          # @!attribute author_avatar
          #
          #   @return [String, nil]
          required :author_avatar, String, api_name: :authorAvatar, nil?: true

          # @!attribute tweet_text
          #
          #   @return [String]
          required :tweet_text, String, api_name: :tweetText

          # @!attribute likes
          #
          #   @return [Integer, nil]
          required :likes, Integer, nil?: true

          # @!attribute retweets
          #
          #   @return [Integer, nil]
          required :retweets, Integer, nil?: true

          # @!attribute views
          #
          #   @return [Integer, nil]
          required :views, Integer, nil?: true

          # @!method initialize(id:, tweet_id:, media_type:, media_url:, poster_url:, qualities:, file_size:, created_at:, author_username:, author_display_name:, author_avatar:, tweet_text:, likes:, retweets:, views:)
          #   @param id [String] Gallery file ID
          #
          #   @param tweet_id [String]
          #
          #   @param media_type [Symbol, XTwitterScraper::Models::X::MediaDownloadResponse::Item::MediaType]
          #
          #   @param media_url [String] Link to the file. It goes to X when X flagged the post or its media at save time
          #
          #   @param poster_url [String, nil] Cover image of a video or GIF. Null for photos & files first saved to Xquik befo
          #
          #   @param qualities [Array<XTwitterScraper::Models::X::MediaDownloadResponse::Item::Quality>] The MP4 sizes X stores for a video, highest bitrate first. Empty for photos, GIF
          #
          #   @param file_size [String, nil] File size in bytes, as a string
          #
          #   @param created_at [Time] When the file joined your gallery
          #
          #   @param author_username [String]
          #
          #   @param author_display_name [String]
          #
          #   @param author_avatar [String, nil]
          #
          #   @param tweet_text [String]
          #
          #   @param likes [Integer, nil]
          #
          #   @param retweets [Integer, nil]
          #
          #   @param views [Integer, nil]

          # @see XTwitterScraper::Models::X::MediaDownloadResponse::Item#media_type
          module MediaType
            extend XTwitterScraper::Internal::Type::Enum

            PHOTO = :photo
            VIDEO = :video
            ANIMATED_GIF = :animated_gif

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see XTwitterScraper::Models::X::MediaDownloadResponse::Item#qualities
          class Quality < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute bitrate
            #
            #   @return [Integer]
            required :bitrate, Integer

            # @!attribute height
            #
            #   @return [Integer]
            required :height, Integer

            # @!attribute url
            #
            #   @return [String]
            required :url, String

            # @!attribute width
            #
            #   @return [Integer]
            required :width, Integer

            # @!method initialize(bitrate:, height:, url:, width:)
            #   @param bitrate [Integer]
            #   @param height [Integer]
            #   @param url [String]
            #   @param width [Integer]
          end
        end
      end
    end
  end
end
