# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # X data lookups (subscription required)
      class Followers
        # Check follow relationship
        #
        # @overload retrieve_check(source:, target:, request_options: {})
        #
        # @param source [String] Username to check (without @)
        #
        # @param target [String] Target username (without @)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::FollowerRetrieveCheckResponse]
        #
        # @see XTwitterScraper::Models::X::FollowerRetrieveCheckParams
        def retrieve_check(params)
          parsed, options = XTwitterScraper::X::FollowerRetrieveCheckParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/followers/check",
            query: query,
            model: XTwitterScraper::Models::X::FollowerRetrieveCheckResponse,
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
