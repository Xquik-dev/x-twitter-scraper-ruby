# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PostMonitorMetrics < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute hours
      #
      #   @return [Integer]
      required :hours, Integer

      # @!attribute buckets
      #
      #   @return [Array<XTwitterScraper::Models::PostMonitorMetrics::Bucket>]
      required :buckets, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::PostMonitorMetrics::Bucket] }

      # @!method initialize(hours:, buckets:)
      #   Hourly metric buckets of 1 post monitor, oldest first.
      #
      #   @param hours [Integer]
      #
      #   @param buckets [Array<XTwitterScraper::Models::PostMonitorMetrics::Bucket>]

      class Bucket < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute at
        #   Start of the hour.
        #
        #   @return [Time]
        required :at, Time

        # @!attribute metrics
        #
        #   @return [XTwitterScraper::Models::PostMonitorMetrics::Bucket::Metrics]
        required :metrics, -> { XTwitterScraper::Models::PostMonitorMetrics::Bucket::Metrics }

        # @!method initialize(at:, metrics:)
        #   @param at [Time] Start of the hour.
        #
        #   @param metrics [XTwitterScraper::Models::PostMonitorMetrics::Bucket::Metrics]

        class Metrics < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute views
          #   A metric's value at the hour's end & its gain over that hour. Both are null when
          #   X shows no count.
          #
          #   @return [XTwitterScraper::Models::PostMetricPoint]
          required :views, -> { XTwitterScraper::Models::PostMetricPoint }

          # @!attribute likes
          #   A metric's value at the hour's end & its gain over that hour. Both are null when
          #   X shows no count.
          #
          #   @return [XTwitterScraper::Models::PostMetricPoint]
          required :likes, -> { XTwitterScraper::Models::PostMetricPoint }

          # @!attribute retweets
          #   A metric's value at the hour's end & its gain over that hour. Both are null when
          #   X shows no count.
          #
          #   @return [XTwitterScraper::Models::PostMetricPoint]
          required :retweets, -> { XTwitterScraper::Models::PostMetricPoint }

          # @!attribute replies
          #   A metric's value at the hour's end & its gain over that hour. Both are null when
          #   X shows no count.
          #
          #   @return [XTwitterScraper::Models::PostMetricPoint]
          required :replies, -> { XTwitterScraper::Models::PostMetricPoint }

          # @!attribute quotes
          #   A metric's value at the hour's end & its gain over that hour. Both are null when
          #   X shows no count.
          #
          #   @return [XTwitterScraper::Models::PostMetricPoint]
          required :quotes, -> { XTwitterScraper::Models::PostMetricPoint }

          # @!attribute bookmarks
          #   A metric's value at the hour's end & its gain over that hour. Both are null when
          #   X shows no count.
          #
          #   @return [XTwitterScraper::Models::PostMetricPoint]
          required :bookmarks, -> { XTwitterScraper::Models::PostMetricPoint }

          # @!method initialize(views:, likes:, retweets:, replies:, quotes:, bookmarks:)
          #   @param views [XTwitterScraper::Models::PostMetricPoint] A metric's value at the hour's end & its gain over that hour. Both are null when X shows no count.
          #
          #   @param likes [XTwitterScraper::Models::PostMetricPoint] A metric's value at the hour's end & its gain over that hour. Both are null when X shows no count.
          #
          #   @param retweets [XTwitterScraper::Models::PostMetricPoint] A metric's value at the hour's end & its gain over that hour. Both are null when X shows no count.
          #
          #   @param replies [XTwitterScraper::Models::PostMetricPoint] A metric's value at the hour's end & its gain over that hour. Both are null when X shows no count.
          #
          #   @param quotes [XTwitterScraper::Models::PostMetricPoint] A metric's value at the hour's end & its gain over that hour. Both are null when X shows no count.
          #
          #   @param bookmarks [XTwitterScraper::Models::PostMetricPoint] A metric's value at the hour's end & its gain over that hour. Both are null when X shows no count.
        end
      end
    end
  end
end
