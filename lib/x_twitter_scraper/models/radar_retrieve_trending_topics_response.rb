# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Radar#retrieve_trending_topics
    class RadarRetrieveTrendingTopicsResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute items
      #
      #   @return [Array<XTwitterScraper::Models::RadarItem>]
      required :items, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::RadarItem] }

      # @!attribute next_cursor
      #   Opaque cursor for the next page (present only when hasMore is true).
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(has_more:, items:, next_cursor: nil)
      #   @param has_more [Boolean]
      #
      #   @param items [Array<XTwitterScraper::Models::RadarItem>]
      #
      #   @param next_cursor [String] Opaque cursor for the next page (present only when hasMore is true).
    end
  end
end
