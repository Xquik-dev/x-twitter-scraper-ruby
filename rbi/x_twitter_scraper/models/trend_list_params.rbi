# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TrendListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::TrendListParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Number of trending topics returned (1-50, default 30)
      sig { returns(T.nilable(Integer)) }
      attr_reader :count

      sig { params(count: Integer).void }
      attr_writer :count

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

      # Region Yahoo WOEID code (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      sig { returns(T.nilable(Integer)) }
      attr_reader :woeid

      sig { params(woeid: Integer).void }
      attr_writer :woeid

      sig do
        params(
          count: Integer,
          fields: String,
          omit: String,
          woeid: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Number of trending topics returned (1-50, default 30)
        count: nil,
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
        # Region Yahoo WOEID code (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
        woeid: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            count: Integer,
            fields: String,
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
