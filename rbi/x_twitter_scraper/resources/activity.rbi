# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class Activity
      # Returns the account's activity log, newest first, with the Activity page's
      # filters. It covers write actions, extractions, monitor changes and events,
      # webhooks, giveaways, media, support, API keys, X account connections and
      # billing. Pick a file format to get the same rows as a CSV, Excel, Markdown, PDF
      # or text file.
      sig do
        params(
          format_:
            XTwitterScraper::Models::ActivityListParams::Format::OrSymbol,
          limit: Integer,
          category: String,
          status: String,
          q: String,
          since: String,
          until_: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T::Array[XTwitterScraper::Models::ActivityLogRow])
      end
      def list(
        # Answer format. JSON by default.
        format_: nil,
        # Most rows to return, with no upper limit. A PDF above 10,000 rows comes as a ZIP
        # of PDF parts.
        limit: nil,
        # Activity group, like the Activity page's tabs. `all` by default, or `actions`,
        # `extractions`, `monitors`, `webhooks` or `billing`.
        category: nil,
        # Comma-separated statuses.
        status: nil,
        # Search text.
        q: nil,
        # Oldest time, ISO 8601.
        since: nil,
        # Newest time, ISO 8601.
        until_: nil,
        request_options: {}
      )
      end

      # Returns the account's activity log, newest first, with the Activity page's
      # filters. It covers write actions, extractions, monitor changes and events,
      # webhooks, giveaways, media, support, API keys, X account connections and
      # billing. Pick a file format to get the same rows as a CSV, Excel, Markdown, PDF
      # or text file.
      sig do
        params(
          format_:
            XTwitterScraper::Models::ActivityExportParams::Format::OrSymbol,
          limit: Integer,
          category: String,
          status: String,
          q: String,
          since: String,
          until_: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def export(
        # Answer format. JSON by default.
        format_:,
        # Most rows to return, with no upper limit. A PDF above 10,000 rows comes as a ZIP
        # of PDF parts.
        limit: nil,
        # Activity group, like the Activity page's tabs. `all` by default, or `actions`,
        # `extractions`, `monitors`, `webhooks` or `billing`.
        category: nil,
        # Comma-separated statuses.
        status: nil,
        # Search text.
        q: nil,
        # Oldest time, ISO 8601.
        since: nil,
        # Newest time, ISO 8601.
        until_: nil,
        request_options: {}
      )
      end

      # Returns 1 activity of the account with its full technical record. It covers
      # every kind of activity the Activity log shows. The record holds the request, the
      # caller, the charge, every timestamp in UTC and related activity. It never holds
      # an API key value, a webhook secret or another account's data. Only a signed-in
      # dashboard session sees an `api_key` record, so an API key or an OAuth app gets
      # 404 for its ID.
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::ActivityRecord)
      end
      def retrieve(
        # Activity ID. It is the id of an Activity log row and the last part of the
        # dashboard's activity page URL.
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
