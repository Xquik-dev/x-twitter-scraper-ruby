# typed: strong

module XTwitterScraper
  module Models
    class PaginatedTweets < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::PaginatedTweets,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      sig { returns(String) }
      attr_accessor :next_cursor

      sig { returns(T::Array[XTwitterScraper::X::SearchTweet]) }
      attr_accessor :tweets

      sig do
        params(
          has_next_page: T::Boolean,
          next_cursor: String,
          tweets: T::Array[XTwitterScraper::X::SearchTweet::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(has_next_page:, next_cursor:, tweets:)
      end

      sig do
        override.returns(
          {
            has_next_page: T::Boolean,
            next_cursor: String,
            tweets: T::Array[XTwitterScraper::X::SearchTweet]
          }
        )
      end
      def to_hash
      end
    end
  end
end
