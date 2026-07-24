# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      # X write actions (tweets, likes, follows, DMs)
      sig { returns(XTwitterScraper::Resources::X::WriteActions) }
      attr_reader :write_actions

      sig { returns(XTwitterScraper::Resources::X::Tweets) }
      attr_reader :tweets

      sig { returns(XTwitterScraper::Resources::X::Users) }
      attr_reader :users

      # Look up, search, and explore user profiles and relationships
      sig { returns(XTwitterScraper::Resources::X::Followers) }
      attr_reader :followers

      sig { returns(XTwitterScraper::Resources::X::Dm) }
      attr_reader :dm

      sig { returns(XTwitterScraper::Resources::X::Media) }
      attr_reader :media

      # X write actions (tweets, likes, follows, DMs)
      sig { returns(XTwitterScraper::Resources::X::Profile) }
      attr_reader :profile

      sig { returns(XTwitterScraper::Resources::X::Communities) }
      attr_reader :communities

      # Connected X account management
      sig { returns(XTwitterScraper::Resources::X::Accounts) }
      attr_reader :accounts

      # Connected X account management
      sig do
        returns(XTwitterScraper::Resources::X::AccountConnectionChallenges)
      end
      attr_reader :account_connection_challenges

      # Look up, search, and analyze individual tweets
      sig { returns(XTwitterScraper::Resources::X::Bookmarks) }
      attr_reader :bookmarks

      # X List followers, members, and tweets
      sig { returns(XTwitterScraper::Resources::X::Lists) }
      attr_reader :lists

      # Retrieve the full content of an X Article (long-form post) by numeric tweet ID.
      # Returns article_not_found when the tweet is valid but is not an X Article.
      sig do
        params(
          tweet_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetArticleResponse)
      end
      def get_article(
        # Numeric tweet ID of the article, 15-20 digits. If you have a tweet URL, use the
        # final status ID.
        tweet_id,
        request_options: {}
      )
      end

      # Get home timeline
      sig do
        params(
          cursor: String,
          seen_tweet_ids: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::PaginatedTweets)
      end
      def get_home_timeline(
        # Pagination cursor for timeline
        cursor: nil,
        # Comma-separated tweet IDs to exclude from results. Empty entries are ignored.
        seen_tweet_ids: nil,
        request_options: {}
      )
      end

      # Get notifications
      sig do
        params(
          cursor: String,
          type: XTwitterScraper::XGetNotificationsParams::Type::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetNotificationsResponse)
      end
      def get_notifications(
        # Pagination cursor for notifications
        cursor: nil,
        # Notification type filter. Unrecognized values fall back to All.
        type: nil,
        request_options: {}
      )
      end

      # Get trending hashtags & topics from X by region
      sig do
        params(
          count: Integer,
          woeid: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetTrendsResponse)
      end
      def get_trends(
        # Number of trending topics to return (1-50, default 30)
        count: nil,
        # Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
        woeid: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
