# typed: strong

module XTwitterScraper
  module Models
    class IntegrationListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::IntegrationListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::Integration]) }
      attr_accessor :integrations

      sig do
        params(
          integrations: T::Array[XTwitterScraper::Integration::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(integrations:)
      end

      sig do
        override.returns(
          { integrations: T::Array[XTwitterScraper::Integration] }
        )
      end
      def to_hash
      end
    end
  end
end
