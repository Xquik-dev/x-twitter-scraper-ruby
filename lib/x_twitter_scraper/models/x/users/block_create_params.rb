# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Users
        # @see XTwitterScraper::Resources::X::Users::Block#create
        class BlockCreateParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          # @!attribute id
          #   User ID, username with or without @, or URL-encoded profile URL, such as
          #   x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a
          #   username's ID before sending. Anything else gets 400 `invalid_user_id`.
          #
          #   @return [String]
          required :id, String

          # @!attribute account
          #   X account identifier (@username or account ID)
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

          # @!method initialize(id:, account:, idempotency_key:, prefer: nil, request_options: {})
          #   @param id [String] User ID, username with or without @, or URL-encoded profile URL, such as x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a username's ID before sending. Anything else gets 400 `invalid_user_id`.
          #
          #   @param account [String] X account identifier (@username or account ID)
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
end
