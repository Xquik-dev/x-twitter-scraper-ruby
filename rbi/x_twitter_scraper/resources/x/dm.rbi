# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Dm
        # Get DM conversation history
        sig do
          params(
            user_id: String,
            account: String,
            cursor: String,
            max_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::DmRetrieveHistoryResponse)
        end
        def retrieve_history(
          # Target user ID
          user_id,
          # X handle (without the `@` prefix) of the connected X account used to read the
          # conversation. The account must be a participant in the conversation.
          account:,
          # Pagination cursor for DM history
          cursor: nil,
          # Legacy pagination cursor (backward compat)
          max_id: nil,
          request_options: {}
        )
        end

        # Send direct message
        sig do
          params(
            user_id: String,
            account: String,
            text: String,
            idempotency_key: String,
            media_ids: T::Array[String],
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::DmSendResponse)
        end
        def send_(
          # Path param: Recipient user ID
          user_id,
          # Body param: X account (@username or ID) sending the DM
          account:,
          # Body param
          text:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          # Body param: Optional array containing exactly 1 uploaded media ID.
          media_ids: nil,
          request_options: {}
        )
        end

        # Deletes 1 DM from the account's side. The other person keeps it. Success means
        # the DM is gone from the account's conversation. A DM that stays gets 422
        # `x_dm_not_deleted`, and Xquik charges nothing.
        sig do
          params(
            message_id: String,
            user_id: String,
            account: String,
            idempotency_key: String,
            prefer: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::WriteActionRetrieveResponse)
        end
        def delete_message(
          # DM ID from DM history. Another value gets 400 `invalid_message_id`.
          message_id,
          # The other person in the conversation, as a user ID, username with or without @,
          # or URL-encoded profile URL, such as x.com/nasa. Xquik looks up a username's ID
          # first. Anything else gets 400 `invalid_user_id`.
          user_id:,
          # Connected X account (@username or ID) that sees the DM.
          account:,
          # Use 1 unique value per intended write. Reuse it only for an identical retry. A
          # matching retry returns the first answer again, with `idempotent: true` added. It
          # keeps the first status, body & Retry-After. It sends nothing to X & charges
          # nothing. While the first request runs, a retry returns 202 & the action.
          # Different input returns 409. Protection lasts at least 90 days. Retrying a write
          # is safe with an idempotency key. A retry with an API key at its monthly budget
          # gets 403 `api_key_budget_reached`.
          idempotency_key:,
          # A long write answers 202 with a status link, then lands on X. `wait=<seconds>`
          # asks for the answer within that many seconds, up to 85. If the write is still
          # running then, the API answers 202 with Location. Poll Location until `terminal`
          # is true, and don't send the write again.
          prefer: nil,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: XTwitterScraper::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
