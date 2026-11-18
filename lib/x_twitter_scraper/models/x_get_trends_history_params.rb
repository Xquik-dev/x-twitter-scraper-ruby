# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_trends_history
    class XGetTrendsHistoryParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute woeid
      #   WOEID of the place, such as 1 for Worldwide or 23424969 for Turkey. It wins over
      #   country & location. /x/trends/locations lists every WOEID.
      #
      #   @return [Integer, nil]
      optional :woeid, Integer

      # @!attribute country
      #   Country to read trends history for, by name or 2-letter code, such as Turkey or
      #   TR. Case insensitive. X can add places, so Xquik takes up to 280 characters, the
      #   most a post holds.
      #
      #   @return [String, nil]
      optional :country, String

      # @!attribute location
      #   Town or country to read trends history for, by name, such as Istanbul. Case
      #   insensitive. Add country when 2 towns share a name. /x/trends/locations lists
      #   every name. X can add places, so Xquik takes up to 280 characters, the most a
      #   post holds.
      #
      #   @return [String, nil]
      optional :location, String

      # @!attribute from
      #   Start of the range. Takes an ISO 8601 time, a date such as 2026-10-13, or Unix
      #   seconds. A time without a zone reads as UTC. It also takes a span back from now,
      #   as a number & s, m, h or d, so from=7d reads the last 7 days. Defaults to 24
      #   hours before to. History starts 2026-10-13 02:20 UTC, and a range that begins
      #   earlier returns the stored part. A range that ends before the first stored list
      #   answers 404 at no charge. Alias sinceTime.
      #
      #   @return [String, nil]
      optional :from, String

      # @!attribute to
      #   End of the range, which it leaves out. Takes the forms of from, so from=2d with
      #   to=1d reads the day before the last 24 hours. Defaults to now. Alias untilTime.
      #
      #   @return [String, nil]
      optional :to, String

      # @!attribute every
      #   Step between 2 returned lists, as a number & m, h or d, such as 15m, 1h or 1d. A
      #   step under 5m returns every stored list.
      #
      #   @return [String, nil]
      optional :every, String

      # @!attribute count
      #   Trends to return in each list.
      #
      #   @return [Integer, nil]
      optional :count, Integer

      # @!attribute limit
      #   Maximum lists 1 request returns & charges. A wider range gives a next_cursor for
      #   the next lists. A low credit balance can return fewer.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute cursor
      #   The next_cursor of the page before, for the next lists. It keeps the time of the
      #   first request, so a range of spans stays the same on every page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute fields
      #   Fields to keep in each row, comma-separated. Use dots for nested fields, such as
      #   author.username. A list keeps the field in each item. Case & underscores do not
      #   matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
      #   always stay. An unknown name answers 400 unknown_field with the valid names,
      #   before any read. The price stays the same. SDK row types then hold only the
      #   named fields. A longer URL fails at the edge before Xquik reads it. Pick only
      #   the fields you need with `fields` & `omit`.
      #
      #   @return [String, nil]
      optional :fields, String

      # @!attribute omit
      #   Fields to drop from each row, comma-separated. It takes the same names as
      #   fields. With fields, it drops from the kept fields. A longer URL fails at the
      #   edge before Xquik reads it.
      #
      #   @return [String, nil]
      optional :omit, String

      # @!method initialize(woeid: nil, country: nil, location: nil, from: nil, to: nil, every: nil, count: nil, limit: nil, cursor: nil, fields: nil, omit: nil, request_options: {})
      #   @param woeid [Integer] WOEID of the place, such as 1 for Worldwide or 23424969 for Turkey. It wins over country & location. /x/trends/locations lists every WOEID.
      #
      #   @param country [String] Country to read trends history for, by name or 2-letter code, such as Turkey or TR. Case insensitive. X can add places, so Xquik takes up to 280 characters, the most a post holds.
      #
      #   @param location [String] Town or country to read trends history for, by name, such as Istanbul. Case insensitive. Add country when 2 towns share a name. /x/trends/locations lists every name. X can add places, so Xquik takes up to 280 characters, the most a post holds.
      #
      #   @param from [String] Start of the range. Takes an ISO 8601 time, a date such as 2026-10-13, or Unix seconds. A time without a zone reads as UTC. It also takes a span back from now, as a number & s, m, h or d, so from=7d reads the last 7 days. Defaults to 24 hours before to. History starts 2026-10-13 02:20 UTC, and a range that begins earlier returns the stored part. A range that ends before the first stored list answers 404 at no charge. Alias sinceTime.
      #
      #   @param to [String] End of the range, which it leaves out. Takes the forms of from, so from=2d with to=1d reads the day before the last 24 hours. Defaults to now. Alias untilTime.
      #
      #   @param every [String] Step between 2 returned lists, as a number & m, h or d, such as 15m, 1h or 1d. A step under 5m returns every stored list.
      #
      #   @param count [Integer] Trends to return in each list.
      #
      #   @param limit [Integer] Maximum lists 1 request returns & charges. A wider range gives a next_cursor for the next lists. A low credit balance can return fewer.
      #
      #   @param cursor [String] The next_cursor of the page before, for the next lists. It keeps the time of the first request, so a range of spans stays the same on every page.
      #
      #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
      #
      #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
