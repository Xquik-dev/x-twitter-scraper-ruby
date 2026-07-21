# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountConnectionChallengeSubmitParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::AccountConnectionChallengeSubmitParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Code sent to the account email.
        sig { returns(String) }
        attr_accessor :email_code

        sig do
          params(
            id: String,
            email_code: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Code sent to the account email.
          email_code:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              email_code: String,
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
