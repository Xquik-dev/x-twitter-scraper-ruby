# typed: strong

module XTwitterScraper
  module Models
    class IntegrationListDeliveriesResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::IntegrationListDeliveriesResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::IntegrationDelivery]) }
      attr_accessor :deliveries

      sig do
        params(
          deliveries: T::Array[XTwitterScraper::IntegrationDelivery::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(deliveries:)
      end

      sig do
        override.returns(
          { deliveries: T::Array[XTwitterScraper::IntegrationDelivery] }
        )
      end
      def to_hash
      end
    end
  end
end
