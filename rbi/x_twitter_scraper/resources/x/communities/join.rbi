# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X write actions (tweets, likes, follows, DMs)
        class Join
          # Join community
          sig do
            params(
              id: String,
              account: String,
              idempotency_key: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(
              XTwitterScraper::Models::X::Communities::JoinCreateResponse
            )
          end
          def create(
            # Path param: Resource ID returned by the matching create or list endpoint.
            id,
            # Body param: X account identifier (@username or account ID)
            account:,
            # Header param: Generate one unique value for each intended write. Reuse it only
            # when retrying the exact same account, action, target, and payload. A reused key
            # returns the original action. Reusing it with different input returns 409. Replay
            # protection remains active for at least 90 days.
            idempotency_key:,
            request_options: {}
          )
          end

          # Leave community
          sig do
            params(
              id: String,
              account: String,
              idempotency_key: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(
              XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse
            )
          end
          def delete_all(
            # Path param: Resource ID returned by the matching create or list endpoint.
            id,
            # Body param: X account identifier (@username or account ID)
            account:,
            # Header param: Generate one unique value for each intended write. Reuse it only
            # when retrying the exact same account, action, target, and payload. A reused key
            # returns the original action. Reusing it with different input returns 409. Replay
            # protection remains active for at least 90 days.
            idempotency_key:,
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
