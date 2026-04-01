# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#list_deliveries
    class WebhookListDeliveriesResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute deliveries
      #
      #   @return [Array<XTwitterScraper::Models::WebhookListDeliveriesResponse::Delivery>]
      required :deliveries,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::WebhookListDeliveriesResponse::Delivery] }

      # @!method initialize(deliveries:)
      #   @param deliveries [Array<XTwitterScraper::Models::WebhookListDeliveriesResponse::Delivery>]

      class Delivery < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute attempts
        #
        #   @return [Integer]
        required :attempts, Integer

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute status
        #
        #   @return [String]
        required :status, String

        # @!attribute stream_event_id
        #
        #   @return [String]
        required :stream_event_id, String, api_name: :streamEventId

        # @!attribute delivered_at
        #
        #   @return [Time, nil]
        optional :delivered_at, Time, api_name: :deliveredAt

        # @!attribute last_error
        #
        #   @return [String, nil]
        optional :last_error, String, api_name: :lastError

        # @!attribute last_status_code
        #
        #   @return [Integer, nil]
        optional :last_status_code, Integer, api_name: :lastStatusCode

        # @!method initialize(id:, attempts:, created_at:, status:, stream_event_id:, delivered_at: nil, last_error: nil, last_status_code: nil)
        #   @param id [String]
        #   @param attempts [Integer]
        #   @param created_at [Time]
        #   @param status [String]
        #   @param stream_event_id [String]
        #   @param delivered_at [Time]
        #   @param last_error [String]
        #   @param last_status_code [Integer]
      end
    end
  end
end
