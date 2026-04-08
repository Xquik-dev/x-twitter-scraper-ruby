# typed: strong

module XTwitterScraper
  module Resources
    # X data lookups (subscription required)
    class X
      sig { returns(XTwitterScraper::Resources::X::Tweets) }
      attr_reader :tweets

      # X data lookups (subscription required)
      sig { returns(XTwitterScraper::Resources::X::Users) }
      attr_reader :users

      # X data lookups (subscription required)
      sig { returns(XTwitterScraper::Resources::X::Followers) }
      attr_reader :followers

      sig { returns(XTwitterScraper::Resources::X::Dm) }
      attr_reader :dm

      # Media upload & download
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

      # X data lookups (subscription required)
      sig { returns(XTwitterScraper::Resources::X::Bookmarks) }
      attr_reader :bookmarks

      # X data lookups (subscription required)
      sig { returns(XTwitterScraper::Resources::X::Lists) }
      attr_reader :lists

      # Retrieve the full content of an X Article (long-form post) by tweet ID.
      sig do
        params(
          tweet_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetArticleResponse)
      end
      def get_article(
        # Tweet ID of the article
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
        ).returns(XTwitterScraper::Models::XGetHomeTimelineResponse)
      end
      def get_home_timeline(
        # Pagination cursor for timeline
        cursor: nil,
        # Comma-separated tweet IDs to exclude from results
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
        # Notification type filter
        type: nil,
        request_options: {}
      )
      end

      # Get trending topics
      sig do
        params(
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::XGetTrendsResponse)
      end
      def get_trends(request_options: {})
      end

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
