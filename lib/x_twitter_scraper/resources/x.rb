# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # X data lookups (subscription required)
    class X
      # @return [XTwitterScraper::Resources::X::Tweets]
      attr_reader :tweets

      # X data lookups (subscription required)
      # @return [XTwitterScraper::Resources::X::Users]
      attr_reader :users

      # X data lookups (subscription required)
      # @return [XTwitterScraper::Resources::X::Followers]
      attr_reader :followers

      # @return [XTwitterScraper::Resources::X::Dm]
      attr_reader :dm

      # Media upload & download
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

      # X data lookups (subscription required)
      # @return [XTwitterScraper::Resources::X::Bookmarks]
      attr_reader :bookmarks

      # X data lookups (subscription required)
      # @return [XTwitterScraper::Resources::X::Lists]
      attr_reader :lists

      # Retrieve the full content of an X Article (long-form post) by tweet ID.
      #
      # @overload get_article(tweet_id, request_options: {})
      #
      # @param tweet_id [String]
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
      # @param cursor [String] Pagination cursor from previous response
      #
      # @param seen_tweet_ids [String] Comma-separated tweet IDs to exclude from results
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::XGetHomeTimelineResponse]
      #
      # @see XTwitterScraper::Models::XGetHomeTimelineParams
      def get_home_timeline(params = {})
        parsed, options = XTwitterScraper::XGetHomeTimelineParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "x/timeline",
          query: query.transform_keys(seen_tweet_ids: "seenTweetIds"),
          model: XTwitterScraper::Models::XGetHomeTimelineResponse,
          options: options
        )
      end

      # Get notifications
      #
      # @overload get_notifications(cursor: nil, type: nil, request_options: {})
      #
      # @param cursor [String] Pagination cursor from previous response
      #
      # @param type [Symbol, XTwitterScraper::Models::XGetNotificationsParams::Type] Notification type filter
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

      # Get trending topics
      #
      # @overload get_trends(request_options: {})
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see XTwitterScraper::Models::XGetTrendsParams
      def get_trends(params = {})
        @client.request(method: :get, path: "x/trends", model: NilClass, options: params[:request_options])
      end

      # @api private
      #
      # @param client [XTwitterScraper::Client]
      def initialize(client:)
        @client = client
        @tweets = XTwitterScraper::Resources::X::Tweets.new(client: client)
        @users = XTwitterScraper::Resources::X::Users.new(client: client)
        @followers = XTwitterScraper::Resources::X::Followers.new(client: client)
        @dm = XTwitterScraper::Resources::X::Dm.new(client: client)
        @media = XTwitterScraper::Resources::X::Media.new(client: client)
        @profile = XTwitterScraper::Resources::X::Profile.new(client: client)
        @communities = XTwitterScraper::Resources::X::Communities.new(client: client)
        @accounts = XTwitterScraper::Resources::X::Accounts.new(client: client)
        @bookmarks = XTwitterScraper::Resources::X::Bookmarks.new(client: client)
        @lists = XTwitterScraper::Resources::X::Lists.new(client: client)
      end
    end
  end
end
