# typed: strong

module XTwitterScraper
  module Models
    class StyleProfileSummary < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::StyleProfileSummary,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(Time) }
      attr_accessor :fetched_at

      sig { returns(T::Boolean) }
      attr_accessor :is_own_account

      sig { returns(Integer) }
      attr_accessor :tweet_count

      sig { returns(String) }
      attr_accessor :x_username

      # Style profile summary with tweet count and ownership flag.
      sig do
        params(
          fetched_at: Time,
          is_own_account: T::Boolean,
          tweet_count: Integer,
          x_username: String
        ).returns(T.attached_class)
      end
      def self.new(fetched_at:, is_own_account:, tweet_count:, x_username:)
      end

      sig do
        override.returns(
          {
            fetched_at: Time,
            is_own_account: T::Boolean,
            tweet_count: Integer,
            x_username: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
