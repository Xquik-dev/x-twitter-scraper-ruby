# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class UserInsights < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::UserInsights,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # ID of the profile the insights describe.
      sig { returns(String) }
      attr_accessor :user_id

      # Username of that profile.
      sig { returns(String) }
      attr_accessor :user_name

      # Followers.
      sig { returns(Float) }
      attr_accessor :followers

      # Accounts the user follows.
      sig { returns(Float) }
      attr_accessor :following

      # Posts the user has made.
      sig { returns(Float) }
      attr_accessor :posts

      # Whole days since the account joined X.
      sig { returns(T.nilable(Float)) }
      attr_accessor :account_age_days

      # True when only the account's followers see its posts. The report then has its
      # counts only.
      sig { returns(T::Boolean) }
      attr_accessor :posts_private

      # The recent posts the read covered.
      sig { returns(XTwitterScraper::Models::UserInsights::Sample) }
      attr_reader :sample

      sig do
        params(
          sample: XTwitterScraper::Models::UserInsights::Sample::OrHash
        ).void
      end
      attr_writer :sample

      # Each count per post of the sample. Null without posts.
      sig do
        returns(T.nilable(XTwitterScraper::Models::UserInsights::Averages))
      end
      attr_reader :averages

      sig do
        params(
          averages:
            T.nilable(XTwitterScraper::Models::UserInsights::Averages::OrHash)
        ).void
      end
      attr_writer :averages

      # Middle view count of the sample, so 1 viral post moves it less than the average.
      # Null without posts.
      sig { returns(T.nilable(Float)) }
      attr_accessor :median_views

      # Average engagements per post, as a percent of followers.
      sig { returns(T.nilable(Float)) }
      attr_accessor :engagement_rate

      # Engagements as a percent of views across the sample.
      sig { returns(T.nilable(Float)) }
      attr_accessor :engagement_per_view

      # Sampled posts per day, from the oldest one until now.
      sig { returns(T.nilable(Float)) }
      attr_accessor :posts_per_day

      # The sampled post with the most engagements.
      sig { returns(T.nilable(String)) }
      attr_accessor :top_post_id

      sig do
        params(
          user_id: String,
          user_name: String,
          followers: Float,
          following: Float,
          posts: Float,
          account_age_days: T.nilable(Float),
          posts_private: T::Boolean,
          sample: XTwitterScraper::Models::UserInsights::Sample::OrHash,
          averages:
            T.nilable(XTwitterScraper::Models::UserInsights::Averages::OrHash),
          median_views: T.nilable(Float),
          engagement_rate: T.nilable(Float),
          engagement_per_view: T.nilable(Float),
          posts_per_day: T.nilable(Float),
          top_post_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the profile the insights describe.
        user_id:,
        # Username of that profile.
        user_name:,
        # Followers.
        followers:,
        # Accounts the user follows.
        following:,
        # Posts the user has made.
        posts:,
        # Whole days since the account joined X.
        account_age_days:,
        # True when only the account's followers see its posts. The report then has its
        # counts only.
        posts_private:,
        # The recent posts the read covered.
        sample:,
        # Each count per post of the sample. Null without posts.
        averages:,
        # Middle view count of the sample, so 1 viral post moves it less than the average.
        # Null without posts.
        median_views:,
        # Average engagements per post, as a percent of followers.
        engagement_rate:,
        # Engagements as a percent of views across the sample.
        engagement_per_view:,
        # Sampled posts per day, from the oldest one until now.
        posts_per_day:,
        # The sampled post with the most engagements.
        top_post_id:
      )
      end

      sig do
        override.returns(
          {
            user_id: String,
            user_name: String,
            followers: Float,
            following: Float,
            posts: Float,
            account_age_days: T.nilable(Float),
            posts_private: T::Boolean,
            sample: XTwitterScraper::Models::UserInsights::Sample,
            averages:
              T.nilable(XTwitterScraper::Models::UserInsights::Averages),
            median_views: T.nilable(Float),
            engagement_rate: T.nilable(Float),
            engagement_per_view: T.nilable(Float),
            posts_per_day: T.nilable(Float),
            top_post_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Sample < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::UserInsights::Sample,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Posts the averages used. Reposts and the pinned post stay out, so this can be
        # lower than `read`.
        sig { returns(Float) }
        attr_accessor :posts

        # Posts read, reposts and the pinned post included.
        sig { returns(Float) }
        attr_accessor :read

        # When the oldest post the averages used went up.
        sig { returns(T.nilable(Time)) }
        attr_accessor :oldest_at

        # When the newest post the averages used went up.
        sig { returns(T.nilable(Time)) }
        attr_accessor :newest_at

        sig do
          params(
            posts: Float,
            read: Float,
            oldest_at: T.nilable(Time),
            newest_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Posts the averages used. Reposts and the pinned post stay out, so this can be
          # lower than `read`.
          posts:,
          # Posts read, reposts and the pinned post included.
          read:,
          # When the oldest post the averages used went up.
          oldest_at:,
          # When the newest post the averages used went up.
          newest_at:
        )
        end

        sig do
          override.returns(
            {
              posts: Float,
              read: Float,
              oldest_at: T.nilable(Time),
              newest_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end
      end

      class Averages < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::UserInsights::Averages,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Likes.
        sig { returns(Float) }
        attr_accessor :likes

        # Replies.
        sig { returns(Float) }
        attr_accessor :replies

        # Reposts.
        sig { returns(Float) }
        attr_accessor :reposts

        # Quotes.
        sig { returns(Float) }
        attr_accessor :quotes

        # Bookmarks.
        sig { returns(Float) }
        attr_accessor :bookmarks

        # Views.
        sig { returns(Float) }
        attr_accessor :views

        # Likes, replies, reposts and quotes per post.
        sig { returns(Float) }
        attr_accessor :engagements

        sig do
          params(
            likes: Float,
            replies: Float,
            reposts: Float,
            quotes: Float,
            bookmarks: Float,
            views: Float,
            engagements: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # Likes.
          likes:,
          # Replies.
          replies:,
          # Reposts.
          reposts:,
          # Quotes.
          quotes:,
          # Bookmarks.
          bookmarks:,
          # Views.
          views:,
          # Likes, replies, reposts and quotes per post.
          engagements:
        )
        end

        sig do
          override.returns(
            {
              likes: Float,
              replies: Float,
              reposts: Float,
              quotes: Float,
              bookmarks: Float,
              views: Float,
              engagements: Float
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
