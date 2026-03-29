# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#estimate_cost
    class ExtractionEstimateCostResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute allowed
      #
      #   @return [Boolean]
      required :allowed, XTwitterScraper::Internal::Type::Boolean

      # @!attribute estimated_results
      #
      #   @return [Integer]
      required :estimated_results, Integer, api_name: :estimatedResults

      # @!attribute projected_percent
      #
      #   @return [Float]
      required :projected_percent, Float, api_name: :projectedPercent

      # @!attribute source
      #
      #   @return [String]
      required :source, String

      # @!attribute usage_percent
      #
      #   @return [Float]
      required :usage_percent, Float, api_name: :usagePercent

      # @!method initialize(allowed:, estimated_results:, projected_percent:, source:, usage_percent:)
      #   @param allowed [Boolean]
      #   @param estimated_results [Integer]
      #   @param projected_percent [Float]
      #   @param source [String]
      #   @param usage_percent [Float]
    end
  end
end
