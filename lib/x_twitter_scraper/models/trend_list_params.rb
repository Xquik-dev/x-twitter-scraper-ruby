# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Trends#list
    class TrendListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute count
      #
      #   @return [Integer, nil]
      optional :count, Integer

      # @!attribute woeid
      #   Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      #
      #   @return [Integer, nil]
      optional :woeid, Integer

      # @!method initialize(count: nil, woeid: nil, request_options: {})
      #   @param count [Integer]
      #
      #   @param woeid [Integer] Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
