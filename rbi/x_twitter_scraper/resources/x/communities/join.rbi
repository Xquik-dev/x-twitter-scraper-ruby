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
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(
              XTwitterScraper::Models::X::Communities::JoinCreateResponse
            )
          end
          def create(
            # Resource ID (stringified bigint)
            id,
            # X account identifier (@username or account ID)
            account:,
            request_options: {}
          )
          end

          # Leave community
          sig do
            params(
              id: String,
              account: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(
              XTwitterScraper::Models::X::Communities::JoinDeleteAllResponse
            )
          end
          def delete_all(
            # Resource ID (stringified bigint)
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
