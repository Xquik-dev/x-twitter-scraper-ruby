# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityAnalytics < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The community ID from your request.
      #
      #   @return [String]
      required :id, String

      # @!attribute period_ends_at
      #   The end of X's latest period, in UTC.
      #
      #   @return [Time]
      required :period_ends_at, Time, api_name: :periodEndsAt

      # @!attribute metrics
      #   The period's activity, each metric with its count and changePercent. likes
      #   counts likes on community posts and newMembers the accounts that joined. posts
      #   counts the community posts and replies the replies to them. uniquePosters counts
      #   the distinct accounts that posted.
      #
      #   @return [XTwitterScraper::Models::CommunityAnalytics::Metrics]
      required :metrics, -> { XTwitterScraper::Models::CommunityAnalytics::Metrics }

      # @!method initialize(id:, period_ends_at:, metrics:)
      #   Community activity & growth for X's latest period.
      #
      #   @param id [String] The community ID from your request.
      #
      #   @param period_ends_at [Time] The end of X's latest period, in UTC.
      #
      #   @param metrics [XTwitterScraper::Models::CommunityAnalytics::Metrics] The period's activity, each metric with its count and changePercent. likes counts likes on community posts and newMembers the accounts that joined. posts counts the community posts and replies the replies to them. uniquePosters counts the distinct accounts that posted.

      class Metrics < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute likes
        #   A community metric for X's latest period & its percent change.
        #
        #   @return [XTwitterScraper::Models::CommunityAnalyticsMetric]
        required :likes, -> { XTwitterScraper::Models::CommunityAnalyticsMetric }

        # @!attribute new_members
        #   A community metric for X's latest period & its percent change.
        #
        #   @return [XTwitterScraper::Models::CommunityAnalyticsMetric]
        required :new_members, -> { XTwitterScraper::Models::CommunityAnalyticsMetric }, api_name: :newMembers

        # @!attribute posts
        #   A community metric for X's latest period & its percent change.
        #
        #   @return [XTwitterScraper::Models::CommunityAnalyticsMetric]
        required :posts, -> { XTwitterScraper::Models::CommunityAnalyticsMetric }

        # @!attribute replies
        #   A community metric for X's latest period & its percent change.
        #
        #   @return [XTwitterScraper::Models::CommunityAnalyticsMetric]
        required :replies, -> { XTwitterScraper::Models::CommunityAnalyticsMetric }

        # @!attribute unique_posters
        #   A community metric for X's latest period & its percent change.
        #
        #   @return [XTwitterScraper::Models::CommunityAnalyticsMetric]
        required :unique_posters, -> { XTwitterScraper::Models::CommunityAnalyticsMetric }, api_name: :uniquePosters

        # @!method initialize(likes:, new_members:, posts:, replies:, unique_posters:)
        #   The period's activity, each metric with its count and changePercent. likes
        #   counts likes on community posts and newMembers the accounts that joined. posts
        #   counts the community posts and replies the replies to them. uniquePosters counts
        #   the distinct accounts that posted.
        #
        #   @param likes [XTwitterScraper::Models::CommunityAnalyticsMetric] A community metric for X's latest period & its percent change.
        #
        #   @param new_members [XTwitterScraper::Models::CommunityAnalyticsMetric] A community metric for X's latest period & its percent change.
        #
        #   @param posts [XTwitterScraper::Models::CommunityAnalyticsMetric] A community metric for X's latest period & its percent change.
        #
        #   @param replies [XTwitterScraper::Models::CommunityAnalyticsMetric] A community metric for X's latest period & its percent change.
        #
        #   @param unique_posters [XTwitterScraper::Models::CommunityAnalyticsMetric] A community metric for X's latest period & its percent change.
      end
    end
  end
end
