# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Integrations#list
    class IntegrationListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute integrations
      #
      #   @return [Array<XTwitterScraper::Models::Integration>]
      required :integrations, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Integration] }

      # @!method initialize(integrations:)
      #   @param integrations [Array<XTwitterScraper::Models::Integration>]
    end
  end
end
