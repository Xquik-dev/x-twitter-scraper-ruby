# typed: strong

module XTwitterScraper
  module Models
    class DrawRunResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::DrawRunResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Integer) }
      attr_accessor :total_entries

      sig { returns(String) }
      attr_accessor :tweet_id

      sig { returns(Integer) }
      attr_accessor :valid_entries

      sig { returns(T::Array[XTwitterScraper::Winner]) }
      attr_accessor :winners

      sig do
        params(
          id: String,
          total_entries: Integer,
          tweet_id: String,
          valid_entries: Integer,
          winners: T::Array[XTwitterScraper::Winner::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(id:, total_entries:, tweet_id:, valid_entries:, winners:)
      end

      sig do
        override.returns(
          {
            id: String,
            total_entries: Integer,
            tweet_id: String,
            valid_entries: Integer,
            winners: T::Array[XTwitterScraper::Winner]
          }
        )
      end
      def to_hash
      end
    end
  end
end
