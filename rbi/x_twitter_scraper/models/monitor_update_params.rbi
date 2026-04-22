# typed: strong

module XTwitterScraper
  module Models
    class MonitorUpdateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::MonitorUpdateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Array of event types to subscribe to.
      sig { returns(T.nilable(T::Array[XTwitterScraper::EventType::OrSymbol])) }
      attr_reader :event_types

      sig do
        params(event_types: T::Array[XTwitterScraper::EventType::OrSymbol]).void
      end
      attr_writer :event_types

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_active

      sig { params(is_active: T::Boolean).void }
      attr_writer :is_active

      sig do
        params(
          id: String,
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          is_active: T::Boolean,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Array of event types to subscribe to.
        event_types: nil,
        is_active: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
            is_active: T::Boolean,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
