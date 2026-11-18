# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Dm
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

        # Deletes 1 DM from the account's side. The other person keeps it. Success means
        # the DM is gone from the account's conversation. A DM that stays gets 422
        # `x_dm_not_deleted`, and Xquik charges nothing.
        #
        # @overload delete_message(message_id, user_id:, account:, idempotency_key:, prefer: nil, request_options: {})
        #
        # @param message_id [String] DM ID from DM history. Another value gets 400 `invalid_message_id`.
        #
        # @param user_id [String] The other person in the conversation, as a user ID, username with or without @, or URL-encoded profile URL, such as x.com/nasa. Xquik looks up a username's ID first. Anything else gets 400 `invalid_user_id`.
        #
        # @param account [String] Connected X account (@username or ID) that sees the DM.
        #
        # @param idempotency_key [String] Use 1 unique value per intended write. Reuse it only for an identical retry. A matching retry returns the first answer again, with `idempotent: true` added. It keeps the first status, body & Retry-After. It sends nothing to X & charges nothing. While the first request runs, a retry returns 202 & the action. Different input returns 409. Protection lasts at least 90 days. Retrying a write is safe with an idempotency key. A retry with an API key at its monthly budget gets 403 `api_key_budget_reached`.
        #
        # @param prefer [String] A long write answers 202 with a status link, then lands on X. `wait=<seconds>` asks for the answer within that many seconds, up to 85. If the write is still running then, the API answers 202 with Location. Poll Location until `terminal` is true, and don't send the write again.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::WriteActionRetrieveResponse]
        #
        # @see XTwitterScraper::Models::X::DmDeleteMessageParams
        def delete_message(message_id, params)
          parsed, options = XTwitterScraper::Models::X::DmDeleteMessageParams.dump_request(params)
          user_id = parsed.delete(:user_id) do
            raise ArgumentError.new("missing required path argument user_id")
          end
          header_params = {idempotency_key: "idempotency-key", prefer: "prefer"}
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed.except(*header_params.keys))
          @client.request(
            method: :delete,
            path: ["x/dm/%1$s/messages/%2$s", user_id, message_id],
            query: query,
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            model: XTwitterScraper::Models::X::WriteActionRetrieveResponse,
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
