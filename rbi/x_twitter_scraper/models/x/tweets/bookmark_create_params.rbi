# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      module Tweets
        class BookmarkCreateParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::Tweets::BookmarkCreateParams,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com &
          # twitter.com links with or without https://, www., mobile., a query or a
          # fragment, & /i/status or /i/web/status links. Anything else gets 400
          # `invalid_tweet_id`.
          sig { returns(String) }
          attr_accessor :id

          # X account identifier (@username or account ID)
          sig { returns(String) }
          attr_accessor :account

          # Use 1 unique value per intended write. Reuse it only for an identical retry. A
          # matching retry returns the first answer again, with `idempotent: true` added. It
          # keeps the first status, body & Retry-After. It sends nothing to X & charges
          # nothing. While the first request runs, a retry returns 202 & the action.
          # Different input returns 409. Protection lasts at least 90 days. Retrying a write
          # is safe with an idempotency key. A retry with an API key at its monthly budget
          # gets 403 `api_key_budget_reached`.
          sig { returns(String) }
          attr_accessor :idempotency_key

          # A long write answers 202 with a status link, then lands on X. `wait=<seconds>`
          # asks for the answer within that many seconds, up to 85. If the write is still
          # running then, the API answers 202 with Location. Poll Location until `terminal`
          # is true, and don't send the write again.
          sig { returns(T.nilable(String)) }
          attr_reader :prefer

          sig { params(prefer: String).void }
          attr_writer :prefer

          sig do
            params(
              id: String,
              account: String,
              idempotency_key: String,
              prefer: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com &
            # twitter.com links with or without https://, www., mobile., a query or a
            # fragment, & /i/status or /i/web/status links. Anything else gets 400
            # `invalid_tweet_id`.
            id:,
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

          sig do
            override.returns(
              {
                id: String,
                account: String,
                idempotency_key: String,
                prefer: String,
                request_options: XTwitterScraper::RequestOptions
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
