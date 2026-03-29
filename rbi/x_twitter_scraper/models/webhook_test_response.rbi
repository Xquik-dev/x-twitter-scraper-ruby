# typed: strong

module XTwitterScraper
  module Models
    class WebhookTestResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::WebhookTestResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :status_code

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig { returns(T.nilable(String)) }
      attr_reader :error

      sig { params(error: String).void }
      attr_writer :error

      sig do
        params(
          status_code: Integer,
          success: T::Boolean,
          error: String
        ).returns(T.attached_class)
      end
      def self.new(status_code:, success:, error: nil)
      end

      sig do
        override.returns(
          { status_code: Integer, success: T::Boolean, error: String }
        )
      end
      def to_hash
      end
    end
  end
end
