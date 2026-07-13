# typed: strong

module XTwitterScraper
  module Models
    class WebhookCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::WebhookCreateResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      # Array of event types to subscribe to.
      sig { returns(T::Array[XTwitterScraper::EventType::TaggedSymbol]) }
      attr_accessor :event_types

      # Plaintext HMAC signing secret returned only at creation.
      sig { returns(String) }
      attr_accessor :secret

      sig { returns(String) }
      attr_accessor :url

      sig do
        params(
          id: String,
          created_at: Time,
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          secret: String,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        # Array of event types to subscribe to.
        event_types:,
        # Plaintext HMAC signing secret returned only at creation.
        secret:,
        url:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            event_types: T::Array[XTwitterScraper::EventType::TaggedSymbol],
            secret: String,
            url: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
