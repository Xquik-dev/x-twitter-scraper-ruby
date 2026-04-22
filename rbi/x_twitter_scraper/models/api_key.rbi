# typed: strong

module XTwitterScraper
  module Models
    class APIKey < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::APIKey, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(T::Boolean) }
      attr_accessor :is_active

      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :prefix

      sig { returns(T.nilable(Time)) }
      attr_reader :last_used_at

      sig { params(last_used_at: Time).void }
      attr_writer :last_used_at

      # API key metadata returned when listing keys.
      sig do
        params(
          id: String,
          created_at: Time,
          is_active: T::Boolean,
          name: String,
          prefix: String,
          last_used_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        is_active:,
        name:,
        prefix:,
        last_used_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            is_active: T::Boolean,
            name: String,
            prefix: String,
            last_used_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end
