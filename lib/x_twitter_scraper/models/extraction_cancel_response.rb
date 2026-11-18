# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#cancel
    class ExtractionCancelResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute status
      #
      #   @return [Symbol, :canceled]
      required :status, const: :canceled

      # @!method initialize(id:, status: :canceled)
      #   @param id [String]
      #
      #   @param status [Symbol, :canceled]
    end
  end
end
