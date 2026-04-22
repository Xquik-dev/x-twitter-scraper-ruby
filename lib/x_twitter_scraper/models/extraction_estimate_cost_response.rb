# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#estimate_cost
    class ExtractionEstimateCostResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute allowed
      #
      #   @return [Boolean]
      required :allowed, XTwitterScraper::Internal::Type::Boolean

      # @!attribute credits_available
      #
      #   @return [String]
      required :credits_available, String, api_name: :creditsAvailable

      # @!attribute credits_required
      #
      #   @return [String]
      required :credits_required, String, api_name: :creditsRequired

      # @!attribute estimated_results
      #
      #   @return [Integer]
      required :estimated_results, Integer, api_name: :estimatedResults

      # @!attribute source
      #
      #   @return [String]
      required :source, String

      # @!attribute resolved_x_user_id
      #
      #   @return [String, nil]
      optional :resolved_x_user_id, String, api_name: :resolvedXUserId

      # @!method initialize(allowed:, credits_available:, credits_required:, estimated_results:, source:, resolved_x_user_id: nil)
      #   @param allowed [Boolean]
      #   @param credits_available [String]
      #   @param credits_required [String]
      #   @param estimated_results [Integer]
      #   @param source [String]
      #   @param resolved_x_user_id [String]
    end
  end
end
