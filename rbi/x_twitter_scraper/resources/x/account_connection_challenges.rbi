# typed: strong

module XTwitterScraper
  module Resources
    class X
      # Connected X account management
      class AccountConnectionChallenges
        # Submit X account email verification code
        sig do
          params(
            id: String,
            email_code: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse
          )
        end
        def submit(
          # Resource ID returned by the matching create or list endpoint.
          id,
          # Code sent to the account email.
          email_code:,
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
