# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Credits#retrieve_topup_status
    class CreditRetrieveTopupStatusParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute session_id
      #   Billing session ID returned by the top-up billing flow.
      #
      #   @return [String]
      required :session_id, String

      # @!method initialize(session_id:, request_options: {})
      #   @param session_id [String] Billing session ID returned by the top-up billing flow.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
