# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PostMetrics < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute views
      #   A metric's current value & its gain since tracking began. Both are null when X
      #   shows no count, as for views on old posts.
      #
      #   @return [XTwitterScraper::Models::PostMetricReading]
      required :views, -> { XTwitterScraper::Models::PostMetricReading }

      # @!attribute likes
      #   A metric's current value & its gain since tracking began. Both are null when X
      #   shows no count, as for views on old posts.
      #
      #   @return [XTwitterScraper::Models::PostMetricReading]
      required :likes, -> { XTwitterScraper::Models::PostMetricReading }

      # @!attribute retweets
      #   A metric's current value & its gain since tracking began. Both are null when X
      #   shows no count, as for views on old posts.
      #
      #   @return [XTwitterScraper::Models::PostMetricReading]
      required :retweets, -> { XTwitterScraper::Models::PostMetricReading }

      # @!attribute replies
      #   A metric's current value & its gain since tracking began. Both are null when X
      #   shows no count, as for views on old posts.
      #
      #   @return [XTwitterScraper::Models::PostMetricReading]
      required :replies, -> { XTwitterScraper::Models::PostMetricReading }

      # @!attribute quotes
      #   A metric's current value & its gain since tracking began. Both are null when X
      #   shows no count, as for views on old posts.
      #
      #   @return [XTwitterScraper::Models::PostMetricReading]
      required :quotes, -> { XTwitterScraper::Models::PostMetricReading }

      # @!attribute bookmarks
      #   A metric's current value & its gain since tracking began. Both are null when X
      #   shows no count, as for views on old posts.
      #
      #   @return [XTwitterScraper::Models::PostMetricReading]
      required :bookmarks, -> { XTwitterScraper::Models::PostMetricReading }

      # @!method initialize(views:, likes:, retweets:, replies:, quotes:, bookmarks:)
      #   The 6 metrics of a post.
      #
      #   @param views [XTwitterScraper::Models::PostMetricReading] A metric's current value & its gain since tracking began. Both are null when X shows no count, as for views on old posts.
      #
      #   @param likes [XTwitterScraper::Models::PostMetricReading] A metric's current value & its gain since tracking began. Both are null when X shows no count, as for views on old posts.
      #
      #   @param retweets [XTwitterScraper::Models::PostMetricReading] A metric's current value & its gain since tracking began. Both are null when X shows no count, as for views on old posts.
      #
      #   @param replies [XTwitterScraper::Models::PostMetricReading] A metric's current value & its gain since tracking began. Both are null when X shows no count, as for views on old posts.
      #
      #   @param quotes [XTwitterScraper::Models::PostMetricReading] A metric's current value & its gain since tracking began. Both are null when X shows no count, as for views on old posts.
      #
      #   @param bookmarks [XTwitterScraper::Models::PostMetricReading] A metric's current value & its gain since tracking began. Both are null when X shows no count, as for views on old posts.
    end
  end
end
