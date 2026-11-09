# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#list
    class WebhookListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute webhooks
      #
      #   @return [Array<XTwitterScraper::Models::Webhook>]
      required :webhooks, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Webhook] }

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(has_more:, webhooks:, next_cursor: nil)
      #   @param has_more [Boolean]
      #   @param webhooks [Array<XTwitterScraper::Models::Webhook>]
      #   @param next_cursor [String]
    end
  end
end
