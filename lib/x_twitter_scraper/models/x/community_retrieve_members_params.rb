# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#retrieve_members
      class CommunityRetrieveMembersParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute page_size
        #   Items per page (20-200, default 20)
        #
        #   @return [Integer, nil]
        optional :page_size, Integer

        # @!method initialize(id:, cursor: nil, page_size: nil, request_options: {})
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor
        #
        #   @param page_size [Integer] Items per page (20-200, default 20)
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
