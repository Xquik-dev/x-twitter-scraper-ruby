# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Broadcasts
        # Returns 1 X broadcast, the live video X hosts at x.com/i/broadcasts, live or
        # ended. Accepts the broadcast ID or the URL-encoded broadcast URL. Reading a
        # broadcast adds no view to it.
        #
        # @overload retrieve(id, fields: nil, omit: nil, request_options: {})
        #
        # @param id [String] X broadcast ID, or the URL-encoded broadcast URL, such as x.com/i/broadcasts/1nGeLMWbkpaKX.
        #
        # @param fields [String] Fields to keep in each row, comma-separated. Use dots for nested fields, such as author.username. A list keeps the field in each item. Case & underscores do not matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics always stay. An unknown name answers 400 unknown_field with the valid names, before any read. The price stays the same. SDK row types then hold only the named fields. A longer URL fails at the edge before Xquik reads it. Pick only the fields you need with `fields` & `omit`.
        #
        # @param omit [String] Fields to drop from each row, comma-separated. It takes the same names as fields. With fields, it drops from the kept fields. A longer URL fails at the edge before Xquik reads it.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::BroadcastRetrieveResponse]
        #
        # @see XTwitterScraper::Models::X::BroadcastRetrieveParams
        def retrieve(id, params = {})
          parsed, options = XTwitterScraper::Models::X::BroadcastRetrieveParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/broadcasts/%1$s", id],
            query: query,
            model: XTwitterScraper::Models::X::BroadcastRetrieveResponse,
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
