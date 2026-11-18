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

      sig { returns(XTwitterScraper::Resources::Monitors::Posts) }
      attr_reader :posts

      # Creates an account monitor. Monitors are unlimited. Active monitors check every
      # 1 second and cost 30 credits per hour. Events and webhook deliveries are
      # included. Creation requires available credits for the first hourly charge and
      # username lookup.
      sig do
        params(
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          username: String,
          name: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::MonitorCreateResponse)
      end
      def create(
        # Array of event types to subscribe to.
        event_types:,
        # X username (without @)
        username:,
        # Your label for the monitor. Its events carry it as monitorName. Xquik normalizes
        # whitespace.
        name: nil,
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
          name: T.nilable(String),
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Monitor)
      end
      def update(
        # Resource ID returned by the matching create or list endpoint.
        id,
        # Array of event types to subscribe to.
        event_types: nil,
        is_active: nil,
        # New label for the account monitor. Send null to remove the label.
        name: nil,
        request_options: {}
      )
      end

      # List monitors
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::MonitorListResponse)
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

      # Creates the monitor if it does not exist, or updates it if it does. Send the
      # same call twice & you still have 1 monitor. A new monitor answers 201 & an
      # update answers 200. Both carry `created`, so you know which one ran. Creating
      # needs the credits of the first hour, then costs 30 credits an hour. A stopped
      # monitor turns back on & counts as created. Updating is free & replaces the event
      # types. It changes the name only when you send one.
      sig do
        params(
          username: String,
          event_types: T::Array[XTwitterScraper::Models::EventType::OrSymbol],
          name: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::MonitorUpsertByUsernameResponse)
      end
      def upsert_by_username(
        # The account's X username, with or without @, or its numeric user ID. A number is
        # a user ID, so this call matches the account even after a rename.
        username,
        # Array of event types to subscribe to.
        event_types:,
        # Your label for the monitor. Its events carry it as monitorName. Leave it out to
        # keep the current label, or send null to remove it.
        name: nil,
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
