# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountListResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::AccountListResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[XTwitterScraper::Models::X::AccountListResponse::Account]
          )
        end
        attr_accessor :accounts

        sig do
          params(
            accounts:
              T::Array[
                XTwitterScraper::Models::X::AccountListResponse::Account::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(accounts:)
        end

        sig do
          override.returns(
            {
              accounts:
                T::Array[
                  XTwitterScraper::Models::X::AccountListResponse::Account
                ]
            }
          )
        end
        def to_hash
        end

        class Account < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::AccountListResponse::Account,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(Time) }
          attr_accessor :created_at

          sig { returns(String) }
          attr_accessor :status

          sig { returns(String) }
          attr_accessor :x_user_id

          sig { returns(String) }
          attr_accessor :x_username

          sig do
            params(
              id: String,
              created_at: Time,
              status: String,
              x_user_id: String,
              x_username: String
            ).returns(T.attached_class)
          end
          def self.new(id:, created_at:, status:, x_user_id:, x_username:)
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                status: String,
                x_user_id: String,
                x_username: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
