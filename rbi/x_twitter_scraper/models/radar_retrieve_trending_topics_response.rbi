# typed: strong

module XTwitterScraper
  module Models
    class RadarRetrieveTrendingTopicsResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::RadarRetrieveTrendingTopicsResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::RadarItem]) }
      attr_accessor :items

      sig { returns(Integer) }
      attr_accessor :total

      sig do
        params(
          items: T::Array[XTwitterScraper::RadarItem::OrHash],
          total: Integer
        ).returns(T.attached_class)
      end
      def self.new(items:, total:)
      end

      sig do
        override.returns(
          { items: T::Array[XTwitterScraper::RadarItem], total: Integer }
        )
      end
      def to_hash
      end
    end
  end
end
