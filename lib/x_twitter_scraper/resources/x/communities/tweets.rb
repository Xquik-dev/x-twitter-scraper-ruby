# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X Community info, members, and tweets
        class Tweets
          # List tweets across all communities
          #
          # @overload list(q:, cursor: nil, query_type: nil, request_options: {})
          #
          # @param q [String] Search query for cross-community tweets
          #
          # @param cursor [String] Pagination cursor for cross-community results
          #
          # @param query_type [String] Sort order for cross-community results (Latest or Top)
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
              query: query.transform_keys(query_type: "queryType"),
              model: XTwitterScraper::PaginatedTweets,
              options: options
            )
          end

          # List tweets posted in a community
          #
          # @overload list_by_community(id, cursor: nil, request_options: {})
          #
          # @param id [String] Community ID for tweet lookup
          #
          # @param cursor [String] Pagination cursor for community tweets
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
              query: query,
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
