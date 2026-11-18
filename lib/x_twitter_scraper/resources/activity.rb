# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class Activity
      # Returns the account's activity log, newest first, with the Activity page's
      # filters. It covers write actions, extractions, monitor changes and events,
      # webhooks, giveaways, media, support, API keys, X account connections and
      # billing. Pick a file format to get the same rows as a CSV, Excel, Markdown, PDF
      # or text file.
      #
      # @overload list(format_: nil, limit: nil, category: nil, status: nil, q: nil, since: nil, until_: nil, request_options: {})
      #
      # @param format_ [Symbol, XTwitterScraper::Models::ActivityListParams::Format] Answer format. JSON by default.
      #
      # @param limit [Integer] Most rows to return, with no upper limit. A PDF above 10,000 rows comes as a ZIP of PDF parts.
      #
      # @param category [String] Activity group, like the Activity page's tabs. `all` by default, or `actions`, `extractions`, `monitors`, `webhooks` or `billing`.
      #
      # @param status [String] Comma-separated statuses.
      #
      # @param q [String] Search text.
      #
      # @param since [String, Time] Oldest time, ISO 8601.
      #
      # @param until_ [String, Time] Newest time, ISO 8601.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::ActivityListResponse]
      #
      # @see XTwitterScraper::Models::ActivityListParams
      def list(params = {})
        parsed, options = XTwitterScraper::Models::ActivityListParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "activity",
          query: query,
          model: XTwitterScraper::Models::ActivityListResponse,
          options: options
        )
      end

      # Returns the account's activity log, newest first, with the Activity page's
      # filters. It covers write actions, extractions, monitor changes and events,
      # webhooks, giveaways, media, support, API keys, X account connections and
      # billing. Pick a file format to get the same rows as a CSV, Excel, Markdown, PDF
      # or text file.
      #
      # @overload export(format_:, limit: nil, category: nil, status: nil, q: nil, since: nil, until_: nil, request_options: {})
      #
      # @param format_ [Symbol, XTwitterScraper::Models::ActivityExportParams::Format] Answer format. JSON by default.
      #
      # @param limit [Integer] Most rows to return, with no upper limit. A PDF above 10,000 rows comes as a ZIP of PDF parts.
      #
      # @param category [String] Activity group, like the Activity page's tabs. `all` by default, or `actions`, `extractions`, `monitors`, `webhooks` or `billing`.
      #
      # @param status [String] Comma-separated statuses.
      #
      # @param q [String] Search text.
      #
      # @param since [String, Time] Oldest time, ISO 8601.
      #
      # @param until_ [String, Time] Newest time, ISO 8601.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see XTwitterScraper::Models::ActivityExportParams
      def export(params)
        parsed, options = XTwitterScraper::Models::ActivityExportParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "activity",
          query: query,
          headers: {"accept" => "application/octet-stream"},
          model: StringIO,
          options: options
        )
      end

      # Returns 1 activity of the account with its full technical record. It covers
      # every kind of activity the Activity log shows. The record holds the request, the
      # caller, the charge, every timestamp in UTC and related activity. It never holds
      # an API key value, a webhook secret or another account's data. Only a signed-in
      # dashboard session sees an `api_key` record, so an API key or an OAuth app gets
      # 404 for its ID.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Activity ID. It is the id of an Activity log row and the last part of the dashboard's activity page URL.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::ActivityRecord]
      #
      # @see XTwitterScraper::Models::ActivityRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["activity/%1$s", id],
          model: XTwitterScraper::Models::ActivityRecord,
          options: params[:request_options]
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
