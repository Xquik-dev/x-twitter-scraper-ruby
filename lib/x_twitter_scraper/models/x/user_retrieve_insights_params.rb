# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_insights
      class UserRetrieveInsightsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #   User ID, username with or without @, or URL-encoded profile URL, such as
        #   x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a
        #   username's ID before sending. Anything else gets 400 `invalid_user_id`.
        #
        #   @return [String]
        required :id, String

        # @!attribute limit
        #   Recent posts to read for the averages and rates. The read stops at this count,
        #   at the account's oldest post or after about 40 seconds. `sample.read` says how
        #   many it read, and `sample.posts` how many of those the averages used.
        #   `pageSize`, `count`, `max_results`, `maxItems`, `max_items` & `per_page` are
        #   accepted aliases.
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

        # @!method initialize(id:, limit: nil, fields: nil, omit: nil, request_options: {})
        #   @param id [String] User ID, username with or without @, or URL-encoded profile URL, such as x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a username's ID before sending. Anything else gets 400 `invalid_user_id`.
        #
        #   @param limit [Integer] Recent posts to read for the averages and rates. The read stops at this count, at the account's oldest post or after about 40 seconds. `sample.read` says how many it read, and `sample.posts` how many of those the averages used. `pageSize`, `count`, `max_results`, `maxItems`, `max_items` & `per_page` are accepted aliases.
        #
        #   @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        #   @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
