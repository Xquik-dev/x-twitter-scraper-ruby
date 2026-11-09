# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Trends#list
    class TrendListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute count
      #   Number of trending topics returned (1-50, default 30)
      #
      #   @return [Integer, nil]
      optional :count, Integer

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

      # @!attribute woeid
      #   Region Yahoo WOEID code (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      #
      #   @return [Integer, nil]
      optional :woeid, Integer

      # @!method initialize(count: nil, fields: nil, omit: nil, woeid: nil, request_options: {})
      #   @param count [Integer] Number of trending topics returned (1-50, default 30)
      #
      #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
      #
      #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
      #
      #   @param woeid [Integer] Region Yahoo WOEID code (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
