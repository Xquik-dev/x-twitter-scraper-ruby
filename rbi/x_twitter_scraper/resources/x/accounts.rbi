# typed: strong

module XTwitterScraper
  module Resources
    class X
      # Connected X account management
      class Accounts
        # Connect X account
        sig do
          params(
            email: String,
            password: String,
            username: String,
            proxy_country: String,
            totp_secret: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::AccountCreateResponse)
        end
        def create(
          # Account email
          email:,
          # Account password
          password:,
          # X username
          username:,
          # Proxy country code
          proxy_country: nil,
          # TOTP secret for 2FA
          totp_secret: nil,
          request_options: {}
        )
        end

        # Get X account details
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::AccountRetrieveResponse)
        end
        def retrieve(
          # Resource ID (stringified bigint)
          id,
          request_options: {}
        )
        end

        # List connected X accounts
        sig do
          params(
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::AccountListResponse)
        end
        def list(request_options: {})
        end

        # Disconnect X account
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::AccountDeleteResponse)
        end
        def delete(
          # Resource ID (stringified bigint)
          id,
          request_options: {}
        )
        end

        # Re-authenticate X account
        sig do
          params(
            id: String,
            password: String,
            totp_secret: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::AccountReauthResponse)
        end
        def reauth(
          # Resource ID (stringified bigint)
          id,
          # Account password
          password:,
          # TOTP secret for 2FA
          totp_secret: nil,
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
