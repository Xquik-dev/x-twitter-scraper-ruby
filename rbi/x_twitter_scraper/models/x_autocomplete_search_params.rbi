# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XAutocompleteSearchParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XAutocompleteSearchParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Text typed so far. Start with # for hashtags or $ for cashtags. A # query
      # returns hashtags & the accounts X suggests for it. Its alias is query. Xquik's
      # cap is 4,096 characters.
      sig { returns(String) }
      attr_accessor :q

      # Comma-separated suggestion types from users, topics, hashtags & cashtags. Omit
      # for all. With only hashtags or only cashtags, a query without # or $ still
      # works. Any case works. It allows 66 characters for every choice once with spaces
      # around commas.
      sig { returns(T.nilable(String)) }
      attr_reader :types

      sig { params(types: String).void }
      attr_writer :types

      # Most suggestions to return, from 1 to 100. Default 20. Accounts fill it first,
      # then topics, hashtags & cashtags. A low credit balance can return fewer. Its
      # aliases are pageSize, count, max_results, maxItems, max_items & per_page.
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
          q: String,
          types: String,
          limit: Integer,
          fields: String,
          omit: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Text typed so far. Start with # for hashtags or $ for cashtags. A # query
        # returns hashtags & the accounts X suggests for it. Its alias is query. Xquik's
        # cap is 4,096 characters.
        q:,
        # Comma-separated suggestion types from users, topics, hashtags & cashtags. Omit
        # for all. With only hashtags or only cashtags, a query without # or $ still
        # works. Any case works. It allows 66 characters for every choice once with spaces
        # around commas.
        types: nil,
        # Most suggestions to return, from 1 to 100. Default 20. Accounts fill it first,
        # then topics, hashtags & cashtags. A low credit balance can return fewer. Its
        # aliases are pageSize, count, max_results, maxItems, max_items & per_page.
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
            q: String,
            types: String,
            limit: Integer,
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
