# typed: strong

module XTwitterScraper
  module Models
    class WebhookResumeResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::WebhookResumeResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :status_code

      sig { returns(T::Boolean) }
      attr_accessor :success

      # Webhook endpoint registered to receive event deliveries.
      sig { returns(XTwitterScraper::Webhook) }
      attr_reader :webhook

      sig { params(webhook: XTwitterScraper::Webhook::OrHash).void }
      attr_writer :webhook

      sig do
        params(
          status_code: Integer,
          success: T::Boolean,
          webhook: XTwitterScraper::Webhook::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        status_code:,
        success:,
        # Webhook endpoint registered to receive event deliveries.
        webhook:
      )
      end

      sig do
        override.returns(
          {
            status_code: Integer,
            success: T::Boolean,
            webhook: XTwitterScraper::Webhook
          }
        )
      end
      def to_hash
      end
    end
  end
end
