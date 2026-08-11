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

      # When Xquik automatically paused this monitor.
      sig { returns(T.nilable(Time)) }
      attr_reader :paused_at

      sig { params(paused_at: Time).void }
      attr_writer :paused_at

      # Why Xquik automatically paused this monitor.
      sig do
        returns(T.nilable(XTwitterScraper::Monitor::PausedReason::TaggedSymbol))
      end
      attr_reader :paused_reason

      sig do
        params(
          paused_reason: XTwitterScraper::Monitor::PausedReason::OrSymbol
        ).void
      end
      attr_writer :paused_reason

      # Account monitor that tracks activity for a given X user.
      sig do
        params(
          id: String,
          created_at: Time,
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          is_active: T::Boolean,
          next_billing_at: Time,
          username: String,
          x_user_id: String,
          paused_at: Time,
          paused_reason: XTwitterScraper::Monitor::PausedReason::OrSymbol
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
        x_user_id:,
        # When Xquik automatically paused this monitor.
        paused_at: nil,
        # Why Xquik automatically paused this monitor.
        paused_reason: nil
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
            x_user_id: String,
            paused_at: Time,
            paused_reason: XTwitterScraper::Monitor::PausedReason::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Why Xquik automatically paused this monitor.
      module PausedReason
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::Monitor::PausedReason) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        X_USER_NOT_FOUND =
          T.let(
            :x_user_not_found,
            XTwitterScraper::Monitor::PausedReason::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::Monitor::PausedReason::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
