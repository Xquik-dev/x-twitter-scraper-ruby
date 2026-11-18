# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XGetHashflagsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XGetHashflagsParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Text the hashtag contains, such as football. Case insensitive. A leading hash
      # sign is ignored. Alias query. A post holds at most 280 characters.
      sig { returns(T.nilable(String)) }
      attr_reader :q

      sig { params(q: String).void }
      attr_writer :q

      # Keeps hashflags that run now. Send false to add ended & upcoming ones.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :active_only

      sig { params(active_only: T::Boolean).void }
      attr_writer :active_only

      # Maximum hashflags to return. Omit it for every match. A low credit balance can
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
          q: String,
          active_only: T::Boolean,
          limit: Integer,
          fields: String,
          omit: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Text the hashtag contains, such as football. Case insensitive. A leading hash
        # sign is ignored. Alias query. A post holds at most 280 characters.
        q: nil,
        # Keeps hashflags that run now. Send false to add ended & upcoming ones.
        active_only: nil,
        # Maximum hashflags to return. Omit it for every match. A low credit balance can
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
            q: String,
            active_only: T::Boolean,
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
