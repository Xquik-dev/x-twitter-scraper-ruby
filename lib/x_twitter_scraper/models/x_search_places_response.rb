# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#search_places
    class XSearchPlacesResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute places
      #
      #   @return [Array<XTwitterScraper::Models::PlaceSearchResult>]
      required :places, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::PlaceSearchResult] }

      # @!attribute count
      #   Places returned & charged.
      #
      #   @return [Integer]
      required :count, Integer

      # @!attribute total
      #   Places X found, before limit.
      #
      #   @return [Integer]
      required :total, Integer

      # @!attribute message
      #   What to send instead. Present only when X finds no place.
      #
      #   @return [String, nil]
      optional :message, String

      # @!method initialize(places:, count:, total:, message: nil)
      #   @param places [Array<XTwitterScraper::Models::PlaceSearchResult>]
      #
      #   @param count [Integer] Places returned & charged.
      #
      #   @param total [Integer] Places X found, before limit.
      #
      #   @param message [String] What to send instead. Present only when X finds no place.
    end
  end
end
