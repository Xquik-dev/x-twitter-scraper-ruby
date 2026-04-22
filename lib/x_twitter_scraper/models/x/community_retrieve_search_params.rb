# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#retrieve_search
      class CommunityRetrieveSearchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute q
        #   Search query
        #
        #   @return [String]
        required :q, String

        # @!attribute cursor
        #   Pagination cursor for community search
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute query_type
        #   Sort order (Latest or Top)
        #
        #   @return [String, nil]
        optional :query_type, String

        # @!method initialize(q:, cursor: nil, query_type: nil, request_options: {})
        #   @param q [String] Search query
        #
        #   @param cursor [String] Pagination cursor for community search
        #
        #   @param query_type [String] Sort order (Latest or Top)
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
