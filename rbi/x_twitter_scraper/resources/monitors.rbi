# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    # X account monitoring with 1-second checks
    class Monitors
      # X account monitoring with 1-second checks
      sig { returns(XTwitterScraper::Resources::Monitors::Keywords) }
      attr_reader :keywords

      # Creates an account monitor. Monitors are unlimited. Active monitors check every
      # 1 second and cost 21 credits per hour. Events and webhook deliveries are
      # included. Creation requires available credits for the first hourly charge and
      # username lookup.
      sig do
        params(
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::MonitorCreateResponse)
      end
      def create(
        # Array of event types to subscribe to.
        event_types:,
        # X username (without @)
        username:,
        request_options: {}
      )
      end

      # Get monitor
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Monitor)
      end
      def retrieve(
        # Resource ID returned by the matching create or list endpoint.
        id,
        request_options: {}
      )
      end

      # Update monitor
      sig do
        params(
          id: String,
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          is_active: T::Boolean,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Monitor)
      end
      def update(
        # Resource ID returned by the matching create or list endpoint.
        id,
        # Array of event types to subscribe to.
        event_types: nil,
        is_active: nil,
        request_options: {}
      )
      end

      # List monitors
      sig do
        params(
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::MonitorListResponse)
      end
      def list(request_options: {})
      end

      # Delete monitor
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::MonitorDeactivateResponse)
      end
      def deactivate(
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
