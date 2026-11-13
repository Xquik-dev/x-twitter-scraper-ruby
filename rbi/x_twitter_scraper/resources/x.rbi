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

      # Connected X account management
      sig { returns(XTwitterScraper::Resources::X::AccountConnectionAttempts) }
      attr_reader :account_connection_attempts

      # Look up, search, and analyze individual tweets
      sig { returns(XTwitterScraper::Resources::X::Bookmarks) }
      attr_reader :bookmarks

      # X List followers, members, and tweets
      sig { returns(XTwitterScraper::Resources::X::Lists) }
      attr_reader :lists

      # AI analysis of posts, at 2 credits per analyzed post
      sig { returns(XTwitterScraper::Resources::X::Analysis) }
      attr_reader :analysis

      # Retrieve the full content of an X Article (long-form post) by numeric tweet ID.
      # Returns article_not_found when the tweet is valid but is not an X Article.
      sig do
        params(
          tweet_id: String,
          fields: String,
          omit: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetArticleResponse)
      end
      def get_article(
        # Numeric tweet ID of the article, 15-20 digits. If you have a tweet URL, use the
        # final status ID.
        tweet_id,
        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        fields: nil,
        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        omit: nil,
        request_options: {}
      )
      end

      # Get home timeline
      sig do
        params(
          cursor: String,
          seen_tweet_ids: String,
          page_size: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::PaginatedTweets)
      end
      def get_home_timeline(
        # Pagination cursor for timeline
        cursor: nil,
        # Comma-separated tweet IDs to exclude from results. Empty entries are ignored.
        seen_tweet_ids: nil,
        # Items per page, 1 to 100, default 20. Source, filters or credits can return fewer. Follow next_cursor for more pages.
        page_size: nil,
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
          at: String,
          count: Integer,
          country: String,
          fields: String,
          location: String,
          omit: String,
          woeid: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetTrendsResponse)
      end
      def get_trends(
        # A past time, to read what was trending on Twitter then. Takes an ISO 8601 time,
        # a date such as 2026-10-13, or Unix seconds. A time without a zone reads as UTC.
        # It also takes a span back from now, as a number & s, m, h or d. So at=24h reads
        # what was trending on Twitter yesterday at this hour, on every run of a schedule.
        # The answer is the stored list nearest that time, with its own time in
        # capturedAt. History starts 2026-10-13 02:20 UTC. A time over 24 hours from every
        # stored list answers 400 at no charge.
        at: nil,
        # Number of trending topics to return (1-50, default 30)
        count: nil,
        # Country to read trends for, by name or 2-letter code, such as Turkey or TR. Case
        # insensitive. X can add places, so Xquik takes up to 280 characters, the most a
        # post holds.
        country: nil,
        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        fields: nil,
        # Town or country to read trends for, by name, such as Istanbul. Case insensitive.
        # Add country when 2 towns share a name. /x/trends/locations lists every name. X
        # can add places, so Xquik takes up to 280 characters, the most a post holds.
        location: nil,
        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        omit: nil,
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
