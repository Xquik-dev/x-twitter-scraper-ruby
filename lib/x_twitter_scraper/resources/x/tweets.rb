# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Tweets
        # X write actions (tweets, likes, follows, DMs)
        # @return [XTwitterScraper::Resources::X::Tweets::Like]
        attr_reader :like

        # X write actions (tweets, likes, follows, DMs)
        # @return [XTwitterScraper::Resources::X::Tweets::Retweet]
        attr_reader :retweet

        # Create tweet
        #
        # @overload create(account:, text:, attachment_url: nil, community_id: nil, is_note_tweet: nil, media_ids: nil, reply_to_tweet_id: nil, request_options: {})
        #
        # @param account [String] X account (@username or account ID)
        #
        # @param text [String]
        #
        # @param attachment_url [String]
        #
        # @param community_id [String]
        #
        # @param is_note_tweet [Boolean]
        #
        # @param media_ids [Array<String>]
        #
        # @param reply_to_tweet_id [String]
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetCreateResponse]
        #
        # @see XTwitterScraper::Models::X::TweetCreateParams
        def create(params)
          parsed, options = XTwitterScraper::X::TweetCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/tweets",
            body: parsed,
            model: XTwitterScraper::Models::X::TweetCreateResponse,
            options: options
          )
        end

        # Look up tweet
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Tweet ID
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetRetrieveResponse]
        #
        # @see XTwitterScraper::Models::X::TweetRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s", id],
            model: XTwitterScraper::Models::X::TweetRetrieveResponse,
            options: params[:request_options]
          )
        end

        # Get multiple tweets by IDs
        #
        # @overload list(ids:, request_options: {})
        #
        # @param ids [String] Comma-separated tweet IDs (max 100)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetListParams
        def list(params)
          parsed, options = XTwitterScraper::X::TweetListParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/tweets",
            query: query,
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Delete tweet
        #
        # @overload delete(id, account:, request_options: {})
        #
        # @param id [String] Tweet ID to delete
        #
        # @param account [String] X account identifier (@username or account ID)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::TweetDeleteResponse]
        #
        # @see XTwitterScraper::Models::X::TweetDeleteParams
        def delete(id, params)
          parsed, options = XTwitterScraper::X::TweetDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["x/tweets/%1$s", id],
            body: parsed,
            model: XTwitterScraper::Models::X::TweetDeleteResponse,
            options: options
          )
        end

        # Get users who liked a tweet
        #
        # @overload get_favoriters(id, cursor: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get favoriters
        #
        # @param cursor [String] Pagination cursor for favoriters
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::TweetGetFavoritersParams
        def get_favoriters(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetFavoritersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/favoriters", id],
            query: query,
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Get quote tweets of a tweet
        #
        # @overload get_quotes(id, cursor: nil, include_replies: nil, since_time: nil, until_time: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get quotes
        #
        # @param cursor [String] Pagination cursor for quote tweets
        #
        # @param include_replies [Boolean] Include reply quotes (default false)
        #
        # @param since_time [String] Unix timestamp - return quotes posted after this time
        #
        # @param until_time [String] Unix timestamp - return quotes posted before this time
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetGetQuotesParams
        def get_quotes(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetQuotesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/quotes", id],
            query: query.transform_keys(
              include_replies: "includeReplies",
              since_time: "sinceTime",
              until_time: "untilTime"
            ),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Get replies to a tweet
        #
        # @overload get_replies(id, cursor: nil, since_time: nil, until_time: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get replies
        #
        # @param cursor [String] Pagination cursor for tweet replies
        #
        # @param since_time [String] Unix timestamp - return replies posted after this time
        #
        # @param until_time [String] Unix timestamp - return replies posted before this time
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetGetRepliesParams
        def get_replies(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetRepliesParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/replies", id],
            query: query.transform_keys(since_time: "sinceTime", until_time: "untilTime"),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Get users who retweeted a tweet
        #
        # @overload get_retweeters(id, cursor: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get retweeters
        #
        # @param cursor [String] Pagination cursor for retweeters
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::TweetGetRetweetersParams
        def get_retweeters(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetRetweetersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/retweeters", id],
            query: query,
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Get thread context for a tweet
        #
        # @overload get_thread(id, cursor: nil, request_options: {})
        #
        # @param id [String] Tweet ID to get thread context
        #
        # @param cursor [String] Pagination cursor for thread tweets
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetGetThreadParams
        def get_thread(id, params = {})
          parsed, options = XTwitterScraper::X::TweetGetThreadParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/tweets/%1$s/thread", id],
            query: query,
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # Search tweets
        #
        # @overload search(q:, cursor: nil, limit: nil, query_type: nil, since_time: nil, until_time: nil, request_options: {})
        #
        # @param q [String] Search query (keywords,
        #
        # @param cursor [String] Pagination cursor from previous response
        #
        # @param limit [Integer] Max tweets to return (server paginates internally). Omit for single page (~20).
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::TweetSearchParams::QueryType] Sort order — Latest (chronological) or Top (engagement-ranked)
        #
        # @param since_time [String] ISO 8601 timestamp — only return tweets after this time
        #
        # @param until_time [String] ISO 8601 timestamp — only return tweets before this time
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
        #
        # @see XTwitterScraper::Models::X::TweetSearchParams
        def search(params)
          parsed, options = XTwitterScraper::X::TweetSearchParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/tweets/search",
            query: query.transform_keys(
              query_type: "queryType",
              since_time: "sinceTime",
              until_time: "untilTime"
            ),
            model: XTwitterScraper::PaginatedTweets,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
          @like = XTwitterScraper::Resources::X::Tweets::Like.new(client: client)
          @retweet = XTwitterScraper::Resources::X::Tweets::Retweet.new(client: client)
        end
      end
    end
  end
end
