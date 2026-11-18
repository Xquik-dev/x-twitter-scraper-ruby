# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class UserInsights < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute user_id
      #   ID of the profile the insights describe.
      #
      #   @return [String]
      required :user_id, String, api_name: :userId

      # @!attribute user_name
      #   Username of that profile.
      #
      #   @return [String]
      required :user_name, String, api_name: :userName

      # @!attribute followers
      #   Followers.
      #
      #   @return [Float]
      required :followers, Float

      # @!attribute following
      #   Accounts the user follows.
      #
      #   @return [Float]
      required :following, Float

      # @!attribute posts
      #   Posts the user has made.
      #
      #   @return [Float]
      required :posts, Float

      # @!attribute account_age_days
      #   Whole days since the account joined X.
      #
      #   @return [Float, nil]
      required :account_age_days, Float, api_name: :accountAgeDays, nil?: true

      # @!attribute posts_private
      #   True when only the account's followers see its posts. The report then has its
      #   counts only.
      #
      #   @return [Boolean]
      required :posts_private, XTwitterScraper::Internal::Type::Boolean, api_name: :postsPrivate

      # @!attribute sample
      #   The recent posts the read covered.
      #
      #   @return [XTwitterScraper::Models::UserInsights::Sample]
      required :sample, -> { XTwitterScraper::Models::UserInsights::Sample }

      # @!attribute averages
      #   Each count per post of the sample. Null without posts.
      #
      #   @return [XTwitterScraper::Models::UserInsights::Averages, nil]
      required :averages, -> { XTwitterScraper::Models::UserInsights::Averages }, nil?: true

      # @!attribute median_views
      #   Middle view count of the sample, so 1 viral post moves it less than the average.
      #   Null without posts.
      #
      #   @return [Float, nil]
      required :median_views, Float, api_name: :medianViews, nil?: true

      # @!attribute engagement_rate
      #   Average engagements per post, as a percent of followers.
      #
      #   @return [Float, nil]
      required :engagement_rate, Float, api_name: :engagementRate, nil?: true

      # @!attribute engagement_per_view
      #   Engagements as a percent of views across the sample.
      #
      #   @return [Float, nil]
      required :engagement_per_view, Float, api_name: :engagementPerView, nil?: true

      # @!attribute posts_per_day
      #   Sampled posts per day, from the oldest one until now.
      #
      #   @return [Float, nil]
      required :posts_per_day, Float, api_name: :postsPerDay, nil?: true

      # @!attribute top_post_id
      #   The sampled post with the most engagements.
      #
      #   @return [String, nil]
      required :top_post_id, String, api_name: :topPostId, nil?: true

      # @!method initialize(user_id:, user_name:, followers:, following:, posts:, account_age_days:, posts_private:, sample:, averages:, median_views:, engagement_rate:, engagement_per_view:, posts_per_day:, top_post_id:)
      #   Engagement insights of 1 profile. Engagements are likes, replies, reposts and
      #   quotes. A rate is null when nothing divides it, such as a profile without posts
      #   of its own.
      #
      #   @param user_id [String] ID of the profile the insights describe.
      #
      #   @param user_name [String] Username of that profile.
      #
      #   @param followers [Float] Followers.
      #
      #   @param following [Float] Accounts the user follows.
      #
      #   @param posts [Float] Posts the user has made.
      #
      #   @param account_age_days [Float, nil] Whole days since the account joined X.
      #
      #   @param posts_private [Boolean] True when only the account's followers see its posts. The report then has its counts only.
      #
      #   @param sample [XTwitterScraper::Models::UserInsights::Sample] The recent posts the read covered.
      #
      #   @param averages [XTwitterScraper::Models::UserInsights::Averages, nil] Each count per post of the sample. Null without posts.
      #
      #   @param median_views [Float, nil] Middle view count of the sample, so 1 viral post moves it less than the average. Null without posts.
      #
      #   @param engagement_rate [Float, nil] Average engagements per post, as a percent of followers.
      #
      #   @param engagement_per_view [Float, nil] Engagements as a percent of views across the sample.
      #
      #   @param posts_per_day [Float, nil] Sampled posts per day, from the oldest one until now.
      #
      #   @param top_post_id [String, nil] The sampled post with the most engagements.

      class Sample < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute posts
        #   Posts the averages used. Reposts and the pinned post stay out, so this can be
        #   lower than `read`.
        #
        #   @return [Float]
        required :posts, Float

        # @!attribute read
        #   Posts read, reposts and the pinned post included.
        #
        #   @return [Float]
        required :read, Float

        # @!attribute oldest_at
        #   When the oldest post the averages used went up.
        #
        #   @return [Time, nil]
        required :oldest_at, Time, api_name: :oldestAt, nil?: true

        # @!attribute newest_at
        #   When the newest post the averages used went up.
        #
        #   @return [Time, nil]
        required :newest_at, Time, api_name: :newestAt, nil?: true

        # @!method initialize(posts:, read:, oldest_at:, newest_at:)
        #   The recent posts the read covered.
        #
        #   @param posts [Float] Posts the averages used. Reposts and the pinned post stay out, so this can be lower than `read`.
        #
        #   @param read [Float] Posts read, reposts and the pinned post included.
        #
        #   @param oldest_at [Time, nil] When the oldest post the averages used went up.
        #
        #   @param newest_at [Time, nil] When the newest post the averages used went up.
      end

      class Averages < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute likes
        #   Likes.
        #
        #   @return [Float]
        required :likes, Float

        # @!attribute replies
        #   Replies.
        #
        #   @return [Float]
        required :replies, Float

        # @!attribute reposts
        #   Reposts.
        #
        #   @return [Float]
        required :reposts, Float

        # @!attribute quotes
        #   Quotes.
        #
        #   @return [Float]
        required :quotes, Float

        # @!attribute bookmarks
        #   Bookmarks.
        #
        #   @return [Float]
        required :bookmarks, Float

        # @!attribute views
        #   Views.
        #
        #   @return [Float]
        required :views, Float

        # @!attribute engagements
        #   Likes, replies, reposts and quotes per post.
        #
        #   @return [Float]
        required :engagements, Float

        # @!method initialize(likes:, replies:, reposts:, quotes:, bookmarks:, views:, engagements:)
        #   Each count per post of the sample. Null without posts.
        #
        #   @param likes [Float] Likes.
        #
        #   @param replies [Float] Replies.
        #
        #   @param reposts [Float] Reposts.
        #
        #   @param quotes [Float] Quotes.
        #
        #   @param bookmarks [Float] Bookmarks.
        #
        #   @param views [Float] Views.
        #
        #   @param engagements [Float] Likes, replies, reposts and quotes per post.
      end
    end
  end
end
