# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Support
      # @see XTwitterScraper::Resources::Support::Tickets#create
      class TicketCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute body
        #
        #   @return [String]
        required :body, String

        # @!attribute subject
        #
        #   @return [String]
        required :subject, String

        # @!method initialize(body:, subject:, request_options: {})
        #   @param body [String]
        #   @param subject [String]
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
