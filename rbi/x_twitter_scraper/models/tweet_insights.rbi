# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetInsights < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::TweetInsights,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # ID of the tweet the insights describe.
      sig { returns(String) }
      attr_accessor :tweet_id

      # ID of the author.
      sig { returns(T.nilable(String)) }
      attr_accessor :author_id

      # Username of the author.
      sig { returns(T.nilable(String)) }
      attr_accessor :author_user_name

      # When the tweet went up.
      sig { returns(T.nilable(Time)) }
      attr_accessor :created_at

      # Hours since the tweet went up.
      sig { returns(T.nilable(Float)) }
      attr_accessor :age_hours

      # The public counts of 1 tweet.
      sig { returns(XTwitterScraper::Models::PostEngagementMetrics) }
      attr_reader :metrics

      sig do
        params(
          metrics: XTwitterScraper::Models::PostEngagementMetrics::OrHash
        ).void
      end
      attr_writer :metrics

      # Likes, replies, reposts and quotes.
      sig { returns(Float) }
      attr_accessor :engagements

      # Engagements per hour since the tweet went up.
      sig { returns(T.nilable(Float)) }
      attr_accessor :engagements_per_hour

      # Engagements as a percent of views.
      sig { returns(T.nilable(Float)) }
      attr_accessor :engagement_per_view

      # Engagements as a percent of the author's followers.
      sig { returns(T.nilable(Float)) }
      attr_accessor :engagement_rate

      # Reposts and quotes per like.
      sig { returns(T.nilable(Float)) }
      attr_accessor :amplification

      # Replies per like.
      sig { returns(T.nilable(Float)) }
      attr_accessor :conversation

      sig do
        params(
          tweet_id: String,
          author_id: T.nilable(String),
          author_user_name: T.nilable(String),
          created_at: T.nilable(Time),
          age_hours: T.nilable(Float),
          metrics: XTwitterScraper::Models::PostEngagementMetrics::OrHash,
          engagements: Float,
          engagements_per_hour: T.nilable(Float),
          engagement_per_view: T.nilable(Float),
          engagement_rate: T.nilable(Float),
          amplification: T.nilable(Float),
          conversation: T.nilable(Float)
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the tweet the insights describe.
        tweet_id:,
        # ID of the author.
        author_id:,
        # Username of the author.
        author_user_name:,
        # When the tweet went up.
        created_at:,
        # Hours since the tweet went up.
        age_hours:,
        # The public counts of 1 tweet.
        metrics:,
        # Likes, replies, reposts and quotes.
        engagements:,
        # Engagements per hour since the tweet went up.
        engagements_per_hour:,
        # Engagements as a percent of views.
        engagement_per_view:,
        # Engagements as a percent of the author's followers.
        engagement_rate:,
        # Reposts and quotes per like.
        amplification:,
        # Replies per like.
        conversation:
      )
      end

      sig do
        override.returns(
          {
            tweet_id: String,
            author_id: T.nilable(String),
            author_user_name: T.nilable(String),
            created_at: T.nilable(Time),
            age_hours: T.nilable(Float),
            metrics: XTwitterScraper::Models::PostEngagementMetrics,
            engagements: Float,
            engagements_per_hour: T.nilable(Float),
            engagement_per_view: T.nilable(Float),
            engagement_rate: T.nilable(Float),
            amplification: T.nilable(Float),
            conversation: T.nilable(Float)
          }
        )
      end
      def to_hash
      end
    end
  end
end
