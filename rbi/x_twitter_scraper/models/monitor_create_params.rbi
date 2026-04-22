# typed: strong

module XTwitterScraper
  module Models
    class MonitorCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::MonitorCreateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Array of event types to subscribe to.
      sig { returns(T::Array[XTwitterScraper::EventType::OrSymbol]) }
      attr_accessor :event_types

      # X username (without @)
      sig { returns(String) }
      attr_accessor :username

      sig do
        params(
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of event types to subscribe to.
        event_types:,
        # X username (without @)
        username:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
            username: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
