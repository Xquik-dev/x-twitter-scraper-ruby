# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Drafts#list
    class DraftListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute after_cursor
      #   Cursor for pagination
      #
      #   @return [String, nil]
      optional :after_cursor, String

      # @!attribute limit
      #   Maximum number of items to return (1-100, default 50)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(after_cursor: nil, limit: nil, request_options: {})
      #   @param after_cursor [String] Cursor for pagination
      #
      #   @param limit [Integer] Maximum number of items to return (1-100, default 50)
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
