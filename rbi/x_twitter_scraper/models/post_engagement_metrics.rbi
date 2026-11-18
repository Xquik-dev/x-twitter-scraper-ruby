# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PostEngagementMetrics < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::PostEngagementMetrics,
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

      sig do
        params(
          likes: Float,
          replies: Float,
          reposts: Float,
          quotes: Float,
          bookmarks: Float,
          views: Float
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
        views:
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
            views: Float
          }
        )
      end
      def to_hash
      end
    end
  end
end
