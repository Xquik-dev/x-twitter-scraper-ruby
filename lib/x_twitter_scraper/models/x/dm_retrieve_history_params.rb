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

        # @!attribute account
        #   X handle (without the `@` prefix) of the connected X account used to read the
        #   conversation. The account must be a participant in the conversation.
        #
        #   @return [String]
        required :account, String

        # @!attribute cursor
        #   Pagination cursor for DM history
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute max_id
        #   Legacy pagination cursor (backward compat)
        #
        #   @return [String, nil]
        optional :max_id, String

        # @!method initialize(user_id:, account:, cursor: nil, max_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::DmRetrieveHistoryParams} for more details.
        #
        #   @param user_id [String]
        #
        #   @param account [String] X handle (without the `@` prefix) of the connected X account used to read the co
        #
        #   @param cursor [String] Pagination cursor for DM history
        #
        #   @param max_id [String] Legacy pagination cursor (backward compat)
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
