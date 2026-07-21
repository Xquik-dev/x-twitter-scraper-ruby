# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#retrieve_search
      class CommunityRetrieveSearchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute community_id
        #   Numeric ID of the community whose posts to search
        #
        #   @return [String]
        required :community_id, String

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

        # @!attribute page_size
        #   Maximum items requested from this page (1-100, default 20). The response can
        #   contain fewer items because the source returned fewer, filters removed items, or
        #   remaining credits cover fewer results. Keep requesting next_cursor while
        #   has_next_page is true, even when a page is empty. The deprecated limit and count
        #   aliases remain accepted.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer

        # @!attribute query_type
        #   Sort order (Latest or Top)
        #
        #   @return [Symbol, XTwitterScraper::Models::X::CommunityRetrieveSearchParams::QueryType, nil]
        optional :query_type, enum: -> { XTwitterScraper::X::CommunityRetrieveSearchParams::QueryType }

        # @!method initialize(community_id:, q:, cursor: nil, page_size: nil, query_type: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::CommunityRetrieveSearchParams} for more details.
        #
        #   @param community_id [String] Numeric ID of the community whose posts to search
        #
        #   @param q [String] Search query
        #
        #   @param cursor [String] Pagination cursor for community search
        #
        #   @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
        #
        #   @param query_type [Symbol, XTwitterScraper::Models::X::CommunityRetrieveSearchParams::QueryType] Sort order (Latest or Top)
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

        # Sort order (Latest or Top)
        module QueryType
          extend XTwitterScraper::Internal::Type::Enum

          LATEST = :Latest
          TOP = :Top

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
