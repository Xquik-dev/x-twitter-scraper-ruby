# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Spaces#search
      class SpaceSearchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute q
        #   Words, hashtags or X search operators, such as from:solana. Live & Upcoming
        #   match title words only, without operators. Alias query.
        #
        #   @return [String]
        required :q, String

        # @!attribute query_type
        #   Latest finds Spaces in the newest posts. Top finds them in the most engaging
        #   posts. Live lists Spaces on air now. Upcoming lists scheduled ones, as X's
        #   Spaces search does. Any case works. Aliases result_type, sort_order, type,
        #   search_type, product, category & section.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::SpaceSearchParams::QueryType, nil]
        optional :query_type, enum: -> { XTwitterScraper::Models::X::SpaceSearchParams::QueryType }, api_name: :queryType

        # @!attribute cursor
        #   Pagination cursor for collection results. Also read as next_cursor, next_token,
        #   pagination_token or continuation_token.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute page_size
        #   For Latest & Top, the page size (1-100, default 20). A page can return fewer
        #   Spaces. Send 100 to read a search fastest. For Live & Upcoming, the most Spaces
        #   a page returns. Its aliases are limit, count, max_results, maxItems, max_items &
        #   per_page.
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

        # @!method initialize(q:, query_type: nil, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #   @param q [String] Words, hashtags or X search operators, such as from:solana. Live & Upcoming match title words only, without operators. Alias query.
        #
        #   @param query_type [Symbol, XTwitterScraper::Models::X::SpaceSearchParams::QueryType] Latest finds Spaces in the newest posts. Top finds them in the most engaging posts. Live lists Spaces on air now. Upcoming lists scheduled ones, as X's Spaces search does. Any case works. Aliases result_type, sort_order, type, search_type, product, category & section.
        #
        #   @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        #   @param page_size [Integer] For Latest & Top, the page size (1-100, default 20). A page can return fewer Spaces. Send 100 to read a search fastest. For Live & Upcoming, the most Spaces a page returns. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

        module QueryType
          extend XTwitterScraper::Internal::Type::Enum

          LATEST = :Latest
          TOP = :Top
          LIVE = :Live
          UPCOMING = :Upcoming

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
