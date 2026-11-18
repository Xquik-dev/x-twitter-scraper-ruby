# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#search_places
    class XSearchPlacesParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute q
      #   Place name to search for, such as istanbul. Alias query. Xquik's cap is 4,096
      #   characters.
      #
      #   @return [String]
      required :q, String

      # @!attribute limit
      #   Maximum places to return. Omit it for every place X finds. A low credit balance
      #   can return fewer. Aliases pageSize, count, max_results, maxItems, max_items &
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

      # @!method initialize(q:, limit: nil, fields: nil, omit: nil, request_options: {})
      #   @param q [String] Place name to search for, such as istanbul. Alias query. Xquik's cap is 4,096 characters.
      #
      #   @param limit [Integer] Maximum places to return. Omit it for every place X finds. A low credit balance can return fewer. Aliases pageSize, count, max_results, maxItems, max_items & per_page.
      #
      #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
      #
      #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
