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

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :media_ids

        sig { params(media_ids: T::Array[String]).void }
        attr_writer :media_ids

        sig { returns(T.nilable(String)) }
        attr_reader :reply_to_message_id

        sig { params(reply_to_message_id: String).void }
        attr_writer :reply_to_message_id

        sig do
          params(
            user_id: String,
            account: String,
            text: String,
            media_ids: T::Array[String],
            reply_to_message_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          user_id:,
          # X account (@username or ID) sending the DM
          account:,
          text:,
          media_ids: nil,
          reply_to_message_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              user_id: String,
              account: String,
              text: String,
              media_ids: T::Array[String],
              reply_to_message_id: String,
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
