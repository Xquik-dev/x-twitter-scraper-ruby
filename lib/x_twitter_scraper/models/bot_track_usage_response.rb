# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Bot#track_usage
    class BotTrackUsageResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, XTwitterScraper::Internal::Type::Boolean

      # @!method initialize(success: nil)
      #   @param success [Boolean]
    end
  end
end
