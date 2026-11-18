# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PostMetrics < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::PostMetrics,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # A metric's current value & its gain since tracking began. Both are null when X
      # shows no count, as for views on old posts.
      sig { returns(XTwitterScraper::Models::PostMetricReading) }
      attr_reader :views

      sig do
        params(views: XTwitterScraper::Models::PostMetricReading::OrHash).void
      end
      attr_writer :views

      # A metric's current value & its gain since tracking began. Both are null when X
      # shows no count, as for views on old posts.
      sig { returns(XTwitterScraper::Models::PostMetricReading) }
      attr_reader :likes

      sig do
        params(likes: XTwitterScraper::Models::PostMetricReading::OrHash).void
      end
      attr_writer :likes

      # A metric's current value & its gain since tracking began. Both are null when X
      # shows no count, as for views on old posts.
      sig { returns(XTwitterScraper::Models::PostMetricReading) }
      attr_reader :retweets

      sig do
        params(
          retweets: XTwitterScraper::Models::PostMetricReading::OrHash
        ).void
      end
      attr_writer :retweets

      # A metric's current value & its gain since tracking began. Both are null when X
      # shows no count, as for views on old posts.
      sig { returns(XTwitterScraper::Models::PostMetricReading) }
      attr_reader :replies

      sig do
        params(replies: XTwitterScraper::Models::PostMetricReading::OrHash).void
      end
      attr_writer :replies

      # A metric's current value & its gain since tracking began. Both are null when X
      # shows no count, as for views on old posts.
      sig { returns(XTwitterScraper::Models::PostMetricReading) }
      attr_reader :quotes

      sig do
        params(quotes: XTwitterScraper::Models::PostMetricReading::OrHash).void
      end
      attr_writer :quotes

      # A metric's current value & its gain since tracking began. Both are null when X
      # shows no count, as for views on old posts.
      sig { returns(XTwitterScraper::Models::PostMetricReading) }
      attr_reader :bookmarks

      sig do
        params(
          bookmarks: XTwitterScraper::Models::PostMetricReading::OrHash
        ).void
      end
      attr_writer :bookmarks

      sig do
        params(
          views: XTwitterScraper::Models::PostMetricReading::OrHash,
          likes: XTwitterScraper::Models::PostMetricReading::OrHash,
          retweets: XTwitterScraper::Models::PostMetricReading::OrHash,
          replies: XTwitterScraper::Models::PostMetricReading::OrHash,
          quotes: XTwitterScraper::Models::PostMetricReading::OrHash,
          bookmarks: XTwitterScraper::Models::PostMetricReading::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A metric's current value & its gain since tracking began. Both are null when X
        # shows no count, as for views on old posts.
        views:,
        # A metric's current value & its gain since tracking began. Both are null when X
        # shows no count, as for views on old posts.
        likes:,
        # A metric's current value & its gain since tracking began. Both are null when X
        # shows no count, as for views on old posts.
        retweets:,
        # A metric's current value & its gain since tracking began. Both are null when X
        # shows no count, as for views on old posts.
        replies:,
        # A metric's current value & its gain since tracking began. Both are null when X
        # shows no count, as for views on old posts.
        quotes:,
        # A metric's current value & its gain since tracking began. Both are null when X
        # shows no count, as for views on old posts.
        bookmarks:
      )
      end

      sig do
        override.returns(
          {
            views: XTwitterScraper::Models::PostMetricReading,
            likes: XTwitterScraper::Models::PostMetricReading,
            retweets: XTwitterScraper::Models::PostMetricReading,
            replies: XTwitterScraper::Models::PostMetricReading,
            quotes: XTwitterScraper::Models::PostMetricReading,
            bookmarks: XTwitterScraper::Models::PostMetricReading
          }
        )
      end
      def to_hash
      end
    end
  end
end
