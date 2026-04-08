# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Monitors#list
    class MonitorListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute monitors
      #
      #   @return [Array<XTwitterScraper::Models::Monitor>]
      required :monitors, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Monitor] }

      # @!attribute total
      #
      #   @return [Integer]
      required :total, Integer

      # @!method initialize(monitors:, total:)
      #   @param monitors [Array<XTwitterScraper::Models::Monitor>]
      #   @param total [Integer]
    end
  end
end
