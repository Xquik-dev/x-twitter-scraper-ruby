# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # X write actions (tweets, likes, follows, DMs)
      # @return [XTwitterScraper::Resources::X::WriteActions]
      attr_reader :write_actions

      # @return [XTwitterScraper::Resources::X::Tweets]
      attr_reader :tweets

      # @return [XTwitterScraper::Resources::X::Users]
      attr_reader :users

      # Look up, search, and explore user profiles and relationships
      # @return [XTwitterScraper::Resources::X::Followers]
      attr_reader :followers

      # @return [XTwitterScraper::Resources::X::Dm]
      attr_reader :dm

      # @return [XTwitterScraper::Resources::X::Media]
      attr_reader :media

      # X write actions (tweets, likes, follows, DMs)
      # @return [XTwitterScraper::Resources::X::Profile]
      attr_reader :profile

      # @return [XTwitterScraper::Resources::X::Communities]
      attr_reader :communities

      # Connected X account management
      # @return [XTwitterScraper::Resources::X::Accounts]
      attr_reader :accounts

      # Connected X account management
      # @return [XTwitterScraper::Resources::X::AccountConnectionChallenges]
      attr_reader :account_connection_challenges

      # Look up, search, and analyze individual tweets
      # @return [XTwitterScraper::Resources::X::Bookmarks]
      attr_reader :bookmarks

      # X List followers, members, and tweets
      # @return [XTwitterScraper::Resources::X::Lists]
      attr_reader :lists

      # Some parameter documentations has been truncated, see
      # {XTwitterScraper::Models::XGetArticleParams} for more details.
      #
      # Retrieve the full content of an X Article (long-form post) by numeric tweet ID.
      # Returns article_not_found when the tweet is valid but is not an X Article.
      #
      # @overload get_article(tweet_id, request_options: {})
      #
      # @param tweet_id [String] Numeric tweet ID of the article, 15-20 digits. If you have a tweet URL, use the
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::XGetArticleResponse]
      #
      # @see XTwitterScraper::Models::XGetArticleParams
      def get_article(tweet_id, params = {})
        @client.request(
          method: :get,
          path: ["x/articles/%1$s", tweet_id],
          model: XTwitterScraper::Models::XGetArticleResponse,
          options: params[:request_options]
        )
      end

      # Get home timeline
      #
      # @overload get_home_timeline(cursor: nil, seen_tweet_ids: nil, request_options: {})
      #
      # @param cursor [String] Pagination cursor for timeline
      #
      # @param seen_tweet_ids [String] Comma-separated tweet IDs to exclude from results. Empty entries are ignored.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::PaginatedTweets]
      #
      # @see XTwitterScraper::Models::XGetHomeTimelineParams
      def get_home_timeline(params = {})
        parsed, options = XTwitterScraper::XGetHomeTimelineParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "x/timeline",
          query: query.transform_keys(seen_tweet_ids: "seenTweetIds"),
          model: XTwitterScraper::PaginatedTweets,
          options: options
        )
      end

      # Get notifications
      #
      # @overload get_notifications(cursor: nil, type: nil, request_options: {})
      #
      # @param cursor [String] Pagination cursor for notifications
      #
      # @param type [Symbol, XTwitterScraper::Models::XGetNotificationsParams::Type] Notification type filter. Unrecognized values fall back to All.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::XGetNotificationsResponse]
      #
      # @see XTwitterScraper::Models::XGetNotificationsParams
      def get_notifications(params = {})
        parsed, options = XTwitterScraper::XGetNotificationsParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "x/notifications",
          query: query,
          model: XTwitterScraper::Models::XGetNotificationsResponse,
          options: options
        )
      end

      # Get trending hashtags & topics from X by region
      #
      # @overload get_trends(count: nil, woeid: nil, request_options: {})
      #
      # @param count [Integer] Number of trending topics to return (1-50, default 30)
      #
      # @param woeid [Integer] Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::XGetTrendsResponse]
      #
      # @see XTwitterScraper::Models::XGetTrendsParams
      def get_trends(params = {})
        parsed, options = XTwitterScraper::XGetTrendsParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "x/trends",
          query: query,
          model: XTwitterScraper::Models::XGetTrendsResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [XTwitterScraper::Client]
      def initialize(client:)
        @client = client
        @write_actions = XTwitterScraper::Resources::X::WriteActions.new(client: client)
        @tweets = XTwitterScraper::Resources::X::Tweets.new(client: client)
        @users = XTwitterScraper::Resources::X::Users.new(client: client)
        @followers = XTwitterScraper::Resources::X::Followers.new(client: client)
        @dm = XTwitterScraper::Resources::X::Dm.new(client: client)
        @media = XTwitterScraper::Resources::X::Media.new(client: client)
        @profile = XTwitterScraper::Resources::X::Profile.new(client: client)
        @communities = XTwitterScraper::Resources::X::Communities.new(client: client)
        @accounts = XTwitterScraper::Resources::X::Accounts.new(client: client)
        @account_connection_challenges =
          XTwitterScraper::Resources::X::AccountConnectionChallenges.new(client: client)
        @bookmarks = XTwitterScraper::Resources::X::Bookmarks.new(client: client)
        @lists = XTwitterScraper::Resources::X::Lists.new(client: client)
      end
    end
  end
end
