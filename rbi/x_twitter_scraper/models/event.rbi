# typed: strong

module XTwitterScraper
  module Models
    class Event < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::Event, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

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

      # Monitor event summary with type, username, and occurrence time.
      sig do
        params(
          id: String,
          data: T::Hash[Symbol, T.anything],
          monitor_id: String,
          occurred_at: Time,
          type: XTwitterScraper::EventType::OrSymbol,
          username: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        data:,
        monitor_id:,
        occurred_at:,
        # Type of monitor event fired when account activity occurs.
        type:,
        username:
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
            username: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
