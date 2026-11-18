# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XGetTrendLocationsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XGetTrendLocationsParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Country name or 2-letter code, such as Turkey or TR. Case insensitive. Returns
      # the country & its towns. X can add places, so Xquik takes up to 280 characters,
      # the most a post holds.
      sig { returns(T.nilable(String)) }
      attr_reader :country

      sig { params(country: String).void }
      attr_writer :country

      # Kind of place. Case insensitive. X labels a few towns unknown.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType::TaggedSymbol
          )
        )
      end
      attr_reader :place_type

      sig do
        params(
          place_type:
            XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType::OrSymbol
        ).void
      end
      attr_writer :place_type

      # Text the location name contains, such as york. Case insensitive. Alias query. X
      # can add places, so Xquik takes up to 280 characters, the most a post holds.
      sig { returns(T.nilable(String)) }
      attr_reader :q

      sig { params(q: String).void }
      attr_writer :q

      # Maximum locations to return. Omit it for every match. A low credit balance can
      # return fewer. Aliases pageSize, count, max_results, maxItems, max_items &
      # per_page.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

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
          country: String,
          place_type:
            XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType::OrSymbol,
          q: String,
          limit: Integer,
          fields: String,
          omit: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Country name or 2-letter code, such as Turkey or TR. Case insensitive. Returns
        # the country & its towns. X can add places, so Xquik takes up to 280 characters,
        # the most a post holds.
        country: nil,
        # Kind of place. Case insensitive. X labels a few towns unknown.
        place_type: nil,
        # Text the location name contains, such as york. Case insensitive. Alias query. X
        # can add places, so Xquik takes up to 280 characters, the most a post holds.
        q: nil,
        # Maximum locations to return. Omit it for every match. A low credit balance can
        # return fewer. Aliases pageSize, count, max_results, maxItems, max_items &
        # per_page.
        limit: nil,
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
            country: String,
            place_type:
              XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType::TaggedSymbol,
            q: String,
            limit: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      module PlaceType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COUNTRY =
          T.let(
            :country,
            XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType::TaggedSymbol
          )
        TOWN =
          T.let(
            :town,
            XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType::TaggedSymbol
          )
        WORLDWIDE =
          T.let(
            :worldwide,
            XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType::TaggedSymbol
          )
        UNKNOWN =
          T.let(
            :unknown,
            XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::XGetTrendLocationsParams::PlaceType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
