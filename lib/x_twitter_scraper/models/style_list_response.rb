# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Styles#list
    class StyleListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute styles
      #
      #   @return [Array<XTwitterScraper::Models::StyleProfileSummary>]
      required :styles, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::StyleProfileSummary] }

      # @!method initialize(styles:)
      #   @param styles [Array<XTwitterScraper::Models::StyleProfileSummary>]
    end
  end
end
