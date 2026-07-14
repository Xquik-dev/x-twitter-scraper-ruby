# typed: strong

module XTwitterScraper
  module Models
    class Webhook < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::Webhook, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # Consecutive failed delivery attempts since the last success.
      sig { returns(Integer) }
      attr_accessor :consecutive_failures

      sig { returns(Time) }
      attr_accessor :created_at

      # Endpoint delivery state. needs_attention means delivery stopped after repeated
      # failures.
      sig { returns(XTwitterScraper::Webhook::DeliveryStatus::TaggedSymbol) }
      attr_accessor :delivery_status

      # Array of event types to subscribe to.
      sig { returns(T::Array[XTwitterScraper::EventType::TaggedSymbol]) }
      attr_accessor :event_types

      # Consecutive delivery failures that pause the endpoint.
      sig { returns(Integer) }
      attr_accessor :failure_hard_cap

      sig { returns(T::Boolean) }
      attr_accessor :is_active

      sig { returns(String) }
      attr_accessor :url

      # Webhook endpoint registered to receive event deliveries.
      sig do
        params(
          id: String,
          consecutive_failures: Integer,
          created_at: Time,
          delivery_status: XTwitterScraper::Webhook::DeliveryStatus::OrSymbol,
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          failure_hard_cap: Integer,
          is_active: T::Boolean,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Consecutive failed delivery attempts since the last success.
        consecutive_failures:,
        created_at:,
        # Endpoint delivery state. needs_attention means delivery stopped after repeated
        # failures.
        delivery_status:,
        # Array of event types to subscribe to.
        event_types:,
        # Consecutive delivery failures that pause the endpoint.
        failure_hard_cap:,
        is_active:,
        url:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            consecutive_failures: Integer,
            created_at: Time,
            delivery_status:
              XTwitterScraper::Webhook::DeliveryStatus::TaggedSymbol,
            event_types: T::Array[XTwitterScraper::EventType::TaggedSymbol],
            failure_hard_cap: Integer,
            is_active: T::Boolean,
            url: String
          }
        )
      end
      def to_hash
      end

      # Endpoint delivery state. needs_attention means delivery stopped after repeated
      # failures.
      module DeliveryStatus
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Webhook::DeliveryStatus)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, XTwitterScraper::Webhook::DeliveryStatus::TaggedSymbol)
        PAUSED =
          T.let(:paused, XTwitterScraper::Webhook::DeliveryStatus::TaggedSymbol)
        NEEDS_ATTENTION =
          T.let(
            :needs_attention,
            XTwitterScraper::Webhook::DeliveryStatus::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::Webhook::DeliveryStatus::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
