# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Integrations#list_deliveries
    class IntegrationListDeliveriesResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute deliveries
      #
      #   @return [Array<XTwitterScraper::Models::IntegrationListDeliveriesResponse::Delivery>]
      required :deliveries,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::IntegrationListDeliveriesResponse::Delivery] }

      # @!method initialize(deliveries:)
      #   @param deliveries [Array<XTwitterScraper::Models::IntegrationListDeliveriesResponse::Delivery>]

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

        # @!attribute event_type
        #
        #   @return [String]
        required :event_type, String, api_name: :eventType

        # @!attribute status
        #
        #   @return [String]
        required :status, String

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

        # @!attribute source_id
        #
        #   @return [String, nil]
        optional :source_id, String, api_name: :sourceId

        # @!attribute source_type
        #
        #   @return [String, nil]
        optional :source_type, String, api_name: :sourceType

        # @!method initialize(id:, attempts:, created_at:, event_type:, status:, delivered_at: nil, last_error: nil, last_status_code: nil, source_id: nil, source_type: nil)
        #   Integration delivery attempt record with status and retry count.
        #
        #   @param id [String]
        #   @param attempts [Integer]
        #   @param created_at [Time]
        #   @param event_type [String]
        #   @param status [String]
        #   @param delivered_at [Time]
        #   @param last_error [String]
        #   @param last_status_code [Integer]
        #   @param source_id [String]
        #   @param source_type [String]
      end
    end
  end
end
