# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_trend_locations
    class XGetTrendLocationsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute country
      #   Country name or 2-letter code, such as Turkey or TR. Case insensitive. Returns
      #   the country & its towns. X can add places, so Xquik takes up to 280 characters,
      #   the most a post holds.
      #
      #   @return [String, nil]
      optional :country, String

      # @!attribute place_type
      #   Kind of place. Case insensitive. X labels a few towns unknown.
      #
      #   @return [Symbol, XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType, nil]
      optional :place_type, enum: -> { XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType }, api_name: :placeType

      # @!attribute q
      #   Text the location name contains, such as york. Case insensitive. Alias query. X
      #   can add places, so Xquik takes up to 280 characters, the most a post holds.
      #
      #   @return [String, nil]
      optional :q, String

      # @!attribute limit
      #   Maximum locations to return. Omit it for every match. A low credit balance can
      #   return fewer. Aliases pageSize, count, max_results, maxItems, max_items &
      #   per_page.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

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

      # @!method initialize(country: nil, place_type: nil, q: nil, limit: nil, fields: nil, omit: nil, request_options: {})
      #   @param country [String] Country name or 2-letter code, such as Turkey or TR. Case insensitive. Returns the country & its towns. X can add places, so Xquik takes up to 280 characters, the most a post holds.
      #
      #   @param place_type [Symbol, XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType] Kind of place. Case insensitive. X labels a few towns unknown.
      #
      #   @param q [String] Text the location name contains, such as york. Case insensitive. Alias query. X can add places, so Xquik takes up to 280 characters, the most a post holds.
      #
      #   @param limit [Integer] Maximum locations to return. Omit it for every match. A low credit balance can return fewer. Aliases pageSize, count, max_results, maxItems, max_items & per_page.
      #
      #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
      #
      #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      module PlaceType
        extend XTwitterScraper::Internal::Type::Enum

        COUNTRY = :country
        TOWN = :town
        WORLDWIDE = :worldwide
        UNKNOWN = :unknown

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
