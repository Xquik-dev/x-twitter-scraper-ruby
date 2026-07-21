# typed: strong

module XTwitterScraper
  module Models
    module X
      module Tweets
        class LikeDeleteParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::X::Tweets::LikeDeleteParams,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # X account identifier (@username or account ID)
          sig { returns(String) }
          attr_accessor :account

          sig { returns(String) }
          attr_accessor :idempotency_key

          sig do
            params(
              id: String,
              account: String,
              idempotency_key: String,
              request_options: XTwitterScraper::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            # X account identifier (@username or account ID)
            account:,
            idempotency_key:,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                id: String,
                account: String,
                idempotency_key: String,
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
