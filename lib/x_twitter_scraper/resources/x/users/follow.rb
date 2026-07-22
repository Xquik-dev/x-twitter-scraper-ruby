# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Users
        # X write actions (tweets, likes, follows, DMs)
        class Follow
          # Some parameter documentations has been truncated, see
          # {XTwitterScraper::Models::X::Users::FollowCreateParams} for more details.
          #
          # Follow user
          #
          # @overload create(id, account:, idempotency_key:, request_options: {})
          #
          # @param id [String] Path param: User ID to follow
          #
          # @param account [String] Body param: X account identifier (@username or account ID)
          #
          # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Users::FollowCreateResponse]
          #
          # @see XTwitterScraper::Models::X::Users::FollowCreateParams
          def create(id, params)
            parsed, options = XTwitterScraper::X::Users::FollowCreateParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key"}
            @client.request(
              method: :post,
              path: ["x/users/%1$s/follow", id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: XTwitterScraper::Models::X::Users::FollowCreateResponse,
              options: options
            )
          end

          # Some parameter documentations has been truncated, see
          # {XTwitterScraper::Models::X::Users::FollowDeleteAllParams} for more details.
          #
          # Unfollow user
          #
          # @overload delete_all(id, account:, idempotency_key:, request_options: {})
          #
          # @param id [String] Path param: User ID to unfollow
          #
          # @param account [String] Body param: X account identifier (@username or account ID)
          #
          # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Users::FollowDeleteAllResponse]
          #
          # @see XTwitterScraper::Models::X::Users::FollowDeleteAllParams
          def delete_all(id, params)
            parsed, options = XTwitterScraper::X::Users::FollowDeleteAllParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key"}
            @client.request(
              method: :delete,
              path: ["x/users/%1$s/follow", id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: XTwitterScraper::Models::X::Users::FollowDeleteAllResponse,
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
