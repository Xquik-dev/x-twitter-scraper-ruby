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

        # @!method initialize(cache_hit: nil, gallery_url: nil, total_media: nil, total_tweets: nil, tweet_id: nil)
        #   @param cache_hit [Boolean]
        #   @param gallery_url [String]
        #   @param total_media [Integer]
        #   @param total_tweets [Integer]
        #   @param tweet_id [String]
      end
    end
  end
end
