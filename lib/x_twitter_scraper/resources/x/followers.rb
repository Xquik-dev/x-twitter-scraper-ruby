# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # X data lookups (subscription required)
      class Followers
        # Check follow relationship
        #
        # @overload check(source:, target:, request_options: {})
        #
        # @param source [String] Username to check (without @)
        #
        # @param target [String] Target username (without @)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::FollowerCheckResponse]
        #
        # @see XTwitterScraper::Models::X::FollowerCheckParams
        def check(params)
          parsed, options = XTwitterScraper::X::FollowerCheckParams.dump_request(params)
          query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "x/followers/check",
            query: query,
            model: XTwitterScraper::Models::X::FollowerCheckResponse,
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
