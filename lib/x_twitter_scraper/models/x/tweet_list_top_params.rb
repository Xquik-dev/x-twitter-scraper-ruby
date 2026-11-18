# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#list_top
      class TweetListTopParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute metric
        #   What to rank tweets by. Defaults to likes. Singular names work too, such as
        #   like.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::TweetListTopParams::Metric, nil]
        optional :metric, enum: -> { XTwitterScraper::Models::X::TweetListTopParams::Metric }

        # @!attribute window
        #   How far back to look. Defaults to day. Also takes 24h, 7d, 30d, daily, weekly
        #   and monthly.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::TweetListTopParams::Window, nil]
        optional :window, enum: -> { XTwitterScraper::Models::X::TweetListTopParams::Window }

        # @!attribute country
        #   Only tweets from 1 country, as a 2- or 3-letter ISO 3166 code, such as US or
        #   USA. Send country or language, not both.
        #
        #   @return [String, nil]
        optional :country, String

        # @!attribute language
        #   Only tweets in 1 language, as a 2-letter code, such as en. Send country or
        #   language, not both.
        #
        #   @return [String, nil]
        optional :language, String

        # @!attribute cursor
        #   Pagination cursor for collection results. Also read as next_cursor, next_token,
        #   pagination_token or continuation_token.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute page_size
        #   Items per page (1-100, default 20). Source, filters or credits can return fewer.
        #   Follow next_cursor for more pages. Its aliases are limit, count, max_results,
        #   maxItems, max_items & per_page.
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

        # @!method initialize(metric: nil, window: nil, country: nil, language: nil, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #   @param metric [Symbol, XTwitterScraper::Models::X::TweetListTopParams::Metric] What to rank tweets by. Defaults to likes. Singular names work too, such as like.
        #
        #   @param window [Symbol, XTwitterScraper::Models::X::TweetListTopParams::Window] How far back to look. Defaults to day. Also takes 24h, 7d, 30d, daily, weekly and monthly.
        #
        #   @param country [String] Only tweets from 1 country, as a 2- or 3-letter ISO 3166 code, such as US or USA. Send country or language, not both.
        #
        #   @param language [String] Only tweets in 1 language, as a 2-letter code, such as en. Send country or language, not both.
        #
        #   @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        #   @param page_size [Integer] Items per page (1-100, default 20). Source, filters or credits can return fewer. Follow next_cursor for more pages. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

        module Metric
          extend XTwitterScraper::Internal::Type::Enum

          LIKES = :likes
          REPLIES = :replies
          QUOTES = :quotes
          BOOKMARKS = :bookmarks
          SHARES = :shares
          VIEWS = :views

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module Window
          extend XTwitterScraper::Internal::Type::Enum

          DAY = :day
          WEEK = :week
          MONTH = :month

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
