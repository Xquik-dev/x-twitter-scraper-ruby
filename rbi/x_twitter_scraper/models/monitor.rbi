# typed: strong

module XTwitterScraper
  module Models
    class Monitor < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::Monitor, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      # Array of event types to subscribe to.
      sig { returns(T::Array[XTwitterScraper::EventType::TaggedSymbol]) }
      attr_accessor :event_types

      sig { returns(T::Boolean) }
      attr_accessor :is_active

      # Next hourly credit charge time for this account monitor.
      sig { returns(Time) }
      attr_accessor :next_billing_at

      sig { returns(String) }
      attr_accessor :username

      sig { returns(String) }
      attr_accessor :x_user_id

      # Account monitor that tracks activity for a given X user.
      sig do
        params(
          id: String,
          created_at: Time,
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          is_active: T::Boolean,
          next_billing_at: Time,
          username: String,
          x_user_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        # Array of event types to subscribe to.
        event_types:,
        is_active:,
        # Next hourly credit charge time for this account monitor.
        next_billing_at:,
        username:,
        x_user_id:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            event_types: T::Array[XTwitterScraper::EventType::TaggedSymbol],
            is_active: T::Boolean,
            next_billing_at: Time,
            username: String,
            x_user_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
