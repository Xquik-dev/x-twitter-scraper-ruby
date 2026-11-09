# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Monitors#list
    class MonitorListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute monitors
      #
      #   @return [Array<XTwitterScraper::Models::Monitor>]
      required :monitors, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Monitor] }

      # @!attribute total
      #
      #   @return [Integer]
      required :total, Integer

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(has_more:, monitors:, total:, next_cursor: nil)
      #   @param has_more [Boolean]
      #   @param monitors [Array<XTwitterScraper::Models::Monitor>]
      #   @param total [Integer]
      #   @param next_cursor [String]
    end
  end
end
