# typed: strong

module XTwitterScraper
  module Models
    class IntegrationDelivery < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::IntegrationDelivery,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Integer) }
      attr_accessor :attempts

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(String) }
      attr_accessor :event_type

      sig { returns(String) }
      attr_accessor :status

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

      sig { returns(T.nilable(String)) }
      attr_reader :source_id

      sig { params(source_id: String).void }
      attr_writer :source_id

      sig { returns(T.nilable(String)) }
      attr_reader :source_type

      sig { params(source_type: String).void }
      attr_writer :source_type

      sig do
        params(
          id: String,
          attempts: Integer,
          created_at: Time,
          event_type: String,
          status: String,
          delivered_at: Time,
          last_error: String,
          last_status_code: Integer,
          source_id: String,
          source_type: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        attempts:,
        created_at:,
        event_type:,
        status:,
        delivered_at: nil,
        last_error: nil,
        last_status_code: nil,
        source_id: nil,
        source_type: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            attempts: Integer,
            created_at: Time,
            event_type: String,
            status: String,
            delivered_at: Time,
            last_error: String,
            last_status_code: Integer,
            source_id: String,
            source_type: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
