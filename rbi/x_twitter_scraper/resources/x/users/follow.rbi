# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Users
        # X write actions (tweets, likes, follows, DMs)
        class Follow
          # Follow user
          sig do
            params(
              id: String,
              account: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::Models::X::Users::FollowCreateResponse)
          end
          def create(
            # User ID to follow
            id,
            # X account identifier (@username or account ID)
            account:,
            request_options: {}
          )
          end

          # Unfollow user
          sig do
            params(
              id: String,
              account: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(
              XTwitterScraper::Models::X::Users::FollowDeleteAllResponse
            )
          end
          def delete_all(
            # User ID to unfollow
            id,
            # X account identifier (@username or account ID)
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
