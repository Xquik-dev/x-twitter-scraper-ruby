# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class Monitors
      # X account monitoring with 1-second checks
      class Keywords
        # Creates a keyword monitor. Keyword monitors are unlimited. Active monitors check
        # every 1 second and cost 30 credits per hour. Events and webhook deliveries are
        # included. Creation requires available credits for the first hourly charge.
        sig do
          params(
            event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
            query: String,
            name: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Monitors::KeywordCreateResponse)
        end
        def create(
          # Array of event types to subscribe to.
          event_types:,
          # X search query to monitor. Whitespace is normalized.
          query:,
          # Your own label for the keyword monitor. Its events carry it as monitorName.
          name: nil,
          request_options: {}
        )
        end

        # Get keyword monitor
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Monitors::KeywordRetrieveResponse)
        end
        def retrieve(
          # Resource ID returned by the matching create or list endpoint.
          id,
          request_options: {}
        )
        end

        # Update keyword monitor
        sig do
          params(
            id: String,
            event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
            is_active: T::Boolean,
            name: T.nilable(String),
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Monitors::KeywordUpdateResponse)
        end
        def update(
          # Resource ID returned by the matching create or list endpoint.
          id,
          # Array of event types to subscribe to.
          event_types: nil,
          is_active: nil,
          # New label for the keyword monitor. Send null to remove it.
          name: nil,
          request_options: {}
        )
        end

        # List keyword monitors
        sig do
          params(
            cursor: String,
            limit: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Monitors::KeywordListResponse)
        end
        def list(
          # Previous nextCursor. The after alias also works. Offset pagination is not
          # supported.
          cursor: nil,
          # Maximum items per page, from 1 to 10,000. Default 200. Pass nextCursor as cursor
          # for the next page.
          limit: nil,
          request_options: {}
        )
        end

        # Delete keyword monitor
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::Monitors::KeywordDeactivateResponse
          )
        end
        def deactivate(
          # Resource ID returned by the matching create or list endpoint.
          id,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: XTwitterScraper::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
