# typed: strong

module XTwitterScraper
  module Models
    # Type of monitor event fired when account activity occurs.
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
      TWEET_MEDIA =
        T.let(:"tweet.media", XTwitterScraper::EventType::TaggedSymbol)
      TWEET_LINK =
        T.let(:"tweet.link", XTwitterScraper::EventType::TaggedSymbol)
      TWEET_POLL =
        T.let(:"tweet.poll", XTwitterScraper::EventType::TaggedSymbol)
      TWEET_MENTION =
        T.let(:"tweet.mention", XTwitterScraper::EventType::TaggedSymbol)
      TWEET_HASHTAG =
        T.let(:"tweet.hashtag", XTwitterScraper::EventType::TaggedSymbol)
      TWEET_LONGFORM =
        T.let(:"tweet.longform", XTwitterScraper::EventType::TaggedSymbol)
      PROFILE_AVATAR_CHANGED =
        T.let(
          :"profile.avatar.changed",
          XTwitterScraper::EventType::TaggedSymbol
        )
      PROFILE_BANNER_CHANGED =
        T.let(
          :"profile.banner.changed",
          XTwitterScraper::EventType::TaggedSymbol
        )
      PROFILE_NAME_CHANGED =
        T.let(:"profile.name.changed", XTwitterScraper::EventType::TaggedSymbol)
      PROFILE_USERNAME_CHANGED =
        T.let(
          :"profile.username.changed",
          XTwitterScraper::EventType::TaggedSymbol
        )
      PROFILE_BIO_CHANGED =
        T.let(:"profile.bio.changed", XTwitterScraper::EventType::TaggedSymbol)
      PROFILE_LOCATION_CHANGED =
        T.let(
          :"profile.location.changed",
          XTwitterScraper::EventType::TaggedSymbol
        )
      PROFILE_URL_CHANGED =
        T.let(:"profile.url.changed", XTwitterScraper::EventType::TaggedSymbol)
      PROFILE_VERIFIED_CHANGED =
        T.let(
          :"profile.verified.changed",
          XTwitterScraper::EventType::TaggedSymbol
        )
      PROFILE_PROTECTED_CHANGED =
        T.let(
          :"profile.protected.changed",
          XTwitterScraper::EventType::TaggedSymbol
        )
      PROFILE_PINNED_TWEET_CHANGED =
        T.let(
          :"profile.pinned_tweet.changed",
          XTwitterScraper::EventType::TaggedSymbol
        )
      PROFILE_UNAVAILABLE_CHANGED =
        T.let(
          :"profile.unavailable.changed",
          XTwitterScraper::EventType::TaggedSymbol
        )

      sig do
        override.returns(T::Array[XTwitterScraper::EventType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
