# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # X data lookups (subscription required)
      class Lists
        # Get list followers
        #
        # @overload retrieve_followers(id, cursor: nil, request_options: {})
        #
        # @param id [String] List ID
        #
        # @param cursor [String] Pagination cursor
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see XTwitterScraper::Models::X::ListRetrieveFollowersParams
        def retrieve_followers(id, params = {})
          parsed, options = XTwitterScraper::X::ListRetrieveFollowersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/lists/%1$s/followers", id],
            query: query,
            model: NilClass,
            options: options
          )
        end

        # Get list members
        #
        # @overload retrieve_members(id, cursor: nil, request_options: {})
        #
        # @param id [String] List ID
        #
        # @param cursor [String] Pagination cursor
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see XTwitterScraper::Models::X::ListRetrieveMembersParams
        def retrieve_members(id, params = {})
          parsed, options = XTwitterScraper::X::ListRetrieveMembersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/lists/%1$s/members", id],
            query: query,
            model: NilClass,
            options: options
          )
        end

        # Get list tweets
        #
        # @overload retrieve_tweets(id, cursor: nil, include_replies: nil, since_time: nil, until_time: nil, request_options: {})
        #
        # @param id [String] List ID
        #
        # @param cursor [String] Pagination cursor
        #
        # @param include_replies [Boolean] Include replies (default false)
        #
        # @param since_time [String] Unix timestamp - filter after
        #
        # @param until_time [String] Unix timestamp - filter before
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see XTwitterScraper::Models::X::ListRetrieveTweetsParams
        def retrieve_tweets(id, params = {})
          parsed, options = XTwitterScraper::X::ListRetrieveTweetsParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/lists/%1$s/tweets", id],
            query: query.transform_keys(
              include_replies: "includeReplies",
              since_time: "sinceTime",
              until_time: "untilTime"
            ),
            model: NilClass,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
