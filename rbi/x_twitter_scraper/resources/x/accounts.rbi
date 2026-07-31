# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

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
            totp_secret: String,
            username: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::AccountCreateResponse::Variants)
        end
        def create(
          # Account email
          email:,
          # Account password
          password:,
          # Authenticator App TOTP secret required for durable login
          totp_secret:,
          # X username
          username:,
          request_options: {}
        )
        end

        # Get X account details
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::X::XAccountDetail)
        end
        def retrieve(
          # Resource ID returned by the matching create or list endpoint.
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
          # Resource ID returned by the matching create or list endpoint.
          id,
          request_options: {}
        )
        end

        # Clears loginFailedAt and loginFailureReason for all accounts with transient or
        # automated failure reasons, making them eligible for retry on next use.
        sig do
          params(
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::AccountBulkRetryResponse)
        end
        def bulk_retry(request_options: {})
        end

        # Re-authenticate X account
        sig do
          params(
            id: String,
            password: String,
            email: String,
            totp_secret: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::AccountReauthResponse)
        end
        def reauth(
          # Resource ID returned by the matching create or list endpoint.
          id,
          # Updated account password
          password:,
          # Email for the X account (updates stored email)
          email: nil,
          # Replacement Authenticator App TOTP secret. Omit it to reuse the saved secret.
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
