# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # AI tweet composition, drafts, writing styles, and radar
    class Compose
      # Run one step of Xquik's three-step writing workflow. Compose returns questions
      # and editorial rules. Refine returns goal-specific guidance. Score applies
      # deterministic text checks. It does not predict reach or expose X ranking
      # weights.
      #
      # @overload create(body:, request_options: {})
      #
      # @param body [XTwitterScraper::Models::ComposeCreateParams::Body::ComposePrepareRequest, XTwitterScraper::Models::ComposeCreateParams::Body::ComposeRefineRequest, XTwitterScraper::Models::ComposeCreateParams::Body::ComposeScoreRequest]
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult, XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult, XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult]
      #
      # @see XTwitterScraper::Models::ComposeCreateParams
      def create(params)
        parsed, options = XTwitterScraper::ComposeCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "compose",
          body: parsed[:body],
          model: XTwitterScraper::Models::ComposeCreateResponse,
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
