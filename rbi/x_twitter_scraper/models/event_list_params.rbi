# typed: strong

module XTwitterScraper
  module Models
    class EventListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::EventListParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Cursor for pagination
      sig { returns(T.nilable(String)) }
      attr_reader :after

      sig { params(after: String).void }
      attr_writer :after

      sig { returns(T.nilable(XTwitterScraper::EventType::OrSymbol)) }
      attr_reader :event_type

      sig { params(event_type: XTwitterScraper::EventType::OrSymbol).void }
      attr_writer :event_type

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(String)) }
      attr_reader :monitor_id

      sig { params(monitor_id: String).void }
      attr_writer :monitor_id

      sig do
        params(
          after: String,
          event_type: XTwitterScraper::EventType::OrSymbol,
          limit: Integer,
          monitor_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor for pagination
        after: nil,
        event_type: nil,
        limit: nil,
        monitor_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after: String,
            event_type: XTwitterScraper::EventType::OrSymbol,
            limit: Integer,
            monitor_id: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
