# typed: strong

module XTwitterScraper
  module Resources
    class X
      # Connected X account management
      class AccountConnectionAttempts
        # Get X account connection status
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Variants
          )
        end
        def retrieve(
          # Connection attempt ID returned by `POST /x/accounts`.
          id,
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
