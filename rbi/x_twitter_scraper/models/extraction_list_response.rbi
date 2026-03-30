# typed: strong

module XTwitterScraper
  module Models
    class ExtractionListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ExtractionListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::ExtractionJob]) }
      attr_accessor :extractions

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig do
        params(
          extractions: T::Array[XTwitterScraper::ExtractionJob::OrHash],
          has_more: T::Boolean,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(extractions:, has_more:, next_cursor: nil)
      end

      sig do
        override.returns(
          {
            extractions: T::Array[XTwitterScraper::ExtractionJob],
            has_more: T::Boolean,
            next_cursor: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
