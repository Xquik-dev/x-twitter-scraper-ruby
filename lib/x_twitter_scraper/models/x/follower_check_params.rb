# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Followers#check
      class FollowerCheckParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute source
        #   Source username, @username, or X or Twitter profile URL
        #
        #   @return [String]
        required :source, String

        # @!attribute target
        #   Target username, @username, or X or Twitter profile URL
        #
        #   @return [String]
        required :target, String

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

        # @!method initialize(source:, target:, fields: nil, omit: nil, request_options: {})
        #   @param source [String] Source username, @username, or X or Twitter profile URL
        #
        #   @param target [String] Target username, @username, or X or Twitter profile URL
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        #
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
