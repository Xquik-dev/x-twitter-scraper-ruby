# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Subscription, billing, and credits
    class Credits
      # Redirect to an active top-up payment page
      #
      # @overload redirect_topup_checkout(session_id:, request_options: {})
      #
      # @param session_id [String] Billing session ID returned by the top-up billing flow.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see XTwitterScraper::Models::CreditRedirectTopupCheckoutParams
      def redirect_topup_checkout(params)
        parsed, options = XTwitterScraper::CreditRedirectTopupCheckoutParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "credits/topup/redirect",
          query: query,
          model: NilClass,
          security: {},
          options: options
        )
      end

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

      # Get top-up billing status
      #
      # @overload retrieve_topup_status(session_id:, request_options: {})
      #
      # @param session_id [String] Billing session ID returned by the top-up billing flow.
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::CreditRetrieveTopupStatusResponse]
      #
      # @see XTwitterScraper::Models::CreditRetrieveTopupStatusParams
      def retrieve_topup_status(params)
        parsed, options = XTwitterScraper::CreditRetrieveTopupStatusParams.dump_request(params)
        query = XTwitterScraper::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "credits/topup/status",
          query: query,
          model: XTwitterScraper::Models::CreditRetrieveTopupStatusResponse,
          options: options
        )
      end

      # Create a Stripe Checkout session only after the user confirms. The request never
      # completes payment or adds credits by itself.
      #
      # @overload topup_balance(dollars:, locale: nil, request_options: {})
      #
      # @param dollars [Integer] Amount to top up in US dollars. Minimum 10.
      #
      # @param locale [String] Optional checkout locale. Defaults to en.
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
