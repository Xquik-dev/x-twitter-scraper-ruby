# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Bookmarks#list
      class BookmarkListParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute cursor
        #   Pagination cursor from previous response
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute folder_id
        #   Optional bookmark folder ID
        #
        #   @return [String, nil]
        optional :folder_id, String

        # @!method initialize(cursor: nil, folder_id: nil, request_options: {})
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param folder_id [String] Optional bookmark folder ID
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
