# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#check_repost
      class TweetCheckRepostResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute is_retweeted
        #   Whether the account reposted the post.
        #
        #   @return [Boolean]
        required :is_retweeted, XTwitterScraper::Internal::Type::Boolean, api_name: :isRetweeted

        # @!attribute retweeted_at
        #   When the account reposted it, else null.
        #
        #   @return [Time, nil]
        required :retweeted_at, Time, api_name: :retweetedAt, nil?: true

        # @!attribute retweet_id
        #   The ID of the account's repost, else null.
        #
        #   @return [String, nil]
        required :retweet_id, String, api_name: :retweetId, nil?: true

        # @!attribute tweet_id
        #
        #   @return [String]
        required :tweet_id, String, api_name: :tweetId

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String, api_name: :userId

        # @!attribute checked_posts
        #   How many of the account's newest posts the check read.
        #
        #   @return [Integer]
        required :checked_posts, Integer, api_name: :checkedPosts

        # @!attribute complete
        #   Whether the check read the account's whole timeline.
        #
        #   @return [Boolean]
        required :complete, XTwitterScraper::Internal::Type::Boolean

        # @!method initialize(is_retweeted:, retweeted_at:, retweet_id:, tweet_id:, user_id:, checked_posts:, complete:)
        #   @param is_retweeted [Boolean] Whether the account reposted the post.
        #
        #   @param retweeted_at [Time, nil] When the account reposted it, else null.
        #
        #   @param retweet_id [String, nil] The ID of the account's repost, else null.
        #
        #   @param tweet_id [String]
        #
        #   @param user_id [String]
        #
        #   @param checked_posts [Integer] How many of the account's newest posts the check read.
        #
        #   @param complete [Boolean] Whether the check read the account's whole timeline.
      end
    end
  end
end
