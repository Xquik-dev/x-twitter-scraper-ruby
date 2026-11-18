# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Spaces
        # Returns public Spaces, each once, with the fields of GET /x/spaces/{id}. Latest
        # & Top find live, scheduled or ended Spaces & accept X search operators. Live &
        # Upcoming find live or scheduled Spaces by title words. Costs 1 credit per Space.
        #
        # @overload search(q:, query_type: nil, cursor: nil, page_size: nil, fields: nil, omit: nil, request_options: {})
        #
        # @param q [String] Words, hashtags or X search operators, such as from:solana. Live & Upcoming match title words only, without operators. Alias query.
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::SpaceSearchParams::QueryType] Latest finds Spaces in the newest posts. Top finds them in the most engaging posts. Live lists Spaces on air now. Upcoming lists scheduled ones, as X's Spaces search does. Any case works. Aliases result_type, sort_order, type, search_type, product, category & section.
        #
        # @param cursor [String] Pagination cursor for collection results. Also read as next_cursor, next_token, pagination_token or continuation_token.
        #
        # @param page_size [Integer] For Latest & Top, the page size (1-100, default 20). A page can return fewer Spaces. Send 100 to read a search fastest. For Live & Upcoming, the most Spaces a page returns. Its aliases are limit, count, max_results, maxItems, max_items & per_page.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::SpaceSearchResponse]
        #
        # @see XTwitterScraper::Models::X::SpaceSearchParams
        def search(params)
          parsed, options = XTwitterScraper::Models::X::SpaceSearchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/spaces/search",
            query: query,
            model: XTwitterScraper::Models::X::SpaceSearchResponse,
            options: options
          )
        end

        # Returns 1 X Space as X shows it, live, scheduled or ended. Accepts the Space ID
        # or the URL-encoded Space URL. A Space X limits to subscribers or a community
        # answers 404.
        #
        # @overload retrieve(id, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] X Space ID, or the URL-encoded Space URL, such as x.com/i/spaces/1OGwblLjnQMKB.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::SpaceRetrieveResponse]
        #
        # @see XTwitterScraper::Models::X::SpaceRetrieveParams
        def retrieve(id, params = {})
          parsed, options = XTwitterScraper::Models::X::SpaceRetrieveParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/spaces/%1$s", id],
            query: query,
            model: XTwitterScraper::Models::X::SpaceRetrieveResponse,
            options: options
          )
        end

        # Returns the recording X plays back once a Space is over, in state Ended or
        # TimedOut. Accepts the Space ID or the URL-encoded Space URL. Check state and
        # isAvailableForReplay with the Space lookup first. A live or scheduled Space
        # answers 409, and a cancelled one 404.
        #
        # @overload retrieve_replay(id, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] X Space ID, or the URL-encoded Space URL, such as x.com/i/spaces/1OGwblLjnQMKB.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::SpaceRetrieveReplayResponse]
        #
        # @see XTwitterScraper::Models::X::SpaceRetrieveReplayParams
        def retrieve_replay(id, params = {})
          parsed, options = XTwitterScraper::Models::X::SpaceRetrieveReplayParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/spaces/%1$s/replay", id],
            query: query,
            model: XTwitterScraper::Models::X::SpaceRetrieveReplayResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
