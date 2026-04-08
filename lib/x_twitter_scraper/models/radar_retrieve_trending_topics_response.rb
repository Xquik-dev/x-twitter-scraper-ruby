# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Radar#retrieve_trending_topics
    class RadarRetrieveTrendingTopicsResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<XTwitterScraper::Models::RadarItem>]
      required :items, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::RadarItem] }

      # @!attribute total
      #
      #   @return [Integer]
      required :total, Integer

      # @!method initialize(items:, total:)
      #   @param items [Array<XTwitterScraper::Models::RadarItem>]
      #   @param total [Integer]
    end
  end
end
