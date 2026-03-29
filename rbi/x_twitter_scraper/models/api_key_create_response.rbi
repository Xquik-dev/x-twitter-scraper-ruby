# typed: strong

module XTwitterScraper
  module Models
    class APIKeyCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::APIKeyCreateResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(String) }
      attr_accessor :full_key

      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :prefix

      sig do
        params(
          id: String,
          created_at: Time,
          full_key: String,
          name: String,
          prefix: String
        ).returns(T.attached_class)
      end
      def self.new(id:, created_at:, full_key:, name:, prefix:)
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            full_key: String,
            name: String,
            prefix: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
