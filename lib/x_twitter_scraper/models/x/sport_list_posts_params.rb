# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Sports#list_posts
      class SportListPostsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute league
        #   nfl for the NFL or ncaafb for college football, in any case. Another value gets
        #   a free 400 `invalid_league` before X is read.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::SportListPostsParams::League]
        required :league, enum: -> { XTwitterScraper::Models::X::SportListPostsParams::League }

        # @!attribute id
        #   Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them.
        #   Another value gets a free 400 `invalid_game_id` before X is read.
        #
        #   @return [String]
        required :id, String

        # @!attribute query_type
        #   Top for the posts X ranks highest, or Latest for the newest. Any case works, &
        #   so do Relevance & Recency. Alias order or sort. Send the same value with each
        #   cursor.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::SportListPostsParams::QueryType, nil]
        optional :query_type, enum: -> { XTwitterScraper::Models::X::SportListPostsParams::QueryType }, api_name: :queryType

        # @!attribute cursor
        #   Pagination cursor for collection results. Also read as next_cursor, next_token,
        #   pagination_token or continuation_token.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute page_size
        #   Items per page. A page holds up to 10,000, so a larger pageSize gets the largest
        #   page. Default 20. Source, filters or credits can return fewer. Follow
        #   next_cursor for more pages. Its aliases are limit, count, max_results, maxItems,
        #   max_items & per_page.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer, api_name: :pageSize

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

        # @!method initialize(league:, id:, query_type: nil, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #   @param league [Symbol, XTwitterScraper::Models::X::SportListPostsParams::League] nfl for the NFL or ncaafb for college football, in any case. Another value gets a free 400 `invalid_league` before X is read.
        #
        #   @param id [String] Game ID, a number up to 19 digits. GET /x/sports/{league}/games lists them. Another value gets a free 400 `invalid_game_id` before X is read.
        #
        #   @param query_type [Symbol, XTwitterScraper::Models::X::SportListPostsParams::QueryType] Top for the posts X ranks highest, or Latest for the newest. Any case works, & so do Relevance & Recency. Alias order or sort. Send the same value with each cursor.
        #
        #   @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        #   @param page_size [Integer] Items per page. A page holds up to 10,000, so a larger pageSize gets the largest page. Default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

        module League
          extend XTwitterScraper::Internal::Type::Enum

          NFL = :nfl
          NCAAFB = :ncaafb

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module QueryType
          extend XTwitterScraper::Internal::Type::Enum

          TOP = :Top
          LATEST = :Latest

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
