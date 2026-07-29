# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::AccountCreateParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Account email
        sig { returns(String) }
        attr_accessor :email

        # Account password
        sig { returns(String) }
        attr_accessor :password

        # Authenticator App TOTP secret required for durable login
        sig { returns(String) }
        attr_accessor :totp_secret

        # X username
        sig { returns(String) }
        attr_accessor :username

        sig do
          params(
            email: String,
            password: String,
            totp_secret: String,
            username: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
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

        sig do
          override.returns(
            {
              email: String,
              password: String,
              totp_secret: String,
              username: String,
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
