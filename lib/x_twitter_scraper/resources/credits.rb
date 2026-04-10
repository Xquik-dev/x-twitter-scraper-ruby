# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Subscription, billing, and credits
    class Credits
      # Get credits balance
      #
      # @overload retrieve_balance(request_options: {})
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::CreditRetrieveBalanceResponse]
      #
      # @see XTwitterScraper::Models::CreditRetrieveBalanceParams
      def retrieve_balance(params = {})
        @client.request(
          method: :get,
          path: "credits",
          model: XTwitterScraper::Models::CreditRetrieveBalanceResponse,
          options: params[:request_options]
        )
      end

      # Top up credits balance
      #
      # @overload topup_balance(amount:, request_options: {})
      #
      # @param amount [Integer] Amount to top up in credits
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::CreditTopupBalanceResponse]
      #
      # @see XTwitterScraper::Models::CreditTopupBalanceParams
      def topup_balance(params)
        parsed, options = XTwitterScraper::CreditTopupBalanceParams.dump_request(params)
        @client.request(
          method: :post,
          path: "credits/topup",
          body: parsed,
          model: XTwitterScraper::Models::CreditTopupBalanceResponse,
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
