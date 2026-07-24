# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X write actions (tweets, likes, follows, DMs)
        class Join
          # Some parameter documentations has been truncated, see
          # {XTwitterScraper::Models::X::Communities::JoinCreateParams} for more details.
          #
          # Join community
          #
          # @overload create(id, account:, idempotency_key:, request_options: {})
          #
          # @param id [String] Path param: Resource ID returned by the matching create or list endpoint.
          #
          # @param account [String] Body param: X account identifier (@username or account ID)
          #
          # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Communities::JoinCreateResponse]
          #
          # @see XTwitterScraper::Models::X::Communities::JoinCreateParams
          def create(id, params)
            parsed, options = XTwitterScraper::X::Communities::JoinCreateParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key"}
            @client.request(
              method: :post,
              path: ["x/communities/%1$s/join", id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: XTwitterScraper::Models::X::Communities::JoinCreateResponse,
              options: options
            )
          end

          # Some parameter documentations has been truncated, see
          # {XTwitterScraper::Models::X::Communities::JoinDeleteAllParams} for more details.
          #
          # Leave community
          #
          # @overload delete_all(id, account:, idempotency_key:, request_options: {})
          #
          # @param id [String] Path param: Resource ID returned by the matching create or list endpoint.
          #
          # @param account [String] Body param: X account identifier (@username or account ID)
          #
          # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse]
          #
          # @see XTwitterScraper::Models::X::Communities::JoinDeleteAllParams
          def delete_all(id, params)
            parsed, options = XTwitterScraper::X::Communities::JoinDeleteAllParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key"}
            @client.request(
              method: :delete,
              path: ["x/communities/%1$s/join", id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse,
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
