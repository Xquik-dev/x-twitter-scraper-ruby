# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Users
        class Mute
          # Unmutes a user through a connected X account.
          sig do
            params(
              id: String,
              account: String,
              idempotency_key: String,
              prefer: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::Models::X::WriteActionRetrieveResponse)
          end
          def delete(
            # User ID, username with or without @, or URL-encoded profile URL, such as
            # x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a
            # username's ID before sending. Anything else gets 400 `invalid_user_id`.
            id,
            # X account identifier (@username or account ID)
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

          # Mutes a user through a connected X account. The user's posts leave that
          # account's timelines, and X doesn't tell the user.
          sig do
            params(
              id: String,
              account: String,
              idempotency_key: String,
              prefer: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::Models::X::WriteActionRetrieveResponse)
          end
          def create(
            # User ID, username with or without @, or URL-encoded profile URL, such as
            # x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a
            # username's ID before sending. Anything else gets 400 `invalid_user_id`.
            id,
            # X account identifier (@username or account ID)
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
end
