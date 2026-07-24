# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

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
              id: String,
              account: String,
              idempotency_key: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::Models::X::Tweets::LikeCreateResponse)
          end
          def create(
            # Path param: Tweet ID to like
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

          # Unlike tweet
          sig do
            params(
              id: String,
              account: String,
              idempotency_key: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(XTwitterScraper::Models::X::Tweets::LikeDeleteResponse)
          end
          def delete(
            # Path param: Tweet ID to unlike
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
