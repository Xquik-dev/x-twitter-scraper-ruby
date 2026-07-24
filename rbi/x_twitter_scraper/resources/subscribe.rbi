# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    # Subscription, billing, and credits
    class Subscribe
      # Create a subscription checkout or billing-management URL only after the user
      # confirms. The request never completes payment by itself.
      sig do
        params(
          tier: XTwitterScraper::SubscribeCreateParams::Tier::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::SubscribeCreateResponse)
      end
      def create(
        # Subscription tier to pre-select.
        tier: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
