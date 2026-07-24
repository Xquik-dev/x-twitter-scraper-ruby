# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    # AI tweet composition, drafts, writing styles, and radar
    class Compose
      # Run one step of Xquik's three-step writing workflow. Compose returns questions
      # and editorial rules. Refine returns goal-specific guidance. Score applies
      # deterministic text checks. It does not predict reach or expose X ranking
      # weights.
      sig do
        params(
          body:
            T.any(
              XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::OrHash,
              XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::OrHash,
              XTwitterScraper::ComposeCreateParams::Body::ComposeScoreRequest::OrHash
            ),
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ComposeCreateResponse::Variants)
      end
      def create(body:, request_options: {})
      end

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
