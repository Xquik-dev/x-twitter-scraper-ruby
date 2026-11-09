# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#run
    class ExtractionRunResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute allowed
      #
      #   @return [Boolean, nil]
      optional :allowed, XTwitterScraper::Internal::Type::Boolean

      # @!attribute credits_available
      #
      #   @return [String, nil]
      optional :credits_available, String, api_name: :creditsAvailable

      # @!attribute credits_required
      #
      #   @return [String, nil]
      optional :credits_required, String, api_name: :creditsRequired

      # @!attribute estimated_results
      #
      #   @return [Integer, nil]
      optional :estimated_results, Integer, api_name: :estimatedResults

      # @!attribute source
      #
      #   @return [String, nil]
      optional :source, String

      # @!attribute resolved_x_user_id
      #
      #   @return [String, nil]
      optional :resolved_x_user_id, String, api_name: :resolvedXUserId

      # @!method initialize(allowed: nil, credits_available: nil, credits_required: nil, estimated_results: nil, source: nil, resolved_x_user_id: nil)
      #   @param allowed [Boolean]
      #   @param credits_available [String]
      #   @param credits_required [String]
      #   @param estimated_results [Integer]
      #   @param source [String]
      #   @param resolved_x_user_id [String]
    end
  end
end
