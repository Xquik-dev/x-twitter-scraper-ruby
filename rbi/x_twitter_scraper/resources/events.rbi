# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    # Activity events from monitored accounts
    class Events
      # Get event
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::EventDetail)
      end
      def retrieve(
        # Resource ID returned by the matching create or list endpoint.
        id,
        request_options: {}
      )
      end

      # List events
      sig do
        params(
          cursor: String,
          event_type: XTwitterScraper::StreamEventType::OrSymbol,
          keyword_monitor_id: String,
          limit: Integer,
          monitor_id: String,
          post_monitor_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::EventListResponse)
      end
      def list(
        # Previous nextCursor.
        cursor: nil,
        # Filter events by type
        event_type: nil,
        # Keyword monitor ID.
        keyword_monitor_id: nil,
        # Maximum number of items to return (1-100, default 50). For paid per-result
        # endpoints, the returned count may be lower when remaining credits cannot cover
        # the requested page. If zero paid results are affordable, the endpoint returns
        # 402 insufficient_credits.
        limit: nil,
        # Account monitor ID.
        monitor_id: nil,
        # Post monitor ID. The post_monitor_id alias also works.
        post_monitor_id: nil,
        request_options: {}
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
      sig do
        params(
          include:
            XTwitterScraper::Models::EventStreamParams::Include::OrSymbol,
          look_back: T::Boolean,
          last_event_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(
          XTwitterScraper::Internal::Stream[XTwitterScraper::Models::Event]
        )
      end
      def stream(
        # Set to post_metrics to also get each post monitor's saved numbers. Any other
        # value is refused.
        include: nil,
        # Set to true to resume 30 seconds before Last-Event-ID. Events saved late then
        # still arrive. Events you have can arrive again, so skip IDs you've seen. An ID
        # the stream can't find starts 5 minutes back, not 30 days.
        look_back: nil,
        # The last event ID the client got. The stream first sends every event after it. A
        # value that is not an event ID counts as no header.
        last_event_id: nil,
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
