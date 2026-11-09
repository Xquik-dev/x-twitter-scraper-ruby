# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    # Type of event an account, keyword or post monitor fires, as events and
    # webhooks name it.
    module StreamEventType
      extend XTwitterScraper::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, XTwitterScraper::StreamEventType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      TWEET_NEW =
        T.let(:"tweet.new", XTwitterScraper::StreamEventType::TaggedSymbol)
      TWEET_REPLY =
        T.let(:"tweet.reply", XTwitterScraper::StreamEventType::TaggedSymbol)
      TWEET_QUOTE =
        T.let(:"tweet.quote", XTwitterScraper::StreamEventType::TaggedSymbol)
      TWEET_RETWEET =
        T.let(:"tweet.retweet", XTwitterScraper::StreamEventType::TaggedSymbol)
      TWEET_MEDIA =
        T.let(:"tweet.media", XTwitterScraper::StreamEventType::TaggedSymbol)
      TWEET_LINK =
        T.let(:"tweet.link", XTwitterScraper::StreamEventType::TaggedSymbol)
      TWEET_POLL =
        T.let(:"tweet.poll", XTwitterScraper::StreamEventType::TaggedSymbol)
      TWEET_MENTION =
        T.let(:"tweet.mention", XTwitterScraper::StreamEventType::TaggedSymbol)
      TWEET_HASHTAG =
        T.let(:"tweet.hashtag", XTwitterScraper::StreamEventType::TaggedSymbol)
      TWEET_LONGFORM =
        T.let(:"tweet.longform", XTwitterScraper::StreamEventType::TaggedSymbol)
      PROFILE_AVATAR_CHANGED =
        T.let(
          :"profile.avatar.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      PROFILE_BANNER_CHANGED =
        T.let(
          :"profile.banner.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      PROFILE_NAME_CHANGED =
        T.let(
          :"profile.name.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      PROFILE_USERNAME_CHANGED =
        T.let(
          :"profile.username.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      PROFILE_BIO_CHANGED =
        T.let(
          :"profile.bio.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      PROFILE_LOCATION_CHANGED =
        T.let(
          :"profile.location.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      PROFILE_URL_CHANGED =
        T.let(
          :"profile.url.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      PROFILE_VERIFIED_CHANGED =
        T.let(
          :"profile.verified.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      PROFILE_PROTECTED_CHANGED =
        T.let(
          :"profile.protected.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      PROFILE_PINNED_TWEET_CHANGED =
        T.let(
          :"profile.pinned_tweet.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      PROFILE_UNAVAILABLE_CHANGED =
        T.let(
          :"profile.unavailable.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      TWEET_DELETED =
        T.let(:"tweet.deleted", XTwitterScraper::StreamEventType::TaggedSymbol)
      BROADCAST_STARTED =
        T.let(
          :"broadcast.started",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      SPACE_STARTED =
        T.let(:"space.started", XTwitterScraper::StreamEventType::TaggedSymbol)
      FOLLOWING_ADDED =
        T.let(
          :"following.added",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      FOLLOWING_REMOVED =
        T.let(
          :"following.removed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      FOLLOWER_ADDED =
        T.let(:"follower.added", XTwitterScraper::StreamEventType::TaggedSymbol)
      FOLLOWER_REMOVED =
        T.let(
          :"follower.removed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      PROFILE_FOLLOWERS_CHANGED =
        T.let(
          :"profile.followers.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      PROFILE_FOLLOWING_CHANGED =
        T.let(
          :"profile.following.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      POST_REPLY_NEW =
        T.let(:"post.reply.new", XTwitterScraper::StreamEventType::TaggedSymbol)
      POST_QUOTE_NEW =
        T.let(:"post.quote.new", XTwitterScraper::StreamEventType::TaggedSymbol)
      POST_LIKES_CHANGED =
        T.let(
          :"post.likes.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      POST_RETWEETS_CHANGED =
        T.let(
          :"post.retweets.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      POST_REPLIES_CHANGED =
        T.let(
          :"post.replies.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      POST_QUOTES_CHANGED =
        T.let(
          :"post.quotes.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      POST_BOOKMARKS_CHANGED =
        T.let(
          :"post.bookmarks.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      POST_VIEWS_CHANGED =
        T.let(
          :"post.views.changed",
          XTwitterScraper::StreamEventType::TaggedSymbol
        )
      POST_EDITED =
        T.let(:"post.edited", XTwitterScraper::StreamEventType::TaggedSymbol)
      POST_DELETED =
        T.let(:"post.deleted", XTwitterScraper::StreamEventType::TaggedSymbol)

      sig do
        override.returns(
          T::Array[XTwitterScraper::StreamEventType::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
