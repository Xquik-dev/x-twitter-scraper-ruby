# typed: strong

module XTwitterScraper
  module Models
    class MonitorCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::MonitorCreateResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(T::Array[XTwitterScraper::EventType::TaggedSymbol]) }
      attr_accessor :event_types

      sig { returns(String) }
      attr_accessor :username

      sig { returns(String) }
      attr_accessor :x_user_id

      sig do
        params(
          id: String,
          created_at: Time,
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          username: String,
          x_user_id: String
        ).returns(T.attached_class)
      end
      def self.new(id:, created_at:, event_types:, username:, x_user_id:)
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            event_types: T::Array[XTwitterScraper::EventType::TaggedSymbol],
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
