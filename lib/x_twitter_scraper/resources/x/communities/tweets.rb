# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X data lookups (subscription required)
        class Tweets
          # Search tweets across all communities
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
          # @return [XTwitterScraper::Models::X::Communities::TweetListResponse]
          #
          # @see XTwitterScraper::Models::X::Communities::TweetListParams
          def list(params)
            parsed, options = XTwitterScraper::X::Communities::TweetListParams.dump_request(params)
            query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: "x/communities/tweets",
              query: query.transform_keys(query_type: "queryType"),
              model: XTwitterScraper::Models::X::Communities::TweetListResponse,
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
