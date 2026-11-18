# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetInsights < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute tweet_id
      #   ID of the tweet the insights describe.
      #
      #   @return [String]
      required :tweet_id, String, api_name: :tweetId

      # @!attribute author_id
      #   ID of the author.
      #
      #   @return [String, nil]
      required :author_id, String, api_name: :authorId, nil?: true

      # @!attribute author_user_name
      #   Username of the author.
      #
      #   @return [String, nil]
      required :author_user_name, String, api_name: :authorUserName, nil?: true

      # @!attribute created_at
      #   When the tweet went up.
      #
      #   @return [Time, nil]
      required :created_at, Time, api_name: :createdAt, nil?: true

      # @!attribute age_hours
      #   Hours since the tweet went up.
      #
      #   @return [Float, nil]
      required :age_hours, Float, api_name: :ageHours, nil?: true

      # @!attribute metrics
      #   The public counts of 1 tweet.
      #
      #   @return [XTwitterScraper::Models::PostEngagementMetrics]
      required :metrics, -> { XTwitterScraper::Models::PostEngagementMetrics }

      # @!attribute engagements
      #   Likes, replies, reposts and quotes.
      #
      #   @return [Float]
      required :engagements, Float

      # @!attribute engagements_per_hour
      #   Engagements per hour since the tweet went up.
      #
      #   @return [Float, nil]
      required :engagements_per_hour, Float, api_name: :engagementsPerHour, nil?: true

      # @!attribute engagement_per_view
      #   Engagements as a percent of views.
      #
      #   @return [Float, nil]
      required :engagement_per_view, Float, api_name: :engagementPerView, nil?: true

      # @!attribute engagement_rate
      #   Engagements as a percent of the author's followers.
      #
      #   @return [Float, nil]
      required :engagement_rate, Float, api_name: :engagementRate, nil?: true

      # @!attribute amplification
      #   Reposts and quotes per like.
      #
      #   @return [Float, nil]
      required :amplification, Float, nil?: true

      # @!attribute conversation
      #   Replies per like.
      #
      #   @return [Float, nil]
      required :conversation, Float, nil?: true

      # @!method initialize(tweet_id:, author_id:, author_user_name:, created_at:, age_hours:, metrics:, engagements:, engagements_per_hour:, engagement_per_view:, engagement_rate:, amplification:, conversation:)
      #   Engagement insights of 1 tweet. Engagements are likes, replies, reposts and
      #   quotes. A rate is null when nothing divides it, such as a tweet without views.
      #
      #   @param tweet_id [String] ID of the tweet the insights describe.
      #
      #   @param author_id [String, nil] ID of the author.
      #
      #   @param author_user_name [String, nil] Username of the author.
      #
      #   @param created_at [Time, nil] When the tweet went up.
      #
      #   @param age_hours [Float, nil] Hours since the tweet went up.
      #
      #   @param metrics [XTwitterScraper::Models::PostEngagementMetrics] The public counts of 1 tweet.
      #
      #   @param engagements [Float] Likes, replies, reposts and quotes.
      #
      #   @param engagements_per_hour [Float, nil] Engagements per hour since the tweet went up.
      #
      #   @param engagement_per_view [Float, nil] Engagements as a percent of views.
      #
      #   @param engagement_rate [Float, nil] Engagements as a percent of the author's followers.
      #
      #   @param amplification [Float, nil] Reposts and quotes per like.
      #
      #   @param conversation [Float, nil] Replies per like.
    end
  end
end
