# typed: strong

module XTwitterScraper
  module Models
    class EventDetail < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::EventDetail,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Event payload - shape varies by event type (JSON)
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :data

      sig { returns(String) }
      attr_accessor :monitor_id

      sig { returns(Time) }
      attr_accessor :occurred_at

      # Type of monitor event fired when account activity occurs.
      sig { returns(XTwitterScraper::EventType::TaggedSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :username

      sig { returns(T.nilable(String)) }
      attr_reader :x_event_id

      sig { params(x_event_id: String).void }
      attr_writer :x_event_id

      # Full monitor event including payload data and optional X event ID.
      sig do
        params(
          id: String,
          data: T::Hash[Symbol, T.anything],
          monitor_id: String,
          occurred_at: Time,
          type: XTwitterScraper::EventType::OrSymbol,
          username: String,
          x_event_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Event payload - shape varies by event type (JSON)
        data:,
        monitor_id:,
        occurred_at:,
        # Type of monitor event fired when account activity occurs.
        type:,
        username:,
        x_event_id: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            data: T::Hash[Symbol, T.anything],
            monitor_id: String,
            occurred_at: Time,
            type: XTwitterScraper::EventType::TaggedSymbol,
            username: String,
            x_event_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
