# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # Type of monitor event fired when account activity occurs.
    module EventType
      extend XTwitterScraper::Internal::Type::Enum

      TWEET_NEW = :"tweet.new"
      TWEET_REPLY = :"tweet.reply"
      TWEET_RETWEET = :"tweet.retweet"
      TWEET_QUOTE = :"tweet.quote"
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

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
