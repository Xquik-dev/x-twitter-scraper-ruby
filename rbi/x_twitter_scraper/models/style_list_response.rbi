# typed: strong

module XTwitterScraper
  module Models
    class StyleListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::StyleListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::StyleProfileSummary]) }
      attr_accessor :styles

      sig do
        params(
          styles: T::Array[XTwitterScraper::StyleProfileSummary::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(styles:)
      end

      sig do
        override.returns(
          { styles: T::Array[XTwitterScraper::StyleProfileSummary] }
        )
      end
      def to_hash
      end
    end
  end
end
