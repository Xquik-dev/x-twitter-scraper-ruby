# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Radar#retrieve_trending_topics
    class RadarRetrieveTrendingTopicsResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse::Item>]
      required :items,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse::Item] }

      # @!attribute total
      #
      #   @return [Integer]
      required :total, Integer

      # @!method initialize(items:, total:)
      #   @param items [Array<XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse::Item>]
      #   @param total [Integer]

      class Item < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute category
        #
        #   @return [String]
        required :category, String

        # @!attribute published_at
        #
        #   @return [Time]
        required :published_at, Time, api_name: :publishedAt

        # @!attribute region
        #
        #   @return [String]
        required :region, String

        # @!attribute score
        #
        #   @return [Float]
        required :score, Float

        # @!attribute source
        #
        #   @return [String]
        required :source, String

        # @!attribute title
        #
        #   @return [String]
        required :title, String

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute image_url
        #
        #   @return [String, nil]
        optional :image_url, String, api_name: :imageUrl

        # @!attribute url
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(category:, published_at:, region:, score:, source:, title:, description: nil, image_url: nil, url: nil)
        #   @param category [String]
        #   @param published_at [Time]
        #   @param region [String]
        #   @param score [Float]
        #   @param source [String]
        #   @param title [String]
        #   @param description [String]
        #   @param image_url [String]
        #   @param url [String]
      end
    end
  end
end
