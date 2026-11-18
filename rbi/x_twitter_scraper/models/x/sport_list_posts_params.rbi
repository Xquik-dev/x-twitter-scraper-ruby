# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class SportListPostsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::SportListPostsParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # nfl for the NFL or ncaafb for college football, in any case. Another value gets
        # a free 400 `invalid_league` before X is read.
        sig do
          returns(
            XTwitterScraper::Models::X::SportListPostsParams::League::TaggedSymbol
          )
        end
        attr_reader :league

        sig do
          params(
            league:
              XTwitterScraper::Models::X::SportListPostsParams::League::OrSymbol
          ).void
        end
        attr_writer :league

        # Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them.
        # Another value gets a free 400 `invalid_game_id` before X is read.
        sig { returns(String) }
        attr_accessor :id

        # Top for the posts X ranks highest, or Latest for the newest. Any case works, &
        # so do Relevance & Recency. Alias order or sort. Send the same value with each
        # cursor.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::X::SportListPostsParams::QueryType::TaggedSymbol
            )
          )
        end
        attr_reader :query_type

        sig do
          params(
            query_type:
              XTwitterScraper::Models::X::SportListPostsParams::QueryType::OrSymbol
          ).void
        end
        attr_writer :query_type

        # Pagination cursor for collection results. Also read as next_cursor, next_token,
        # pagination_token or continuation_token.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Items per page. A page holds up to 10,000, so a larger pageSize gets the largest
        # page. Default 20. Source, filters or credits can return fewer. Follow
        # next_cursor for more pages. Its aliases are limit, count, max_results, maxItems,
        # max_items & per_page.
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
            league:
              XTwitterScraper::Models::X::SportListPostsParams::League::OrSymbol,
            id: String,
            query_type:
              XTwitterScraper::Models::X::SportListPostsParams::QueryType::OrSymbol,
            cursor: String,
            page_size: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # nfl for the NFL or ncaafb for college football, in any case. Another value gets
          # a free 400 `invalid_league` before X is read.
          league:,
          # Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them.
          # Another value gets a free 400 `invalid_game_id` before X is read.
          id:,
          # Top for the posts X ranks highest, or Latest for the newest. Any case works, &
          # so do Relevance & Recency. Alias order or sort. Send the same value with each
          # cursor.
          query_type: nil,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Items per page. A page holds up to 10,000, so a larger pageSize gets the largest
          # page. Default 20. Source, filters or credits can return fewer. Follow
          # next_cursor for more pages. Its aliases are limit, count, max_results, maxItems,
          # max_items & per_page.
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
              league:
                XTwitterScraper::Models::X::SportListPostsParams::League::TaggedSymbol,
              id: String,
              query_type:
                XTwitterScraper::Models::X::SportListPostsParams::QueryType::TaggedSymbol,
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

        module League
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::X::SportListPostsParams::League
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NFL =
            T.let(
              :nfl,
              XTwitterScraper::Models::X::SportListPostsParams::League::TaggedSymbol
            )
          NCAAFB =
            T.let(
              :ncaafb,
              XTwitterScraper::Models::X::SportListPostsParams::League::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::SportListPostsParams::League::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module QueryType
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::X::SportListPostsParams::QueryType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOP =
            T.let(
              :Top,
              XTwitterScraper::Models::X::SportListPostsParams::QueryType::TaggedSymbol
            )
          LATEST =
            T.let(
              :Latest,
              XTwitterScraper::Models::X::SportListPostsParams::QueryType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::X::SportListPostsParams::QueryType::TaggedSymbol
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
