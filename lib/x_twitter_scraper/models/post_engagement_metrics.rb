# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PostEngagementMetrics < XTwitterScraper::Internal::Type::BaseModel
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

      # @!method initialize(likes:, replies:, reposts:, quotes:, bookmarks:, views:)
      #   The public counts of 1 tweet.
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
    end
  end
end
