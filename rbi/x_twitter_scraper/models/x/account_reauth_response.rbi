# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountReauthResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::AccountReauthResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :status

        sig { returns(String) }
        attr_accessor :x_username

        sig do
          params(id: String, status: String, x_username: String).returns(
            T.attached_class
          )
        end
        def self.new(id:, status:, x_username:)
        end

        sig do
          override.returns({ id: String, status: String, x_username: String })
        end
        def to_hash
        end
      end
    end
  end
end
