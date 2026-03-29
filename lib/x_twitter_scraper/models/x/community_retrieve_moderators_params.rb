# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#retrieve_moderators
      class CommunityRetrieveModeratorsParams < XTwitterScraper::Internal::Type::BaseModel
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

        # @!method initialize(id:, cursor: nil, request_options: {})
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
