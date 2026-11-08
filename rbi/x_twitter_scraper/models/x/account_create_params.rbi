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

        # An ID you generate to read this attempt's status, even if the response never reaches you. Leave it out to get one in a pending response.
        sig { returns(T.nilable(String)) }
        attr_reader :connection_attempt_id

        sig { params(connection_attempt_id: String).void }
        attr_writer :connection_attempt_id

        sig do
          params(
            email: String,
            password: String,
            totp_secret: String,
            username: String,
            connection_attempt_id: String,
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
          # An ID you generate to read this attempt's status, even if the response never reaches you. Leave it out to get one in a pending response.
          connection_attempt_id: nil,
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
              connection_attempt_id: String,
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
