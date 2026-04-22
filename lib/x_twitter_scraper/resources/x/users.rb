# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # X data lookups (subscription required)
      class Users
        # X write actions (tweets, likes, follows, DMs)
        # @return [XTwitterScraper::Resources::X::Users::Follow]
        attr_reader :follow

        # Look up X user
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] X username (without @) or user ID
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::UserProfile]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["x/users/%1$s", id],
            model: XTwitterScraper::X::UserProfile,
            options: params[:request_options]
          )
        end

        # Get multiple users by IDs
        #
        # @overload retrieve_batch(ids:, request_options: {})
        #
        # @param ids [String] Comma-separated user IDs (max 100)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveBatchParams
        def retrieve_batch(params)
          parsed, options = XTwitterScraper::X::UserRetrieveBatchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/users/batch",
            query: query,
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Get user followers
        #
        # @overload retrieve_followers(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String] User ID or username
        #
        # @param cursor [String] Pagination cursor for followers list
        #
        # @param page_size [Integer] Items per page (20-200, default 200)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveFollowersParams
        def retrieve_followers(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveFollowersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/followers", id],
            query: query.transform_keys(page_size: "pageSize"),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Get followers you know for a user
        #
        # @overload retrieve_followers_you_know(id, cursor: nil, request_options: {})
        #
        # @param id [String] User ID for followers-you-know lookup
        #
        # @param cursor [String] Pagination cursor for followers-you-know
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveFollowersYouKnowParams
        def retrieve_followers_you_know(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveFollowersYouKnowParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/followers-you-know", id],
            query: query,
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Get users this user follows
        #
        # @overload retrieve_following(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String] User ID or username for following lookup
        #
        # @param cursor [String] Pagination cursor for following list
        #
        # @param page_size [Integer] Results per page (20-200, default 200)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveFollowingParams
        def retrieve_following(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveFollowingParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/following", id],
            query: query.transform_keys(page_size: "pageSize"),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Get tweets liked by a user
        #
        # @overload retrieve_likes(id, cursor: nil, request_options: {})
        #
        # @param id [String] User ID
        #
        # @param cursor [String] Pagination cursor for liked tweets
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveLikesParams
        def retrieve_likes(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveLikesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/likes", id],
            query: query,
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Get media tweets by a user
        #
        # @overload retrieve_media(id, cursor: nil, request_options: {})
        #
        # @param id [String] User ID for media lookup
        #
        # @param cursor [String] Pagination cursor for media tweets
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveMediaParams
        def retrieve_media(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveMediaParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/media", id],
            query: query,
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Get tweets mentioning a user
        #
        # @overload retrieve_mentions(id, cursor: nil, since_time: nil, until_time: nil, request_options: {})
        #
        # @param id [String] User ID or username for mentions lookup
        #
        # @param cursor [String] Pagination cursor for mentions
        #
        # @param since_time [String] Unix timestamp - return mentions after this time
        #
        # @param until_time [String] Unix timestamp - return mentions before this time
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveMentionsParams
        def retrieve_mentions(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveMentionsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/mentions", id],
            query: query.transform_keys(since_time: "sinceTime", until_time: "untilTime"),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Search users by name or username
        #
        # @overload retrieve_search(q:, cursor: nil, request_options: {})
        #
        # @param q [String] User search query
        #
        # @param cursor [String] Pagination cursor for user search
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveSearchParams
        def retrieve_search(params)
          parsed, options = XTwitterScraper::X::UserRetrieveSearchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/users/search",
            query: query,
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Get recent tweets by a user
        #
        # @overload retrieve_tweets(id, cursor: nil, include_parent_tweet: nil, include_replies: nil, request_options: {})
        #
        # @param id [String] X user ID or username
        #
        # @param cursor [String] Pagination cursor for user tweets
        #
        # @param include_parent_tweet [Boolean] Include parent tweet for replies
        #
        # @param include_replies [Boolean] Include reply tweets
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveTweetsParams
        def retrieve_tweets(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveTweetsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/tweets", id],
            query: query.transform_keys(
              include_parent_tweet: "includeParentTweet",
              include_replies: "includeReplies"
            ),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Get verified followers
        #
        # @overload retrieve_verified_followers(id, cursor: nil, request_options: {})
        #
        # @param id [String] User ID or username for verified followers
        #
        # @param cursor [String] Pagination cursor for verified followers
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersParams
        def retrieve_verified_followers(id, params = {})
          parsed, options = XTwitterScraper::X::UserRetrieveVerifiedFollowersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/users/%1$s/verified-followers", id],
            query: query,
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
          @follow = XTwitterScraper::Resources::X::Users::Follow.new(client: client)
        end
      end
    end
  end
end
