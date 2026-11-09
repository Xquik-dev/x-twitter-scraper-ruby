# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XGetTrendsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::XGetTrendsParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # A past time, to read what was trending on Twitter then. Takes an ISO 8601 time,
      # a date such as 2026-10-13, or Unix seconds. A time without a zone reads as UTC.
      # It also takes a span back from now, as a number & s, m, h or d. So at=24h reads
      # what was trending on Twitter yesterday at this hour, on every run of a schedule.
      # The answer is the stored list nearest that time, with its own time in
      # capturedAt. History starts 2026-10-13 02:20 UTC. A time over 24 hours from every
      # stored list answers 400 at no charge.
      sig { returns(T.nilable(String)) }
      attr_reader :at

      sig { params(at: String).void }
      attr_writer :at

      # Number of trending topics to return (1-50, default 30)
      sig { returns(T.nilable(Integer)) }
      attr_reader :count

      sig { params(count: Integer).void }
      attr_writer :count

      # Country to read trends for, by name or 2-letter code, such as Turkey or TR. Case
      # insensitive. X can add places, so Xquik takes up to 280 characters, the most a
      # post holds.
      sig { returns(T.nilable(String)) }
      attr_reader :country

      sig { params(country: String).void }
      attr_writer :country

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

      # Town or country to read trends for, by name, such as Istanbul. Case insensitive.
      # Add country when 2 towns share a name. /x/trends/locations lists every name. X
      # can add places, so Xquik takes up to 280 characters, the most a post holds.
      sig { returns(T.nilable(String)) }
      attr_reader :location

      sig { params(location: String).void }
      attr_writer :location

      # Fields to drop from each row, comma-separated. It takes the same names as
      # fields. With fields, it drops from the kept fields. A longer URL fails at the
      # edge before Xquik reads it.
      sig { returns(T.nilable(String)) }
      attr_reader :omit

      sig { params(omit: String).void }
      attr_writer :omit

      # Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      sig { returns(T.nilable(Integer)) }
      attr_reader :woeid

      sig { params(woeid: Integer).void }
      attr_writer :woeid

      sig do
        params(
          at: String,
          count: Integer,
          country: String,
          fields: String,
          location: String,
          omit: String,
          woeid: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A past time, to read what was trending on Twitter then. Takes an ISO 8601 time,
        # a date such as 2026-10-13, or Unix seconds. A time without a zone reads as UTC.
        # It also takes a span back from now, as a number & s, m, h or d. So at=24h reads
        # what was trending on Twitter yesterday at this hour, on every run of a schedule.
        # The answer is the stored list nearest that time, with its own time in
        # capturedAt. History starts 2026-10-13 02:20 UTC. A time over 24 hours from every
        # stored list answers 400 at no charge.
        at: nil,
        # Number of trending topics to return (1-50, default 30)
        count: nil,
        # Country to read trends for, by name or 2-letter code, such as Turkey or TR. Case
        # insensitive. X can add places, so Xquik takes up to 280 characters, the most a
        # post holds.
        country: nil,
        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        fields: nil,
        # Town or country to read trends for, by name, such as Istanbul. Case insensitive.
        # Add country when 2 towns share a name. /x/trends/locations lists every name. X
        # can add places, so Xquik takes up to 280 characters, the most a post holds.
        location: nil,
        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        omit: nil,
        # Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
        woeid: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            at: String,
            count: Integer,
            country: String,
            fields: String,
            location: String,
            omit: String,
            woeid: Integer,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
