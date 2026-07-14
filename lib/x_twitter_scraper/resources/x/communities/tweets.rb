# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X Community info, members, and tweets
        class Tweets
          # Some parameter documentations has been truncated, see
          # {XTwitterScraper::Models::X::Communities::TweetListParams} for more details.
          #
          # Requires a Community ID and keyword query.
          #
          # @overload list(community_id:, q:, cursor: nil, page_size: nil, query_type: nil, request_options: {})
          #
          # @param community_id [String] Numeric ID of the community to search
          #
          # @param q [String] Keyword query within the selected community
          #
          # @param cursor [String] Pagination cursor for community results
          #
          # @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
          #
          # @param query_type [Symbol, XTwitterScraper::Models::X::Communities::TweetListParams::QueryType] Sort order for community results (Latest or Top)
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::PaginatedTweets]
          #
          # @see XTwitterScraper::Models::X::Communities::TweetListParams
          def list(params)
            parsed, options = XTwitterScraper::X::Communities::TweetListParams.dump_request(params)
            query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: "x/communities/tweets",
              query: query.transform_keys(
                community_id: "communityId",
                page_size: "pageSize",
                query_type: "queryType"
              ),
              model: XTwitterScraper::PaginatedTweets,
              options: options
            )
          end

          # Some parameter documentations has been truncated, see
          # {XTwitterScraper::Models::X::Communities::TweetListByCommunityParams} for more
          # details.
          #
          # List tweets posted in a community
          #
          # @overload list_by_community(id, cursor: nil, page_size: nil, request_options: {})
          #
          # @param id [String] Community ID for tweet lookup
          #
          # @param cursor [String] Pagination cursor for community tweets
          #
          # @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::PaginatedTweets]
          #
          # @see XTwitterScraper::Models::X::Communities::TweetListByCommunityParams
          def list_by_community(id, params = {})
            parsed, options = XTwitterScraper::X::Communities::TweetListByCommunityParams.dump_request(params)
            query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: ["x/communities/%1$s/tweets", id],
              query: query.transform_keys(page_size: "pageSize"),
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
end
