# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Tweets
        # X write actions (tweets, likes, follows, DMs)
        class Retweet
          # Retweet
          #
          # @overload create(id, account:, request_options: {})
          #
          # @param id [String] Tweet ID to retweet
          #
          # @param account [String] X account identifier (@username or account ID)
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse]
          #
          # @see XTwitterScraper::Models::X::Tweets::RetweetCreateParams
          def create(id, params)
            parsed, options = XTwitterScraper::X::Tweets::RetweetCreateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["x/tweets/%1$s/retweet", id],
              body: parsed,
              model: XTwitterScraper::Models::X::Tweets::RetweetCreateResponse,
              options: options
            )
          end

          # Unretweet
          #
          # @overload delete(id, account:, request_options: {})
          #
          # @param id [String] Tweet ID to unretweet
          #
          # @param account [String] X account identifier (@username or account ID)
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Tweets::RetweetDeleteResponse]
          #
          # @see XTwitterScraper::Models::X::Tweets::RetweetDeleteParams
          def delete(id, params)
            parsed, options = XTwitterScraper::X::Tweets::RetweetDeleteParams.dump_request(params)
            @client.request(
              method: :delete,
              path: ["x/tweets/%1$s/retweet", id],
              body: parsed,
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
