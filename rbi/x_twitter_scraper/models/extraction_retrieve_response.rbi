# typed: strong

module XTwitterScraper
  module Models
    class ExtractionRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ExtractionRetrieveResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :job

      sig { returns(T::Array[T::Hash[Symbol, T.anything]]) }
      attr_accessor :results

      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig do
        params(
          has_more: T::Boolean,
          job: T::Hash[Symbol, T.anything],
          results: T::Array[T::Hash[Symbol, T.anything]],
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(has_more:, job:, results:, next_cursor: nil)
      end

      sig do
        override.returns(
          {
            has_more: T::Boolean,
            job: T::Hash[Symbol, T.anything],
            results: T::Array[T::Hash[Symbol, T.anything]],
            next_cursor: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
