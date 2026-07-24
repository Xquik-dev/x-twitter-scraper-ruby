# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#resume
    class WebhookResumeResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute status_code
      #
      #   @return [Integer]
      required :status_code, Integer, api_name: :statusCode

      # @!attribute success
      #
      #   @return [Boolean]
      required :success, XTwitterScraper::Internal::Type::Boolean

      # @!attribute webhook
      #   Webhook endpoint registered to receive event deliveries.
      #
      #   @return [XTwitterScraper::Models::Webhook]
      required :webhook, -> { XTwitterScraper::Webhook }

      # @!method initialize(status_code:, success:, webhook:)
      #   @param status_code [Integer]
      #
      #   @param success [Boolean]
      #
      #   @param webhook [XTwitterScraper::Models::Webhook] Webhook endpoint registered to receive event deliveries.
    end
  end
end
