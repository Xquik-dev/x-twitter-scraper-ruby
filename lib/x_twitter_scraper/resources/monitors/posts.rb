# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class Monitors
      class Posts
        # Stops 1 post monitor, then removes its stored events & metric history in bounded
        # batches. Poll statusUrl until the monitor returns 404.
        #
        # @overload delete(id, request_options: {})
        #
        # @param id [String] Resource ID returned by the matching create or list endpoint.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Monitors::PostDeleteResponse]
        #
        # @see XTwitterScraper::Models::Monitors::PostDeleteParams
        def delete(id, params = {})
          @client.request(
            method: :delete,
            path: ["monitors/posts/%1$s", id],
            model: XTwitterScraper::Models::Monitors::PostDeleteResponse,
            options: params[:request_options]
          )
        end

        # Returns post monitors with each post's 6 metrics, their current values & gains
        # since tracking began.
        #
        # @overload list(limit: nil, cursor: nil, request_options: {})
        #
        # @param limit [Integer] Maximum items per page, from 1 to 10,000. Default 200. Pass nextCursor as cursor for the next page.
        #
        # @param cursor [String] Previous nextCursor. The after alias also works. Offset pagination is not supported.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::Monitors::PostListResponse]
        #
        # @see XTwitterScraper::Models::Monitors::PostListParams
        def list(params = {})
          parsed, options = XTwitterScraper::Models::Monitors::PostListParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "monitors/posts",
            query: query,
            model: XTwitterScraper::Models::Monitors::PostListResponse,
            options: options
          )
        end

        # Returns 1 post monitor with its post & the 6 metrics, each with its current
        # value & gain since tracking began.
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Resource ID returned by the matching create or list endpoint.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PostMonitor]
        #
        # @see XTwitterScraper::Models::Monitors::PostRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["monitors/posts/%1$s", id],
            model: XTwitterScraper::Models::PostMonitor,
            options: params[:request_options]
          )
        end

        # Returns 1 bucket per hour with each metric's value at the hour's end & its gain
        # over that hour. The last bucket is the current hour. Hours before tracking began
        # carry the starting values with a gain of 0.
        #
        # @overload retrieve_metrics(id, hours: nil, request_options: {})
        #
        # @param id [String] Resource ID returned by the matching create or list endpoint.
        #
        # @param hours [Integer] Hours to return, from 1 to 17,520.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PostMonitorMetrics]
        #
        # @see XTwitterScraper::Models::Monitors::PostRetrieveMetricsParams
        def retrieve_metrics(id, params = {})
          parsed, options = XTwitterScraper::Models::Monitors::PostRetrieveMetricsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["monitors/posts/%1$s/metrics", id],
            query: query,
            model: XTwitterScraper::Models::PostMonitorMetrics,
            options: options
          )
        end

        # Updates a post monitor's label, event types or active state. Turning a paused
        # monitor on reads the post first, & answers 409 while X hides it.
        #
        # @overload update(id, event_types: nil, is_active: nil, name: nil, request_options: {})
        #
        # @param id [String] Resource ID returned by the matching create or list endpoint.
        #
        # @param event_types [Array<Symbol, XTwitterScraper::Models::PostEventType>] Post event types to send. Without it, a monitor sends new replies, new quotes, like & retweet changes, edits & deletion.
        #
        # @param is_active [Boolean]
        #
        # @param name [String] New label for the post monitor. Send null to remove it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PostMonitor]
        #
        # @see XTwitterScraper::Models::Monitors::PostUpdateParams
        def update(id, params = {})
          parsed, options = XTwitterScraper::Models::Monitors::PostUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: ["monitors/posts/%1$s", id],
            body: parsed,
            model: XTwitterScraper::Models::PostMonitor,
            options: options
          )
        end

        # Creates a monitor for 1 X post. It tracks replies, quotes, edits, deletion & 6
        # metrics, for 30 credits an hour with events & webhook deliveries included. That
        # hourly price is a monitor's only charge. Creation needs the credits of the first
        # hour & reads the post once.
        #
        # @overload create(post:, name: nil, event_types: nil, is_active: nil, request_options: {})
        #
        # @param post [String] Post link or ID. x.com, twitter.com, mobile & /i/web/status/ links work with any query string.
        #
        # @param name [String] Your own label for the post monitor. Its events carry it as monitorName.
        #
        # @param event_types [Array<Symbol, XTwitterScraper::Models::PostEventType>] Post event types to send. Without it, a monitor sends new replies, new quotes, like & retweet changes, edits & deletion.
        #
        # @param is_active [Boolean] Send false to create the monitor paused. A paused monitor reads nothing & costs nothing until a PATCH sets isActive to true.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PostMonitor]
        #
        # @see XTwitterScraper::Models::Monitors::PostCreateParams
        def create(params)
          parsed, options = XTwitterScraper::Models::Monitors::PostCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "monitors/posts",
            body: parsed,
            model: XTwitterScraper::Models::PostMonitor,
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
end
