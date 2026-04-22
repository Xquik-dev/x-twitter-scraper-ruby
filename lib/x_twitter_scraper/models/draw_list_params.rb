# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Draws#list
    class DrawListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute after
      #   Cursor for keyset pagination
      #
      #   @return [String, nil]
      optional :after, String

      # @!attribute limit
      #   Maximum number of items to return (1-100, default 50)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(after: nil, limit: nil, request_options: {})
      #   @param after [String] Cursor for keyset pagination
      #
      #   @param limit [Integer] Maximum number of items to return (1-100, default 50)
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
