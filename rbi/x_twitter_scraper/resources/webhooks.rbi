# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    # Webhook endpoint management and delivery
    class Webhooks
      # Create webhook
      sig do
        params(
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          url: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::WebhookCreateResponse)
      end
      def create(
        # Array of event types to subscribe to.
        event_types:,
        # HTTPS URL
        url:,
        request_options: {}
      )
      end

      # Update webhook
      sig do
        params(
          id: String,
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          is_active: T::Boolean,
          url: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Webhook)
      end
      def update(
        # Resource ID returned by the matching create or list endpoint.
        id,
        # Array of event types to subscribe to.
        event_types: nil,
        is_active: nil,
        url: nil,
        request_options: {}
      )
      end

      # List webhooks
      sig do
        params(
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::WebhookListResponse)
      end
      def list(request_options: {})
      end

      # Deactivate webhook
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::WebhookDeactivateResponse)
      end
      def deactivate(
        # Resource ID returned by the matching create or list endpoint.
        id,
        request_options: {}
      )
      end

      # List webhook deliveries
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::WebhookListDeliveriesResponse)
      end
      def list_deliveries(
        # Resource ID returned by the matching create or list endpoint.
        id,
        request_options: {}
      )
      end

      # Test and resume webhook endpoint
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::WebhookResumeResponse)
      end
      def resume(
        # Resource ID returned by the matching create or list endpoint.
        id,
        request_options: {}
      )
      end

      # Test webhook endpoint
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::WebhookTestResponse)
      end
      def test_(
        # Resource ID returned by the matching create or list endpoint.
        id,
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
