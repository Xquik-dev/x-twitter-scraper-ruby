# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::APIKeys#list
    class APIKeyListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute keys
      #
      #   @return [Array<XTwitterScraper::Models::APIKey>]
      required :keys, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::APIKey] }

      # @!method initialize(keys:)
      #   @param keys [Array<XTwitterScraper::Models::APIKey>]
    end
  end
end
