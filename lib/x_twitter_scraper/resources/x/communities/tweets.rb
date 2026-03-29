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
          # @param q [String] Search query
          #
          # @param cursor [String] Pagination cursor
          #
          # @param query_type [String] Sort order (Latest or Top)
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [nil]
          #
          # @see XTwitterScraper::Models::X::Communities::TweetListParams
          def list(params)
            parsed, options = XTwitterScraper::X::Communities::TweetListParams.dump_request(params)
            query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: "x/communities/tweets",
              query: query.transform_keys(query_type: "queryType"),
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
end
