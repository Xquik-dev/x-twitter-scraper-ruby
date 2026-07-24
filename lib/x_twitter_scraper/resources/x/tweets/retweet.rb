# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Tweets
        # X write actions (tweets, likes, follows, DMs)
        class Retweet
          # Some parameter documentations has been truncated, see
          # {XTwitterScraper::Models::X::Tweets::RetweetCreateParams} for more details.
          #
          # Retweet
          #
          # @overload create(id, account:, idempotency_key:, request_options: {})
          #
          # @param id [String] Path param: Tweet ID to retweet
          #
          # @param account [String] Body param: X account identifier (@username or account ID)
          #
          # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse]
          #
          # @see XTwitterScraper::Models::X::Tweets::RetweetCreateParams
          def create(id, params)
            parsed, options = XTwitterScraper::X::Tweets::RetweetCreateParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key"}
            @client.request(
              method: :post,
              path: ["x/tweets/%1$s/retweet", id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: XTwitterScraper::Models::X::Tweets::RetweetCreateResponse,
              options: options
            )
          end

          # Some parameter documentations has been truncated, see
          # {XTwitterScraper::Models::X::Tweets::RetweetDeleteParams} for more details.
          #
          # Unretweet
          #
          # @overload delete(id, account:, idempotency_key:, request_options: {})
          #
          # @param id [String] Path param: Tweet ID to unretweet
          #
          # @param account [String] Body param: X account identifier (@username or account ID)
          #
          # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Tweets::RetweetDeleteResponse]
          #
          # @see XTwitterScraper::Models::X::Tweets::RetweetDeleteParams
          def delete(id, params)
            parsed, options = XTwitterScraper::X::Tweets::RetweetDeleteParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key"}
            @client.request(
              method: :delete,
              path: ["x/tweets/%1$s/retweet", id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: XTwitterScraper::Models::X::Tweets::RetweetDeleteResponse,
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
