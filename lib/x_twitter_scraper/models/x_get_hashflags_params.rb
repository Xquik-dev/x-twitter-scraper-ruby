# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_hashflags
    class XGetHashflagsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute q
      #   Text the hashtag contains, such as football. Case insensitive. A leading hash
      #   sign is ignored. Alias query. A post holds at most 280 characters.
      #
      #   @return [String, nil]
      optional :q, String

      # @!attribute active_only
      #   Keeps hashflags that run now. Send false to add ended & upcoming ones.
      #
      #   @return [Boolean, nil]
      optional :active_only, XTwitterScraper::Internal::Type::Boolean, api_name: :activeOnly

      # @!attribute limit
      #   Maximum hashflags to return. Omit it for every match. A low credit balance can
      #   return fewer. Aliases pageSize, count, max_results, maxItems, max_items &
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

      # @!method initialize(q: nil, active_only: nil, limit: nil, fields: nil, omit: nil, request_options: {})
      #   @param q [String] Text the hashtag contains, such as football. Case insensitive. A leading hash sign is ignored. Alias query. A post holds at most 280 characters.
      #
      #   @param active_only [Boolean] Keeps hashflags that run now. Send false to add ended & upcoming ones.
      #
      #   @param limit [Integer] Maximum hashflags to return. Omit it for every match. A low credit balance can return fewer. Aliases pageSize, count, max_results, maxItems, max_items & per_page.
      #
      #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
      #
      #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
