# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_batch
      class UserRetrieveBatchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute ids
        #   Comma-separated user IDs (max 100)
        #
        #   @return [String]
        required :ids, String

        # @!method initialize(ids:, request_options: {})
        #   @param ids [String] Comma-separated user IDs (max 100)
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
