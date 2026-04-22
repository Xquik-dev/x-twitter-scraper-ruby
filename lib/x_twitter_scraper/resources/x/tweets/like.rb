# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Tweets
        # X write actions (tweets, likes, follows, DMs)
        class Like
          # Like tweet
          #
          # @overload create(id, account:, request_options: {})
          #
          # @param id [String] Tweet ID to like
          #
          # @param account [String] X account identifier (@username or account ID)
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Tweets::LikeCreateResponse]
          #
          # @see XTwitterScraper::Models::X::Tweets::LikeCreateParams
          def create(id, params)
            parsed, options = XTwitterScraper::X::Tweets::LikeCreateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["x/tweets/%1$s/like", id],
              body: parsed,
              model: XTwitterScraper::Models::X::Tweets::LikeCreateResponse,
              options: options
            )
          end

          # Unlike tweet
          #
          # @overload delete(id, account:, request_options: {})
          #
          # @param id [String] Tweet ID to unlike
          #
          # @param account [String] X account identifier (@username or account ID)
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Tweets::LikeDeleteResponse]
          #
          # @see XTwitterScraper::Models::X::Tweets::LikeDeleteParams
          def delete(id, params)
            parsed, options = XTwitterScraper::X::Tweets::LikeDeleteParams.dump_request(params)
            @client.request(
              method: :delete,
              path: ["x/tweets/%1$s/like", id],
              body: parsed,
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
