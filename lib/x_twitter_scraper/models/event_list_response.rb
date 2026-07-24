# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Events#list
    class EventListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute events
      #
      #   @return [Array<XTwitterScraper::Models::Event>]
      required :events, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Event] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(events:, has_more:, next_cursor: nil)
      #   @param events [Array<XTwitterScraper::Models::Event>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String]
    end
  end
end
