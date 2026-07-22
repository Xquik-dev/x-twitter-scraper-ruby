# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Tweets
        # X write actions (tweets, likes, follows, DMs)
        class Like
          # Some parameter documentations has been truncated, see
          # {XTwitterScraper::Models::X::Tweets::LikeCreateParams} for more details.
          #
          # Like tweet
          #
          # @overload create(id, account:, idempotency_key:, request_options: {})
          #
          # @param id [String] Path param: Tweet ID to like
          #
          # @param account [String] Body param: X account identifier (@username or account ID)
          #
          # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Tweets::LikeCreateResponse]
          #
          # @see XTwitterScraper::Models::X::Tweets::LikeCreateParams
          def create(id, params)
            parsed, options = XTwitterScraper::X::Tweets::LikeCreateParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key"}
            @client.request(
              method: :post,
              path: ["x/tweets/%1$s/like", id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: XTwitterScraper::Models::X::Tweets::LikeCreateResponse,
              options: options
            )
          end

          # Some parameter documentations has been truncated, see
          # {XTwitterScraper::Models::X::Tweets::LikeDeleteParams} for more details.
          #
          # Unlike tweet
          #
          # @overload delete(id, account:, idempotency_key:, request_options: {})
          #
          # @param id [String] Path param: Tweet ID to unlike
          #
          # @param account [String] Body param: X account identifier (@username or account ID)
          #
          # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Tweets::LikeDeleteResponse]
          #
          # @see XTwitterScraper::Models::X::Tweets::LikeDeleteParams
          def delete(id, params)
            parsed, options = XTwitterScraper::X::Tweets::LikeDeleteParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key"}
            @client.request(
              method: :delete,
              path: ["x/tweets/%1$s/like", id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: XTwitterScraper::Models::X::Tweets::LikeDeleteResponse,
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
