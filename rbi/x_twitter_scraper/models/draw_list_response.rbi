# typed: strong

module XTwitterScraper
  module Models
    class DrawListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::DrawListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::DrawListItem]) }
      attr_accessor :draws

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig do
        params(
          draws: T::Array[XTwitterScraper::DrawListItem::OrHash],
          has_more: T::Boolean,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(draws:, has_more:, next_cursor: nil)
      end

      sig do
        override.returns(
          {
            draws: T::Array[XTwitterScraper::DrawListItem],
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
