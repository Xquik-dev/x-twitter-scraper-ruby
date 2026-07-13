# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Subscription, billing, and credits
    class Subscribe
      # Get checkout or billing URL
      #
      # @overload create(request_options: {})
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::SubscribeCreateResponse]
      #
      # @see XTwitterScraper::Models::SubscribeCreateParams
      def create(params = {})
        @client.request(
          method: :post,
          path: "subscribe",
          model: XTwitterScraper::Models::SubscribeCreateResponse,
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
