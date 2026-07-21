# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # Look up, search, and explore user profiles and relationships
      class Followers
        # Check if one user follows another
        #
        # @overload check(source:, target:, request_options: {})
        #
        # @param source [String] Source username, @username, or X or Twitter profile URL
        #
        # @param target [String] Target username, @username, or X or Twitter profile URL
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
