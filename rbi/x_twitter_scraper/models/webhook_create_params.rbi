# typed: strong

module XTwitterScraper
  module Models
    class WebhookCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::WebhookCreateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Array of event types to subscribe to.
      sig { returns(T::Array[XTwitterScraper::EventType::OrSymbol]) }
      attr_accessor :event_types

      # HTTPS URL
      sig { returns(String) }
      attr_accessor :url

      sig do
        params(
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          url: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of event types to subscribe to.
        event_types:,
        # HTTPS URL
        url:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
            url: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
