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

      sig { returns(T::Array[XTwitterScraper::SearchTweet]) }
      attr_accessor :tweets

      # Paginated tweet results. The item count can be lower than pageSize when the
      # source returns fewer tweets, filters remove tweets, or remaining credits cover
      # fewer results. Follow next_cursor while has_next_page is true. An empty page can
      # still have has_next_page true after filtering. Zero affordable results returns
      # 402 insufficient_credits.
      sig do
        params(
          has_next_page: T::Boolean,
          next_cursor: String,
          tweets: T::Array[XTwitterScraper::SearchTweet::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(has_next_page:, next_cursor:, tweets:)
      end

      sig do
        override.returns(
          {
            has_next_page: T::Boolean,
            next_cursor: String,
            tweets: T::Array[XTwitterScraper::SearchTweet]
          }
        )
      end
      def to_hash
      end
    end
  end
end
