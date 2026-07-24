# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # X List followers, members, and tweets
      class Lists
        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::ListRetrieveFollowersParams} for more details.
        #
        # List followers of an X List
        #
        # @overload retrieve_followers(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String] List ID
        #
        # @param cursor [String] Pagination cursor for list followers
        #
        # @param page_size [Integer] Maximum user profiles requested from this page (20-200, default 200). The respon
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::ListRetrieveFollowersParams
        def retrieve_followers(id, params = {})
          parsed, options = XTwitterScraper::X::ListRetrieveFollowersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/lists/%1$s/followers", id],
            query: query.transform_keys(page_size: "pageSize"),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # List members of an X List
        #
        # @overload retrieve_members(id, cursor: nil, page_size: nil, request_options: {})
        #
        # @param id [String] List ID for member lookup
        #
        # @param cursor [String] Pagination cursor for list members
        #
        # @param page_size [Integer] Members per page (20-200, default 20)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedUsers]
        #
        # @see XTwitterScraper::Models::X::ListRetrieveMembersParams
        def retrieve_members(id, params = {})
          parsed, options = XTwitterScraper::X::ListRetrieveMembersParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["x/lists/%1$s/members", id],
            query: query.transform_keys(page_size: "pageSize"),
            model: XTwitterScraper::PaginatedUsers,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::ListRetrieveTweetsParams} for more details.
        #
        # List tweets from an X List
        #
        # @overload retrieve_tweets(id, cursor: nil, include_replies: nil, page_size: nil, since_time: nil, until_time: nil, request_options: {})
        #
        # @param id [String] List ID for tweet lookup
        #
        # @param cursor [String] Pagination cursor for list tweets
        #
        # @param include_replies [Boolean] Include replies (default false)
        #
        # @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
        #
        # @param since_time [String] Unix timestamp - filter after
        #
        # @param until_time [String] Unix timestamp - filter before
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::PaginatedTweets]
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
              page_size: "pageSize",
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
        end
      end
    end
  end
end
