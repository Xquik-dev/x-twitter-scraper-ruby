# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Spaces#search
      class SpaceSearchResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute spaces
        #   Public Spaces, each once. Latest & Top list them in the order the posts share
        #   them. Live & Upcoming keep X's order.
        #
        #   @return [Array<XTwitterScraper::Models::Space>]
        required :spaces, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Space] }

        # @!attribute has_next_page
        #
        #   @return [Boolean]
        required :has_next_page, XTwitterScraper::Internal::Type::Boolean

        # @!attribute next_cursor
        #   Cursor for the next page. Send it unchanged. Each next page arrives fast.
        #
        #   @return [String]
        required :next_cursor, String

        # @!method initialize(spaces:, has_next_page:, next_cursor:)
        #   @param spaces [Array<XTwitterScraper::Models::Space>] Public Spaces, each once. Latest & Top list them in the order the posts share them. Live & Upcoming keep X's order.
        #
        #   @param has_next_page [Boolean]
        #
        #   @param next_cursor [String] Cursor for the next page. Send it unchanged. Each next page arrives fast.
      end
    end
  end
end
