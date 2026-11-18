# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Tweets
        class Bookmark
          # Removes a bookmark through a connected X account.
          #
          # @overload delete(id, account:, idempotency_key:, prefer: nil, request_options: {})
          #
          # @param id [String] Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com & twitter.com links with or without https://, www., mobile., a query or a fragment, & /i/status or /i/web/status links. Anything else gets 400 `invalid_tweet_id`.
          #
          # @param account [String] X account identifier (@username or account ID)
          #
          # @param idempotency_key [String] Use 1 unique value per intended write. Reuse it only for an identical retry. A matching retry returns the first answer again, with `idempotent: true` added. It keeps the first status, body & Retry-After. It sends nothing to X & charges nothing. While the first request runs, a retry returns 202 & the action. Different input returns 409. Protection lasts at least 90 days. Retrying a write is safe with an idempotency key. A retry with an API key at its monthly budget gets 403 `api_key_budget_reached`.
          #
          # @param prefer [String] A long write answers 202 with a status link, then lands on X. `wait=<seconds>` asks for the answer within that many seconds, up to 85. If the write is still running then, the API answers 202 with Location. Poll Location until `terminal` is true, and don't send the write again.
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::WriteActionRetrieveResponse]
          #
          # @see XTwitterScraper::Models::X::Tweets::BookmarkDeleteParams
          def delete(id, params)
            parsed, options = XTwitterScraper::Models::X::Tweets::BookmarkDeleteParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key", prefer: "prefer"}
            @client.request(
              method: :delete,
              path: ["x/tweets/%1$s/bookmark", id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: XTwitterScraper::Models::X::WriteActionRetrieveResponse,
              options: options
            )
          end

          # Bookmarks a post through a connected X account. Only that account sees its
          # bookmarks, and GET /x/bookmarks lists them.
          #
          # @overload create(id, account:, idempotency_key:, prefer: nil, request_options: {})
          #
          # @param id [String] Tweet ID or URL-encoded tweet URL, such as x.com/nasa/status/20. Takes x.com & twitter.com links with or without https://, www., mobile., a query or a fragment, & /i/status or /i/web/status links. Anything else gets 400 `invalid_tweet_id`.
          #
          # @param account [String] X account identifier (@username or account ID)
          #
          # @param idempotency_key [String] Use 1 unique value per intended write. Reuse it only for an identical retry. A matching retry returns the first answer again, with `idempotent: true` added. It keeps the first status, body & Retry-After. It sends nothing to X & charges nothing. While the first request runs, a retry returns 202 & the action. Different input returns 409. Protection lasts at least 90 days. Retrying a write is safe with an idempotency key. A retry with an API key at its monthly budget gets 403 `api_key_budget_reached`.
          #
          # @param prefer [String] A long write answers 202 with a status link, then lands on X. `wait=<seconds>` asks for the answer within that many seconds, up to 85. If the write is still running then, the API answers 202 with Location. Poll Location until `terminal` is true, and don't send the write again.
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::WriteActionRetrieveResponse]
          #
          # @see XTwitterScraper::Models::X::Tweets::BookmarkCreateParams
          def create(id, params)
            parsed, options = XTwitterScraper::Models::X::Tweets::BookmarkCreateParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key", prefer: "prefer"}
            @client.request(
              method: :post,
              path: ["x/tweets/%1$s/bookmark", id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
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
end
