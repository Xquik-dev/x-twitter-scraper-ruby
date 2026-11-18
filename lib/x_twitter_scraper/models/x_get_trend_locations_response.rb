# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_trend_locations
    class XGetTrendLocationsResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute locations
      #
      #   @return [Array<XTwitterScraper::Models::TrendLocation>]
      required :locations, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::TrendLocation] }

      # @!attribute count
      #   Locations returned & charged.
      #
      #   @return [Integer]
      required :count, Integer

      # @!attribute total
      #   Locations that match the filters, before limit.
      #
      #   @return [Integer]
      required :total, Integer

      # @!attribute message
      #   What to send instead. Present only when no location matches.
      #
      #   @return [String, nil]
      optional :message, String

      # @!method initialize(locations:, count:, total:, message: nil)
      #   @param locations [Array<XTwitterScraper::Models::TrendLocation>]
      #
      #   @param count [Integer] Locations returned & charged.
      #
      #   @param total [Integer] Locations that match the filters, before limit.
      #
      #   @param message [String] What to send instead. Present only when no location matches.
    end
  end
end
