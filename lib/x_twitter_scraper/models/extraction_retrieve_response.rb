# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#retrieve
    class ExtractionRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute job
      #   Extraction job metadata - shape varies by tool type (JSON)
      #
      #   @return [Hash{Symbol=>Object}]
      required :job, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

      # @!attribute results
      #
      #   @return [Array<Hash{Symbol=>Object}>]
      required :results,
               XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]]

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(has_more:, job:, results:, next_cursor: nil)
      #   @param has_more [Boolean]
      #
      #   @param job [Hash{Symbol=>Object}] Extraction job metadata - shape varies by tool type (JSON)
      #
      #   @param results [Array<Hash{Symbol=>Object}>]
      #
      #   @param next_cursor [String]
    end
  end
end
