# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # X account monitoring with 1-second checks
    class Monitors
      # X account monitoring with 1-second checks
      # @return [XTwitterScraper::Resources::Monitors::Keywords]
      attr_reader :keywords

      # @return [XTwitterScraper::Resources::Monitors::Posts]
      attr_reader :posts

      # Creates an account monitor. Monitors are unlimited. Active monitors check every
      # 1 second and cost 30 credits per hour. Events and webhook deliveries are
      # included. Creation requires available credits for the first hourly charge and
      # username lookup.
      #
      # @overload create(event_types:, username:, name: nil, request_options: {})
      #
      # @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
      #
      # @param username [String] X username (without @)
      #
      # @param name [String] Your label for the monitor. Its events carry it as monitorName. Xquik normalizes
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::MonitorCreateResponse]
      #
      # @see XTwitterScraper::Models::MonitorCreateParams
      def create(params)
        parsed, options = XTwitterScraper::MonitorCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "monitors",
          body: parsed,
          model: XTwitterScraper::Models::MonitorCreateResponse,
          options: options
        )
      end

      # Get monitor
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Resource ID returned by the matching create or list endpoint.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::Monitor]
      #
      # @see XTwitterScraper::Models::MonitorRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["monitors/%1$s", id],
          model: XTwitterScraper::Monitor,
          options: params[:request_options]
        )
      end

      # Update monitor
      #
      # @overload update(id, event_types: nil, is_active: nil, name: nil, request_options: {})
      #
      # @param id [String] Resource ID returned by the matching create or list endpoint.
      #
      # @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
      #
      # @param is_active [Boolean]
      #
      # @param name [String, nil] New label for the account monitor. Send null to remove the label.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::Monitor]
      #
      # @see XTwitterScraper::Models::MonitorUpdateParams
      def update(id, params = {})
        parsed, options = XTwitterScraper::MonitorUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["monitors/%1$s", id],
          body: parsed,
          model: XTwitterScraper::Monitor,
          options: options
        )
      end

      # List monitors
      #
      # @overload list(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String] Previous nextCursor. The after alias also works. Offset pagination is not suppor
      #
      # @param limit [Integer] Maximum items per page, from 1 to 10,000. Default 200. Pass nextCursor as cursor
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::MonitorListResponse]
      #
      # @see XTwitterScraper::Models::MonitorListParams
      def list(params = {})
        parsed, options = XTwitterScraper::MonitorListParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "monitors",
          query: query,
          model: XTwitterScraper::Models::MonitorListResponse,
          options: options
        )
      end

      # Delete monitor
      #
      # @overload deactivate(id, request_options: {})
      #
      # @param id [String] Resource ID returned by the matching create or list endpoint.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::MonitorDeactivateResponse]
      #
      # @see XTwitterScraper::Models::MonitorDeactivateParams
      def deactivate(id, params = {})
        @client.request(
          method: :delete,
          path: ["monitors/%1$s", id],
          model: XTwitterScraper::Models::MonitorDeactivateResponse,
          options: params[:request_options]
        )
      end

      # Creates the monitor if it does not exist, or updates it if it does. Send the
      # same call twice & you still have 1 monitor. A new monitor answers 201 & an
      # update answers 200. Both carry `created`, so you know which one ran. Creating
      # needs the credits of the first hour, then costs 30 credits an hour. A stopped
      # monitor turns back on & counts as created. Updating is free & replaces the event
      # types. It changes the name only when you send one.
      #
      # @overload upsert_by_username(username, event_types:, name: nil, request_options: {})
      #
      # @param username [String] The account's X username, with or without @, or its numeric user ID. A number is a user ID, so this call matches the account even after a rename.
      #
      # @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
      #
      # @param name [String] Your label for the monitor. Its events carry it as monitorName. Leave it out to keep the current label, or send null to remove it.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::MonitorUpsertByUsernameResponse]
      #
      # @see XTwitterScraper::Models::MonitorUpsertByUsernameParams
      def upsert_by_username(username, params)
        parsed, options = XTwitterScraper::Models::MonitorUpsertByUsernameParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["monitors/username/%1$s", username],
          body: parsed,
          model: XTwitterScraper::Models::MonitorUpsertByUsernameResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [XTwitterScraper::Client]
      def initialize(client:)
        @client = client
        @keywords = XTwitterScraper::Resources::Monitors::Keywords.new(client: client)
        @posts = XTwitterScraper::Resources::Monitors::Posts.new(client: client)
      end
    end
  end
end
