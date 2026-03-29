# typed: strong

module XTwitterScraper
  module Models
    module X
      module Users
        class FollowCreateParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::X::Users::FollowCreateParams,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :user_id

          # X account (@username or account ID)
          sig { returns(String) }
          attr_accessor :account

          sig do
            params(
              user_id: String,
              account: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            user_id:,
            # X account (@username or account ID)
            account:,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                user_id: String,
                account: String,
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
end
