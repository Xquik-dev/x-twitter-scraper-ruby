# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#retrieve
    class ExtractionRetrieveParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute after
      #   Cursor for keyset pagination
      #
      #   @return [String, nil]
      optional :after, String

      # @!attribute limit
      #   Maximum number of results to return (1-1000, default 100)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(id:, after: nil, limit: nil, request_options: {})
      #   @param id [String]
      #
      #   @param after [String] Cursor for keyset pagination
      #
      #   @param limit [Integer] Maximum number of results to return (1-1000, default 100)
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
