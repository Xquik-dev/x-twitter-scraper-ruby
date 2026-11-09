# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # Type of event an account, keyword or post monitor fires, as events and
    # webhooks name it.
    module StreamEventType
      extend XTwitterScraper::Internal::Type::Enum

      TWEET_NEW = :"tweet.new"
      TWEET_REPLY = :"tweet.reply"
      TWEET_QUOTE = :"tweet.quote"
      TWEET_RETWEET = :"tweet.retweet"
      TWEET_MEDIA = :"tweet.media"
      TWEET_LINK = :"tweet.link"
      TWEET_POLL = :"tweet.poll"
      TWEET_MENTION = :"tweet.mention"
      TWEET_HASHTAG = :"tweet.hashtag"
      TWEET_LONGFORM = :"tweet.longform"
      PROFILE_AVATAR_CHANGED = :"profile.avatar.changed"
      PROFILE_BANNER_CHANGED = :"profile.banner.changed"
      PROFILE_NAME_CHANGED = :"profile.name.changed"
      PROFILE_USERNAME_CHANGED = :"profile.username.changed"
      PROFILE_BIO_CHANGED = :"profile.bio.changed"
      PROFILE_LOCATION_CHANGED = :"profile.location.changed"
      PROFILE_URL_CHANGED = :"profile.url.changed"
      PROFILE_VERIFIED_CHANGED = :"profile.verified.changed"
      PROFILE_PROTECTED_CHANGED = :"profile.protected.changed"
      PROFILE_PINNED_TWEET_CHANGED = :"profile.pinned_tweet.changed"
      PROFILE_UNAVAILABLE_CHANGED = :"profile.unavailable.changed"
      TWEET_DELETED = :"tweet.deleted"
      BROADCAST_STARTED = :"broadcast.started"
      SPACE_STARTED = :"space.started"
      FOLLOWING_ADDED = :"following.added"
      FOLLOWING_REMOVED = :"following.removed"
      FOLLOWER_ADDED = :"follower.added"
      FOLLOWER_REMOVED = :"follower.removed"
      PROFILE_FOLLOWERS_CHANGED = :"profile.followers.changed"
      PROFILE_FOLLOWING_CHANGED = :"profile.following.changed"
      POST_REPLY_NEW = :"post.reply.new"
      POST_QUOTE_NEW = :"post.quote.new"
      POST_LIKES_CHANGED = :"post.likes.changed"
      POST_RETWEETS_CHANGED = :"post.retweets.changed"
      POST_REPLIES_CHANGED = :"post.replies.changed"
      POST_QUOTES_CHANGED = :"post.quotes.changed"
      POST_BOOKMARKS_CHANGED = :"post.bookmarks.changed"
      POST_VIEWS_CHANGED = :"post.views.changed"
      POST_EDITED = :"post.edited"
      POST_DELETED = :"post.deleted"

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
