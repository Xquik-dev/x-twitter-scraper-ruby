# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Dm#retrieve_history
      class DmRetrieveHistoryParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute cursor
        #   Pagination cursor from previous response
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute max_id
        #   Legacy pagination cursor (backward compat)
        #
        #   @return [String, nil]
        optional :max_id, String

        # @!method initialize(user_id:, cursor: nil, max_id: nil, request_options: {})
        #   @param user_id [String]
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param max_id [String] Legacy pagination cursor (backward compat)
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
