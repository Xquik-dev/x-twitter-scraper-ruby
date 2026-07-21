# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Support
      # @see XTwitterScraper::Resources::Support::Tickets#reply
      class TicketReplyParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute body
        #
        #   @return [String]
        required :body, String

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!method initialize(id:, body:, idempotency_key: nil, request_options: {})
        #   @param id [String]
        #   @param body [String]
        #   @param idempotency_key [String]
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
