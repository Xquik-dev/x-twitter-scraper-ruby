# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Dm#delete_message
      class DmDeleteMessageParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute user_id
        #   The other person in the conversation, as a user ID, username with or without @,
        #   or URL-encoded profile URL, such as x.com/nasa. Xquik looks up a username's ID
        #   first. Anything else gets 400 `invalid_user_id`.
        #
        #   @return [String]
        required :user_id, String

        # @!attribute message_id
        #   DM ID from DM history. Another value gets 400 `invalid_message_id`.
        #
        #   @return [String]
        required :message_id, String

        # @!attribute account
        #   Connected X account (@username or ID) that sees the DM.
        #
        #   @return [String]
        required :account, String

        # @!attribute idempotency_key
        #   Use 1 unique value per intended write. Reuse it only for an identical retry. A
        #   matching retry returns the first answer again, with `idempotent: true` added. It
        #   keeps the first status, body & Retry-After. It sends nothing to X & charges
        #   nothing. While the first request runs, a retry returns 202 & the action.
        #   Different input returns 409. Protection lasts at least 90 days. Retrying a write
        #   is safe with an idempotency key. A retry with an API key at its monthly budget
        #   gets 403 `api_key_budget_reached`.
        #
        #   @return [String]
        required :idempotency_key, String

        # @!attribute prefer
        #   A long write answers 202 with a status link, then lands on X. `wait=<seconds>`
        #   asks for the answer within that many seconds, up to 85. If the write is still
        #   running then, the API answers 202 with Location. Poll Location until `terminal`
        #   is true, and don't send the write again.
        #
        #   @return [String, nil]
        optional :prefer, String

        # @!method initialize(user_id:, message_id:, account:, idempotency_key:, prefer: nil, request_options: {})
        #   @param user_id [String] The other person in the conversation, as a user ID, username with or without @, or URL-encoded profile URL, such as x.com/nasa. Xquik looks up a username's ID first. Anything else gets 400 `invalid_user_id`.
        #
        #   @param message_id [String] DM ID from DM history. Another value gets 400 `invalid_message_id`.
        #
        #   @param account [String] Connected X account (@username or ID) that sees the DM.
        #
        #   @param idempotency_key [String] Use 1 unique value per intended write. Reuse it only for an identical retry. A matching retry returns the first answer again, with `idempotent: true` added. It keeps the first status, body & Retry-After. It sends nothing to X & charges nothing. While the first request runs, a retry returns 202 & the action. Different input returns 409. Protection lasts at least 90 days. Retrying a write is safe with an idempotency key. A retry with an API key at its monthly budget gets 403 `api_key_budget_reached`.
        #
        #   @param prefer [String] A long write answers 202 with a status link, then lands on X. `wait=<seconds>` asks for the answer within that many seconds, up to 85. If the write is still running then, the API answers 202 with Location. Poll Location until `terminal` is true, and don't send the write again.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
