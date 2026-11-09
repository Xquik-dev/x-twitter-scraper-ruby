# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Styles#list
    class StyleListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute styles
      #
      #   @return [Array<XTwitterScraper::Models::StyleProfileSummary>]
      required :styles, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::StyleProfileSummary] }

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(has_more:, styles:, next_cursor: nil)
      #   @param has_more [Boolean]
      #   @param styles [Array<XTwitterScraper::Models::StyleProfileSummary>]
      #   @param next_cursor [String]
    end
  end
end
