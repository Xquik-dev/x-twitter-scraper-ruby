# typed: strong

module XTwitterScraper
  module Models
    module EventType
      extend XTwitterScraper::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, XTwitterScraper::EventType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      TWEET_NEW = T.let(:"tweet.new", XTwitterScraper::EventType::TaggedSymbol)
      TWEET_REPLY =
        T.let(:"tweet.reply", XTwitterScraper::EventType::TaggedSymbol)
      TWEET_RETWEET =
        T.let(:"tweet.retweet", XTwitterScraper::EventType::TaggedSymbol)
      TWEET_QUOTE =
        T.let(:"tweet.quote", XTwitterScraper::EventType::TaggedSymbol)
      FOLLOWER_GAINED =
        T.let(:"follower.gained", XTwitterScraper::EventType::TaggedSymbol)
      FOLLOWER_LOST =
        T.let(:"follower.lost", XTwitterScraper::EventType::TaggedSymbol)

      sig do
        override.returns(T::Array[XTwitterScraper::EventType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
