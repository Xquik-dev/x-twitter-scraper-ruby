# typed: strong

module XTwitterScraper
  module Models
    class Delivery < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::Delivery, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Integer) }
      attr_accessor :attempts

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(String) }
      attr_accessor :status

      sig { returns(String) }
      attr_accessor :stream_event_id

      sig { returns(T.nilable(Time)) }
      attr_reader :delivered_at

      sig { params(delivered_at: Time).void }
      attr_writer :delivered_at

      sig { returns(T.nilable(String)) }
      attr_reader :last_error

      sig { params(last_error: String).void }
      attr_writer :last_error

      sig { returns(T.nilable(Integer)) }
      attr_reader :last_status_code

      sig { params(last_status_code: Integer).void }
      attr_writer :last_status_code

      sig do
        params(
          id: String,
          attempts: Integer,
          created_at: Time,
          status: String,
          stream_event_id: String,
          delivered_at: Time,
          last_error: String,
          last_status_code: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        attempts:,
        created_at:,
        status:,
        stream_event_id:,
        delivered_at: nil,
        last_error: nil,
        last_status_code: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            attempts: Integer,
            created_at: Time,
            status: String,
            stream_event_id: String,
            delivered_at: Time,
            last_error: String,
            last_status_code: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
