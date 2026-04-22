# typed: strong

module XTwitterScraper
  module Models
    class APIKeyListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::APIKeyListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::APIKey]) }
      attr_accessor :keys

      sig do
        params(keys: T::Array[XTwitterScraper::APIKey::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(keys:)
      end

      sig { override.returns({ keys: T::Array[XTwitterScraper::APIKey] }) }
      def to_hash
      end
    end
  end
end
