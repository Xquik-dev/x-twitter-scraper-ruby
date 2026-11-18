# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Activity events from monitored accounts
    class Events
      # Get event
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Resource ID returned by the matching create or list endpoint.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::EventDetail]
      #
      # @see XTwitterScraper::Models::EventRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["events/%1$s", id],
          model: XTwitterScraper::EventDetail,
          options: params[:request_options]
        )
      end

      # List events
      #
      # @overload list(cursor: nil, event_type: nil, keyword_monitor_id: nil, limit: nil, monitor_id: nil, post_monitor_id: nil, request_options: {})
      #
      # @param cursor [String] Previous nextCursor.
      #
      # @param event_type [Symbol, XTwitterScraper::Models::StreamEventType] Filter events by type
      #
      # @param keyword_monitor_id [String] Keyword monitor ID.
      #
      # @param limit [Integer] Maximum number of items to return (1-100, default 50). For paid per-result endpo
      #
      # @param monitor_id [String] Account monitor ID.
      #
      # @param post_monitor_id [String] Post monitor ID. The post_monitor_id alias also works.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::EventListResponse]
      #
      # @see XTwitterScraper::Models::EventListParams
      def list(params = {})
        parsed, options = XTwitterScraper::EventListParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "events",
          query: query.transform_keys(
            event_type: "eventType",
            keyword_monitor_id: "keywordMonitorId",
            monitor_id: "monitorId",
            post_monitor_id: "postMonitorId"
          ),
          model: XTwitterScraper::Models::EventListResponse,
          options: options
        )
      end

      # Streams the account's monitor events as server-sent events, each named by its
      # event type and numbered by its event ID. A reconnect that sends Last-Event-ID
      # first gets every event after that one from the last 30 days, then each new
      # event. Set lookBack to also get events saved late. A connection lasts up to 30
      # minutes and sends a comment every 15 seconds while idle. Keep up to 200 streams
      # open per account. Events and streams cost no credits. Add include=post_metrics
      # to also get post.metrics frames. The first poll sends 1 for each post monitor
      # with a check or a pause. After that, a frame comes when a monitor's saved
      # numbers or status change. These frames carry no ID, so Last-Event-ID never
      # moves.
      #
      # @overload stream(include: nil, look_back: nil, last_event_id: nil, request_options: {})
      #
      # @param include [Symbol, XTwitterScraper::Models::EventStreamParams::Include] Set to post_metrics to also get each post monitor's saved numbers. Any other value is refused.
      #
      # @param look_back [Boolean] Set to true to resume 30 seconds before Last-Event-ID. Events saved late then still arrive. Events you have can arrive again, so skip IDs you've seen. An ID the stream can't find starts 5 minutes back, not 30 days.
      #
      # @param last_event_id [String] The last event ID the client got. The stream first sends every event after it. A value that is not an event ID counts as no header.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Internal::Stream<XTwitterScraper::Models::Event>]
      #
      # @see XTwitterScraper::Models::EventStreamParams
      def stream(params = {})
        parsed, options = XTwitterScraper::Models::EventStreamParams.dump_request(params)
        header_params = {last_event_id: "last-event-id"}
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed.except(*header_params.keys))
        @client.request(
          method: :get,
          path: "events/stream",
          query: query,
          headers: {
            "accept" => "text/event-stream",
            **parsed.slice(*header_params.keys).transform_keys(header_params)
          },
          stream: XTwitterScraper::Internal::Stream,
          model: XTwitterScraper::Models::Event,
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
