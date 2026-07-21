# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # X write actions (tweets, likes, follows, DMs)
      class WriteActions
        # Get write action status
        #
        # @overload retrieve(id, request_options: {})
        #
        # @param id [String] Write action ID returned by a pending write response.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::WriteActionRetrieveResponse]
        #
        # @see XTwitterScraper::Models::X::WriteActionRetrieveParams
        def retrieve(id, params = {})
          @client.request(
            method: :get,
            path: ["x/write-actions/%1$s", id],
            model: XTwitterScraper::Models::X::WriteActionRetrieveResponse,
            options: params[:request_options]
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
