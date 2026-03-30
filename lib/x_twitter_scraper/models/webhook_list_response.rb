# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#list
    class WebhookListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute webhooks
      #
      #   @return [Array<XTwitterScraper::Models::Webhook>]
      required :webhooks, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Webhook] }

      # @!method initialize(webhooks:)
      #   @param webhooks [Array<XTwitterScraper::Models::Webhook>]
    end
  end
end
