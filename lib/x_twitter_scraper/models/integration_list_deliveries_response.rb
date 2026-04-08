# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Integrations#list_deliveries
    class IntegrationListDeliveriesResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute deliveries
      #
      #   @return [Array<XTwitterScraper::Models::IntegrationDelivery>]
      required :deliveries,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::IntegrationDelivery] }

      # @!method initialize(deliveries:)
      #   @param deliveries [Array<XTwitterScraper::Models::IntegrationDelivery>]
    end
  end
end
