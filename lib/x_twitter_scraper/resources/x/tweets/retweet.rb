# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Tweets
        # X write actions (tweets, likes, follows, DMs)
        class Retweet
          # Retweet
          #
          # @overload create(tweet_id, account:, request_options: {})
          #
          # @param tweet_id [String]
          #
          # @param account [String] X account (@username or account ID)
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse]
          #
          # @see XTwitterScraper::Models::X::Tweets::RetweetCreateParams
          def create(tweet_id, params)
            parsed, options = XTwitterScraper::X::Tweets::RetweetCreateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["x/tweets/%1$s/retweet", tweet_id],
              body: parsed,
              model: XTwitterScraper::Models::X::Tweets::RetweetCreateResponse,
              options: options
            )
          end

          # Unretweet
          #
          # @overload delete(tweet_id, account:, request_options: {})
          #
          # @param tweet_id [String]
          #
          # @param account [String] X account (@username or account ID)
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Tweets::RetweetDeleteResponse]
          #
          # @see XTwitterScraper::Models::X::Tweets::RetweetDeleteParams
          def delete(tweet_id, params)
            parsed, options = XTwitterScraper::X::Tweets::RetweetDeleteParams.dump_request(params)
            @client.request(
              method: :delete,
              path: ["x/tweets/%1$s/retweet", tweet_id],
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
