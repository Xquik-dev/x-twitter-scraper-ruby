# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetCheckRepostResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetCheckRepostResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Whether the account reposted the post.
        sig { returns(T::Boolean) }
        attr_accessor :is_retweeted

        # When the account reposted it, else null.
        sig { returns(T.nilable(Time)) }
        attr_accessor :retweeted_at

        # The ID of the account's repost, else null.
        sig { returns(T.nilable(String)) }
        attr_accessor :retweet_id

        sig { returns(String) }
        attr_accessor :tweet_id

        sig { returns(String) }
        attr_accessor :user_id

        # How many of the account's newest posts the check read.
        sig { returns(Integer) }
        attr_accessor :checked_posts

        # Whether the check read the account's whole timeline.
        sig { returns(T::Boolean) }
        attr_accessor :complete

        sig do
          params(
            is_retweeted: T::Boolean,
            retweeted_at: T.nilable(Time),
            retweet_id: T.nilable(String),
            tweet_id: String,
            user_id: String,
            checked_posts: Integer,
            complete: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the account reposted the post.
          is_retweeted:,
          # When the account reposted it, else null.
          retweeted_at:,
          # The ID of the account's repost, else null.
          retweet_id:,
          tweet_id:,
          user_id:,
          # How many of the account's newest posts the check read.
          checked_posts:,
          # Whether the check read the account's whole timeline.
          complete:
        )
        end

        sig do
          override.returns(
            {
              is_retweeted: T::Boolean,
              retweeted_at: T.nilable(Time),
              retweet_id: T.nilable(String),
              tweet_id: String,
              user_id: String,
              checked_posts: Integer,
              complete: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
