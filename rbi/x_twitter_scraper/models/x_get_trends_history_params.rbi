# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XGetTrendsHistoryParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XGetTrendsHistoryParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # WOEID of the place, such as 1 for Worldwide or 23424969 for Turkey. It wins over
      # country & location. /x/trends/locations lists every WOEID.
      sig { returns(T.nilable(Integer)) }
      attr_reader :woeid

      sig { params(woeid: Integer).void }
      attr_writer :woeid

      # Country to read trends history for, by name or 2-letter code, such as Turkey or
      # TR. Case insensitive. X can add places, so Xquik takes up to 280 characters, the
      # most a post holds.
      sig { returns(T.nilable(String)) }
      attr_reader :country

      sig { params(country: String).void }
      attr_writer :country

      # Town or country to read trends history for, by name, such as Istanbul. Case
      # insensitive. Add country when 2 towns share a name. /x/trends/locations lists
      # every name. X can add places, so Xquik takes up to 280 characters, the most a
      # post holds.
      sig { returns(T.nilable(String)) }
      attr_reader :location

      sig { params(location: String).void }
      attr_writer :location

      # Start of the range. Takes an ISO 8601 time, a date such as 2026-10-13, or Unix
      # seconds. A time without a zone reads as UTC. It also takes a span back from now,
      # as a number & s, m, h or d, so from=7d reads the last 7 days. Defaults to 24
      # hours before to. History starts 2026-10-13 02:20 UTC, and a range that begins
      # earlier returns the stored part. A range that ends before the first stored list
      # answers 404 at no charge. Alias sinceTime.
      sig { returns(T.nilable(String)) }
      attr_reader :from

      sig { params(from: String).void }
      attr_writer :from

      # End of the range, which it leaves out. Takes the forms of from, so from=2d with
      # to=1d reads the day before the last 24 hours. Defaults to now. Alias untilTime.
      sig { returns(T.nilable(String)) }
      attr_reader :to

      sig { params(to: String).void }
      attr_writer :to

      # Step between 2 returned lists, as a number & m, h or d, such as 15m, 1h or 1d. A
      # step under 5m returns every stored list.
      sig { returns(T.nilable(String)) }
      attr_reader :every

      sig { params(every: String).void }
      attr_writer :every

      # Trends to return in each list.
      sig { returns(T.nilable(Integer)) }
      attr_reader :count

      sig { params(count: Integer).void }
      attr_writer :count

      # Maximum lists 1 request returns & charges. A wider range gives a next_cursor for
      # the next lists. A low credit balance can return fewer.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # The next_cursor of the page before, for the next lists. It keeps the time of the
      # first request, so a range of spans stays the same on every page.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
      # author.username. A list keeps the field in each item. Case & underscores do not
      # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
      # always stay. An unknown name answers 400 unknown_field with the valid names,
      # before any read. The price stays the same. SDK row types then hold only the
      # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
      # the fields you need with `fields` & `omit`.
      sig { returns(T.nilable(String)) }
      attr_reader :fields

      sig { params(fields: String).void }
      attr_writer :fields

      # Fields to drop from each row, comma-separated. It takes the same names as
      # fields. With fields, it drops from the kept fields. A longer URL fails at the
      # edge before Xquik reads it.
      sig { returns(T.nilable(String)) }
      attr_reader :omit

      sig { params(omit: String).void }
      attr_writer :omit

      sig do
        params(
          woeid: Integer,
          country: String,
          location: String,
          from: String,
          to: String,
          every: String,
          count: Integer,
          limit: Integer,
          cursor: String,
          fields: String,
          omit: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # WOEID of the place, such as 1 for Worldwide or 23424969 for Turkey. It wins over
        # country & location. /x/trends/locations lists every WOEID.
        woeid: nil,
        # Country to read trends history for, by name or 2-letter code, such as Turkey or
        # TR. Case insensitive. X can add places, so Xquik takes up to 280 characters, the
        # most a post holds.
        country: nil,
        # Town or country to read trends history for, by name, such as Istanbul. Case
        # insensitive. Add country when 2 towns share a name. /x/trends/locations lists
        # every name. X can add places, so Xquik takes up to 280 characters, the most a
        # post holds.
        location: nil,
        # Start of the range. Takes an ISO 8601 time, a date such as 2026-10-13, or Unix
        # seconds. A time without a zone reads as UTC. It also takes a span back from now,
        # as a number & s, m, h or d, so from=7d reads the last 7 days. Defaults to 24
        # hours before to. History starts 2026-10-13 02:20 UTC, and a range that begins
        # earlier returns the stored part. A range that ends before the first stored list
        # answers 404 at no charge. Alias sinceTime.
        from: nil,
        # End of the range, which it leaves out. Takes the forms of from, so from=2d with
        # to=1d reads the day before the last 24 hours. Defaults to now. Alias untilTime.
        to: nil,
        # Step between 2 returned lists, as a number & m, h or d, such as 15m, 1h or 1d. A
        # step under 5m returns every stored list.
        every: nil,
        # Trends to return in each list.
        count: nil,
        # Maximum lists 1 request returns & charges. A wider range gives a next_cursor for
        # the next lists. A low credit balance can return fewer.
        limit: nil,
        # The next_cursor of the page before, for the next lists. It keeps the time of the
        # first request, so a range of spans stays the same on every page.
        cursor: nil,
        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        fields: nil,
        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        omit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            woeid: Integer,
            country: String,
            location: String,
            from: String,
            to: String,
            every: String,
            count: Integer,
            limit: Integer,
            cursor: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
