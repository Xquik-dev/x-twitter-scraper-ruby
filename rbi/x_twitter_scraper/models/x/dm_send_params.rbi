# typed: strong

module XTwitterScraper
  module Models
    module X
      class DmSendParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::DmSendParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        # X account (@username or ID) sending the DM
        sig { returns(String) }
        attr_accessor :account

        sig { returns(String) }
        attr_accessor :text

        sig { returns(String) }
        attr_accessor :idempotency_key

        # Optional array containing exactly 1 uploaded media ID.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :media_ids

        sig { params(media_ids: T::Array[String]).void }
        attr_writer :media_ids

        sig do
          params(
            user_id: String,
            account: String,
            text: String,
            idempotency_key: String,
            media_ids: T::Array[String],
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          user_id:,
          # X account (@username or ID) sending the DM
          account:,
          text:,
          idempotency_key:,
          # Optional array containing exactly 1 uploaded media ID.
          media_ids: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              user_id: String,
              account: String,
              text: String,
              idempotency_key: String,
              media_ids: T::Array[String],
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
