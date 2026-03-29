# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Tweets
        # X write actions (tweets, likes, follows, DMs)
        class Like
          # Like tweet
          sig do
            params(
              tweet_id: String,
              account: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::Models::X::Tweets::LikeCreateResponse)
          end
          def create(
            tweet_id,
            # X account (@username or account ID)
            account:,
            request_options: {}
          )
          end

          # Unlike tweet
          sig do
            params(
              tweet_id: String,
              account: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::Models::X::Tweets::LikeDeleteResponse)
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
