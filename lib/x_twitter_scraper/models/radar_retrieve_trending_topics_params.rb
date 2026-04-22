# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Radar#retrieve_trending_topics
    class RadarRetrieveTrendingTopicsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute category
      #   Filter by category (general, tech, dev, etc.)
      #
      #   @return [String, nil]
      optional :category, String

      # @!attribute count
      #   Number of items to return
      #
      #   @return [Integer, nil]
      optional :count, Integer

      # @!attribute hours
      #   Lookback window in hours
      #
      #   @return [Integer, nil]
      optional :hours, Integer

      # @!attribute region
      #   Region filter (us, global, etc.)
      #
      #   @return [String, nil]
      optional :region, String

      # @!attribute source
      #   Source filter. One of: github, google_trends, hacker_news, polymarket, reddit,
      #   trustmrr, wikipedia
      #
      #   @return [Symbol, XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams::Source, nil]
      optional :source, enum: -> { XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source }

      # @!method initialize(category: nil, count: nil, hours: nil, region: nil, source: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams} for more details.
      #
      #   @param category [String] Filter by category (general, tech, dev, etc.)
      #
      #   @param count [Integer] Number of items to return
      #
      #   @param hours [Integer] Lookback window in hours
      #
      #   @param region [String] Region filter (us, global, etc.)
      #
      #   @param source [Symbol, XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams::Source] Source filter. One of: github, google_trends, hacker_news, polymarket, reddit, t
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Source filter. One of: github, google_trends, hacker_news, polymarket, reddit,
      # trustmrr, wikipedia
      module Source
        extend XTwitterScraper::Internal::Type::Enum

        GITHUB = :github
        GOOGLE_TRENDS = :google_trends
        HACKER_NEWS = :hacker_news
        POLYMARKET = :polymarket
        REDDIT = :reddit
        TRUSTMRR = :trustmrr
        WIKIPEDIA = :wikipedia

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
