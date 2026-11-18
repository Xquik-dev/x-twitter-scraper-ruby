# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_batch_tweets
      class UserRetrieveBatchTweetsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute ids
        #   Comma-separated numeric IDs of the users to read posts from. Xquik reads any
        #   other entry as a username, with or without @, so IDs and usernames can mix.
        #   Xquik ignores duplicates and keeps the first-seen order, IDs before usernames. A
        #   longer URL fails at the edge before Xquik reads it.
        #
        #   @return [String, nil]
        optional :ids, String

        # @!attribute usernames
        #   Comma-separated X usernames, with or without @, or profile links such as
        #   x.com/nasa, in place of ids. A name in another case is the same account. A
        #   number is a user ID. A longer URL fails at the edge before Xquik reads it.
        #
        #   @return [String, nil]
        optional :usernames, String

        # @!attribute page_size
        #   Posts per user (1-300, default 20). A low credit balance can return fewer. Its
        #   aliases are limit, count, max_results, maxItems, max_items & per_page.
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

        # @!method initialize(ids: nil, usernames: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #   @param ids [String] Comma-separated numeric IDs of the users to read posts from. Xquik reads any other entry as a username, with or without @, so IDs and usernames can mix. Xquik ignores duplicates and keeps the first-seen order, IDs before usernames. A longer URL fails at the edge before Xquik reads it.
        #
        #   @param usernames [String] Comma-separated X usernames, with or without @, or profile links such as x.com/nasa, in place of ids. A name in another case is the same account. A number is a user ID. A longer URL fails at the edge before Xquik reads it.
        #
        #   @param page_size [Integer] Posts per user (1-300, default 20). A low credit balance can return fewer. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
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
