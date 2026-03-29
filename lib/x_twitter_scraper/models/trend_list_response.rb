# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Trends#list
    class TrendListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute total
      #
      #   @return [Integer]
      required :total, Integer

      # @!attribute trends
      #
      #   @return [Array<XTwitterScraper::Models::TrendListResponse::Trend>]
      required :trends,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::TrendListResponse::Trend] }

      # @!attribute woeid
      #
      #   @return [Integer]
      required :woeid, Integer

      # @!method initialize(total:, trends:, woeid:)
      #   @param total [Integer]
      #   @param trends [Array<XTwitterScraper::Models::TrendListResponse::Trend>]
      #   @param woeid [Integer]

      class Trend < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute query
        #
        #   @return [String, nil]
        optional :query, String

        # @!attribute rank
        #
        #   @return [Integer, nil]
        optional :rank, Integer

        # @!method initialize(name:, description: nil, query: nil, rank: nil)
        #   @param name [String]
        #   @param description [String]
        #   @param query [String]
        #   @param rank [Integer]
      end
    end
  end
end
