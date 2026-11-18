# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class JobLocations < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute locations
      #   Matching places, best match first.
      #
      #   @return [Array<XTwitterScraper::Models::JobLocation>]
      required :locations, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::JobLocation] }

      # @!attribute count
      #   Places returned, each charged 1 credit.
      #
      #   @return [Integer]
      required :count, Integer

      # @!method initialize(locations:, count:)
      #   The places whose names match a query.
      #
      #   @param locations [Array<XTwitterScraper::Models::JobLocation>] Matching places, best match first.
      #
      #   @param count [Integer] Places returned, each charged 1 credit.
    end
  end
end
