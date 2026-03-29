# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Support
      # @see XTwitterScraper::Resources::Support::Tickets#retrieve
      class TicketRetrieveParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:, request_options: {})
        #   @param id [String]
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
