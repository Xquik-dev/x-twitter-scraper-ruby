# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Dm
        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::DmRetrieveHistoryParams} for more details.
        #
        # Get DM conversation history
        #
        # @overload retrieve_history(user_id, account:, cursor: nil, max_id: nil, request_options: {})
        #
        # @param user_id [String] Target user ID
        #
        # @param account [String] X handle (without the `@` prefix) of the connected X account used to read the co
        #
        # @param cursor [String] Pagination cursor for DM history
        #
        # @param max_id [String] Legacy pagination cursor (backward compat)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::DmRetrieveHistoryResponse]
        #
        # @see XTwitterScraper::Models::X::DmRetrieveHistoryParams
        def retrieve_history(user_id, params)
          parsed, options = XTwitterScraper::X::DmRetrieveHistoryParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/dm/%1$s/history", user_id],
            query: query.transform_keys(max_id: "maxId"),
            model: XTwitterScraper::Models::X::DmRetrieveHistoryResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::DmSendParams} for more details.
        #
        # Send direct message
        #
        # @overload send_(user_id, account:, text:, idempotency_key:, media_ids: nil, request_options: {})
        #
        # @param user_id [String] Path param: Recipient user ID
        #
        # @param account [String] Body param: X account (@username or ID) sending the DM
        #
        # @param text [String] Body param
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param media_ids [Array<String>] Body param: Optional array containing exactly 1 uploaded media ID.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::DmSendResponse]
        #
        # @see XTwitterScraper::Models::X::DmSendParams
        def send_(user_id, params)
          parsed, options = XTwitterScraper::X::DmSendParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :post,
            path: ["x/dm/%1$s", user_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: XTwitterScraper::Models::X::DmSendResponse,
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
