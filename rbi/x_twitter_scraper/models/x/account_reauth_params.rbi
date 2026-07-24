# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountReauthParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::AccountReauthParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Updated account password
        sig { returns(String) }
        attr_accessor :password

        # Email for the X account (updates stored email)
        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

        # TOTP secret for 2FA re-authentication
        sig { returns(T.nilable(String)) }
        attr_reader :totp_secret

        sig { params(totp_secret: String).void }
        attr_writer :totp_secret

        sig do
          params(
            id: String,
            password: String,
            email: String,
            totp_secret: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Updated account password
          password:,
          # Email for the X account (updates stored email)
          email: nil,
          # TOTP secret for 2FA re-authentication
          totp_secret: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              password: String,
              email: String,
              totp_secret: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
