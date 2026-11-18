# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class SpaceSearchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::SpaceSearchParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Words, hashtags or X search operators, such as from:solana. Live & Upcoming
        # match title words only, without operators. Alias query.
        sig { returns(String) }
        attr_accessor :q

        # Latest finds Spaces in the newest posts. Top finds them in the most engaging
        # posts. Live lists Spaces on air now. Upcoming lists scheduled ones, as X's
        # Spaces search does. Any case works. Aliases result_type, sort_order, type,
        # search_type, product, category & section.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::X::SpaceSearchParams::QueryType::TaggedSymbol
            )
          )
        end
        attr_reader :query_type

        sig do
          params(
            query_type:
              XTwitterScraper::Models::X::SpaceSearchParams::QueryType::OrSymbol
          ).void
        end
        attr_writer :query_type

        # Pagination cursor for collection results. Also read as next_cursor, next_token,
        # pagination_token or continuation_token.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # For Latest & Top, the page size (1-100, default 20). A page can return fewer
        # Spaces. Send 100 to read a search fastest. For Live & Upcoming, the most Spaces
        # a page returns. Its aliases are limit, count, max_results, maxItems, max_items &
        # per_page.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

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
            query_type:
              XTwitterScraper::Models::X::SpaceSearchParams::QueryType::OrSymbol,
            cursor: String,
            page_size: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Words, hashtags or X search operators, such as from:solana. Live & Upcoming
          # match title words only, without operators. Alias query.
          q:,
          # Latest finds Spaces in the newest posts. Top finds them in the most engaging
          # posts. Live lists Spaces on air now. Upcoming lists scheduled ones, as X's
          # Spaces search does. Any case works. Aliases result_type, sort_order, type,
          # search_type, product, category & section.
          query_type: nil,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # For Latest & Top, the page size (1-100, default 20). A page can return fewer
          # Spaces. Send 100 to read a search fastest. For Live & Upcoming, the most Spaces
          # a page returns. Its aliases are limit, count, max_results, maxItems, max_items &
          # per_page.
          page_size: nil,
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
              query_type:
                XTwitterScraper::Models::X::SpaceSearchParams::QueryType::TaggedSymbol,
              cursor: String,
              page_size: Integer,
              fields: String,
              omit: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end

        module QueryType
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::X::SpaceSearchParams::QueryType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LATEST =
            T.let(
              :Latest,
              XTwitterScraper::Models::X::SpaceSearchParams::QueryType::TaggedSymbol
            )
          TOP =
            T.let(
              :Top,
              XTwitterScraper::Models::X::SpaceSearchParams::QueryType::TaggedSymbol
            )
          LIVE =
            T.let(
              :Live,
              XTwitterScraper::Models::X::SpaceSearchParams::QueryType::TaggedSymbol
            )
          UPCOMING =
            T.let(
              :Upcoming,
              XTwitterScraper::Models::X::SpaceSearchParams::QueryType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::SpaceSearchParams::QueryType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
