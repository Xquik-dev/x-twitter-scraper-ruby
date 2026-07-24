# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Subscription, billing, and credits
    class Subscribe
      # Create a subscription checkout or billing-management URL only after the user
      # confirms. The request never completes payment by itself.
      #
      # @overload create(tier: nil, request_options: {})
      #
      # @param tier [Symbol, XTwitterScraper::Models::SubscribeCreateParams::Tier] Subscription tier to pre-select.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::SubscribeCreateResponse]
      #
      # @see XTwitterScraper::Models::SubscribeCreateParams
      def create(params = {})
        parsed, options = XTwitterScraper::SubscribeCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "subscribe",
          body: parsed,
          model: XTwitterScraper::Models::SubscribeCreateResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [XTwitterScraper::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
