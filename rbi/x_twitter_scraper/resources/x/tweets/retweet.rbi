# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Tweets
        # X write actions (tweets, likes, follows, DMs)
        class Retweet
          # Retweet
          sig do
            params(
              tweet_id: String,
              account: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::Models::X::Tweets::RetweetCreateResponse)
          end
          def create(
            tweet_id,
            # X account (@username or account ID)
            account:,
            request_options: {}
          )
          end

          # Unretweet
          sig do
            params(
              tweet_id: String,
              account: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::Models::X::Tweets::RetweetDeleteResponse)
          end
          def delete(
            tweet_id,
            # X account (@username or account ID)
            account:,
            request_options: {}
          )
          end

          # @api private
          sig do
            params(client: XTwitterScraper::Client).returns(T.attached_class)
          end
          def self.new(client:)
          end
        end
      end
    end
  end
end
