# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class Monitors
      class Posts
        # Stops 1 post monitor, then removes its stored events & metric history in bounded
        # batches. Poll statusUrl until the monitor returns 404.
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Monitors::PostDeleteResponse)
        end
        def delete(
          # Resource ID returned by the matching create or list endpoint.
          id,
          request_options: {}
        )
        end

        # Returns post monitors with each post's 6 metrics, their current values & gains
        # since tracking began.
        sig do
          params(
            limit: Integer,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Monitors::PostListResponse)
        end
        def list(
          # Maximum items per page, from 1 to 10,000. Default 200. Pass nextCursor as cursor
          # for the next page.
          limit: nil,
          # Previous nextCursor. The after alias also works. Offset pagination is not
          # supported.
          cursor: nil,
          request_options: {}
        )
        end

        # Returns 1 post monitor with its post & the 6 metrics, each with its current
        # value & gain since tracking began.
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PostMonitor)
        end
        def retrieve(
          # Resource ID returned by the matching create or list endpoint.
          id,
          request_options: {}
        )
        end

        # Returns 1 bucket per hour with each metric's value at the hour's end & its gain
        # over that hour. The last bucket is the current hour. Hours before tracking began
        # carry the starting values with a gain of 0.
        sig do
          params(
            id: String,
            hours: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PostMonitorMetrics)
        end
        def retrieve_metrics(
          # Resource ID returned by the matching create or list endpoint.
          id,
          # Hours to return, from 1 to 17,520.
          hours: nil,
          request_options: {}
        )
        end

        # Updates a post monitor's label, event types or active state. Turning a paused
        # monitor on reads the post first, & answers 409 while X hides it.
        sig do
          params(
            id: String,
            event_types:
              T::Array[XTwitterScraper::Models::PostEventType::OrSymbol],
            is_active: T::Boolean,
            name: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PostMonitor)
        end
        def update(
          # Resource ID returned by the matching create or list endpoint.
          id,
          # Post event types to send. Without it, a monitor sends new replies, new quotes,
          # like & retweet changes, edits & deletion.
          event_types: nil,
          is_active: nil,
          # New label for the post monitor. Send null to remove it.
          name: nil,
          request_options: {}
        )
        end

        # Creates a monitor for 1 X post. It tracks replies, quotes, edits, deletion & 6
        # metrics, for 30 credits an hour with events & webhook deliveries included. That
        # hourly price is a monitor's only charge. Creation needs the credits of the first
        # hour & reads the post once.
        sig do
          params(
            post: String,
            name: String,
            event_types:
              T::Array[XTwitterScraper::Models::PostEventType::OrSymbol],
            is_active: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PostMonitor)
        end
        def create(
          # Post link or ID. x.com, twitter.com, mobile & /i/web/status/ links work with any
          # query string.
          post:,
          # Your own label for the post monitor. Its events carry it as monitorName.
          name: nil,
          # Post event types to send. Without it, a monitor sends new replies, new quotes,
          # like & retweet changes, edits & deletion.
          event_types: nil,
          # Send false to create the monitor paused. A paused monitor reads nothing & costs
          # nothing until a PATCH sets isActive to true.
          is_active: nil,
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
