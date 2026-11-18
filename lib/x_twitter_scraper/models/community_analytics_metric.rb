# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityAnalyticsMetric < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute count
      #   Total for this metric during X's latest period.
      #
      #   @return [Integer]
      required :count, Integer

      # @!attribute change_percent
      #   Change in percent from the same figure 1 day earlier. Values stay unrounded.
      #
      #   @return [Float]
      required :change_percent, Float, api_name: :changePercent

      # @!method initialize(count:, change_percent:)
      #   A community metric for X's latest period & its percent change.
      #
      #   @param count [Integer] Total for this metric during X's latest period.
      #
      #   @param change_percent [Float] Change in percent from the same figure 1 day earlier. Values stay unrounded.
    end
  end
end
