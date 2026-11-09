# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#list_deliveries
    class WebhookListDeliveriesResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute deliveries
      #
      #   @return [Array<XTwitterScraper::Models::Delivery>]
      required :deliveries, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Delivery] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(deliveries:, has_more:, next_cursor: nil)
      #   @param deliveries [Array<XTwitterScraper::Models::Delivery>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String]
    end
  end
end
