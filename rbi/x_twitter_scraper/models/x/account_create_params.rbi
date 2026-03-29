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

        # X username
        sig { returns(String) }
        attr_accessor :username

        # Proxy country code
        sig { returns(T.nilable(String)) }
        attr_reader :proxy_country

        sig { params(proxy_country: String).void }
        attr_writer :proxy_country

        # TOTP secret for 2FA
        sig { returns(T.nilable(String)) }
        attr_reader :totp_secret

        sig { params(totp_secret: String).void }
        attr_writer :totp_secret

        sig do
          params(
            email: String,
            password: String,
            username: String,
            proxy_country: String,
            totp_secret: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
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

        sig do
          override.returns(
            {
              email: String,
              password: String,
              username: String,
              proxy_country: String,
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
