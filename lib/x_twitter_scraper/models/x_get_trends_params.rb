# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_trends
    class XGetTrendsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute at
      #   A past time, to read what was trending on Twitter then. Takes an ISO 8601 time,
      #   a date such as 2026-10-13, or Unix seconds. A time without a zone reads as UTC.
      #   It also takes a span back from now, as a number & s, m, h or d. So at=24h reads
      #   what was trending on Twitter yesterday at this hour, on every run of a schedule.
      #   The answer is the stored list nearest that time, with its own time in
      #   capturedAt. History starts 2026-10-13 02:20 UTC. A time over 24 hours from every
      #   stored list answers 400 at no charge.
      #
      #   @return [String, nil]
      optional :at, String

      # @!attribute count
      #   Number of trending topics to return (1-50, default 30)
      #
      #   @return [Integer, nil]
      optional :count, Integer

      # @!attribute country
      #   Country to read trends for, by name or 2-letter code, such as Turkey or TR. Case
      #   insensitive. X can add places, so Xquik takes up to 280 characters, the most a
      #   post holds.
      #
      #   @return [String, nil]
      optional :country, String

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

      # @!attribute location
      #   Town or country to read trends for, by name, such as Istanbul. Case insensitive.
      #   Add country when 2 towns share a name. /x/trends/locations lists every name. X
      #   can add places, so Xquik takes up to 280 characters, the most a post holds.
      #
      #   @return [String, nil]
      optional :location, String

      # @!attribute omit
      #   Fields to drop from each row, comma-separated. It takes the same names as
      #   fields. With fields, it drops from the kept fields. A longer URL fails at the
      #   edge before Xquik reads it.
      #
      #   @return [String, nil]
      optional :omit, String

      # @!attribute woeid
      #   Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      #
      #   @return [Integer, nil]
      optional :woeid, Integer

      # @!method initialize(at: nil, count: nil, country: nil, fields: nil, location: nil, omit: nil, woeid: nil, request_options: {})
      #   @param at [String] A past time, to read what was trending on Twitter then. Takes an ISO 8601 time,
      #
      #   @param count [Integer] Number of trending topics to return (1-50, default 30)
      #
      #   @param country [String] Country to read trends for, by name or 2-letter code, such as Turkey or TR. Case
      #
      #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
      #
      #   @param location [String] Town or country to read trends for, by name, such as Istanbul. Case insensitive.
      #
      #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
      #
      #   @param woeid [Integer] Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
