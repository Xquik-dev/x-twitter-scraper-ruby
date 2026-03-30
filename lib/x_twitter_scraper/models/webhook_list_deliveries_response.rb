# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#list_deliveries
    class WebhookListDeliveriesResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute deliveries
      #
      #   @return [Array<XTwitterScraper::Models::Delivery>]
      required :deliveries, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Delivery] }

      # @!method initialize(deliveries:)
      #   @param deliveries [Array<XTwitterScraper::Models::Delivery>]
    end
  end
end
