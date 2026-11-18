# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityPage < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute communities
      #   Communities in X's order
      #
      #   @return [Array<XTwitterScraper::Models::Community>]
      required :communities, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Community] }

      # @!attribute has_next_page
      #   Whether another page of communities follows
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #   Cursor for the next page of communities. Empty at the end.
      #
      #   @return [String]
      required :next_cursor, String

      # @!method initialize(communities:, has_next_page:, next_cursor:)
      #   1 page of X Communities, in X's order.
      #
      #   @param communities [Array<XTwitterScraper::Models::Community>] Communities in X's order
      #
      #   @param has_next_page [Boolean] Whether another page of communities follows
      #
      #   @param next_cursor [String] Cursor for the next page of communities. Empty at the end.
    end
  end
end
