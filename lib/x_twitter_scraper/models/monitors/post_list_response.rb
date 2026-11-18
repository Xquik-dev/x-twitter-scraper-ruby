# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Monitors
      # @see XTwitterScraper::Resources::Monitors::Posts#list
      class PostListResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute monitors
        #
        #   @return [Array<XTwitterScraper::Models::PostMonitor>]
        required :monitors, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::PostMonitor] }

        # @!attribute total
        #   Post monitors on this page.
        #
        #   @return [Integer]
        required :total, Integer

        # @!attribute has_more
        #
        #   @return [Boolean]
        required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

        # @!attribute next_cursor
        #
        #   @return [String, nil]
        optional :next_cursor, String, api_name: :nextCursor

        # @!method initialize(monitors:, total:, has_more:, next_cursor: nil)
        #   @param monitors [Array<XTwitterScraper::Models::PostMonitor>]
        #
        #   @param total [Integer] Post monitors on this page.
        #
        #   @param has_more [Boolean]
        #
        #   @param next_cursor [String]
      end
    end
  end
end
