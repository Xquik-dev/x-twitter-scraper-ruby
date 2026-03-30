# typed: strong

module XTwitterScraper
  module Models
    module X
      class DmSendResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::DmSendResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :message_id

        sig { returns(T::Boolean) }
        attr_accessor :success

        sig do
          params(message_id: String, success: T::Boolean).returns(
            T.attached_class
          )
        end
        def self.new(message_id:, success: true)
        end

        sig { override.returns({ message_id: String, success: T::Boolean }) }
        def to_hash
        end
      end
    end
  end
end
