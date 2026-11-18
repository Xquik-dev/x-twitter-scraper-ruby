# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityAnalytics < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CommunityAnalytics,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The community ID from your request.
      sig { returns(String) }
      attr_accessor :id

      # The end of X's latest period, in UTC.
      sig { returns(Time) }
      attr_accessor :period_ends_at

      # The period's activity, each metric with its count and changePercent. likes
      # counts likes on community posts and newMembers the accounts that joined. posts
      # counts the community posts and replies the replies to them. uniquePosters counts
      # the distinct accounts that posted.
      sig { returns(XTwitterScraper::Models::CommunityAnalytics::Metrics) }
      attr_reader :metrics

      sig do
        params(
          metrics: XTwitterScraper::Models::CommunityAnalytics::Metrics::OrHash
        ).void
      end
      attr_writer :metrics

      sig do
        params(
          id: String,
          period_ends_at: Time,
          metrics: XTwitterScraper::Models::CommunityAnalytics::Metrics::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The community ID from your request.
        id:,
        # The end of X's latest period, in UTC.
        period_ends_at:,
        # The period's activity, each metric with its count and changePercent. likes
        # counts likes on community posts and newMembers the accounts that joined. posts
        # counts the community posts and replies the replies to them. uniquePosters counts
        # the distinct accounts that posted.
        metrics:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            period_ends_at: Time,
            metrics: XTwitterScraper::Models::CommunityAnalytics::Metrics
          }
        )
      end
      def to_hash
      end

      class Metrics < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::CommunityAnalytics::Metrics,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # A community metric for X's latest period & its percent change.
        sig { returns(XTwitterScraper::Models::CommunityAnalyticsMetric) }
        attr_reader :likes

        sig do
          params(
            likes: XTwitterScraper::Models::CommunityAnalyticsMetric::OrHash
          ).void
        end
        attr_writer :likes

        # A community metric for X's latest period & its percent change.
        sig { returns(XTwitterScraper::Models::CommunityAnalyticsMetric) }
        attr_reader :new_members

        sig do
          params(
            new_members:
              XTwitterScraper::Models::CommunityAnalyticsMetric::OrHash
          ).void
        end
        attr_writer :new_members

        # A community metric for X's latest period & its percent change.
        sig { returns(XTwitterScraper::Models::CommunityAnalyticsMetric) }
        attr_reader :posts

        sig do
          params(
            posts: XTwitterScraper::Models::CommunityAnalyticsMetric::OrHash
          ).void
        end
        attr_writer :posts

        # A community metric for X's latest period & its percent change.
        sig { returns(XTwitterScraper::Models::CommunityAnalyticsMetric) }
        attr_reader :replies

        sig do
          params(
            replies: XTwitterScraper::Models::CommunityAnalyticsMetric::OrHash
          ).void
        end
        attr_writer :replies

        # A community metric for X's latest period & its percent change.
        sig { returns(XTwitterScraper::Models::CommunityAnalyticsMetric) }
        attr_reader :unique_posters

        sig do
          params(
            unique_posters:
              XTwitterScraper::Models::CommunityAnalyticsMetric::OrHash
          ).void
        end
        attr_writer :unique_posters

        sig do
          params(
            likes: XTwitterScraper::Models::CommunityAnalyticsMetric::OrHash,
            new_members:
              XTwitterScraper::Models::CommunityAnalyticsMetric::OrHash,
            posts: XTwitterScraper::Models::CommunityAnalyticsMetric::OrHash,
            replies: XTwitterScraper::Models::CommunityAnalyticsMetric::OrHash,
            unique_posters:
              XTwitterScraper::Models::CommunityAnalyticsMetric::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # A community metric for X's latest period & its percent change.
          likes:,
          # A community metric for X's latest period & its percent change.
          new_members:,
          # A community metric for X's latest period & its percent change.
          posts:,
          # A community metric for X's latest period & its percent change.
          replies:,
          # A community metric for X's latest period & its percent change.
          unique_posters:
        )
        end

        sig do
          override.returns(
            {
              likes: XTwitterScraper::Models::CommunityAnalyticsMetric,
              new_members: XTwitterScraper::Models::CommunityAnalyticsMetric,
              posts: XTwitterScraper::Models::CommunityAnalyticsMetric,
              replies: XTwitterScraper::Models::CommunityAnalyticsMetric,
              unique_posters: XTwitterScraper::Models::CommunityAnalyticsMetric
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
