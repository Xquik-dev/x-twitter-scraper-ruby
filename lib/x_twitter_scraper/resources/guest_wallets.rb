# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Accountless prepaid access for paid read endpoints
    class GuestWallets
      # Some parameter documentations has been truncated, see
      # {XTwitterScraper::Models::GuestWalletCreateParams} for more details.
      #
      # Create a one-use Stripe-hosted checkout after the user explicitly confirms a
      # $10-$250 USD amount. This request creates no charge by itself. The user opens
      # checkout_url on Stripe. This endpoint returns the paid-read API key without
      # requiring an Xquik account, email, dashboard, or Xquik web page. An idempotent
      # replay returns the same key.
      #
      # @overload create(amount_minor:, idempotency_key:, currency: :usd, request_options: {})
      #
      # @param amount_minor [Integer] Body param: USD cents accepted for this checkout.
      #
      # @param idempotency_key [String] Header param: Generate a cryptographically random UUID v4. Reuse it only to retr
      #
      # @param currency [Symbol, :usd] Body param
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::GuestWalletCreateResponse]
      #
      # @see XTwitterScraper::Models::GuestWalletCreateParams
      def create(params)
        parsed, options = XTwitterScraper::GuestWalletCreateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "guest-wallets",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: XTwitterScraper::Models::GuestWalletCreateResponse,
          security: {},
          options: options
        )
      end

      # Poll after Stripe payment. Use usable to decide whether paid reads can run. An
      # active wallet can remain usable while a top-up is pending. A new wallet becomes
      # usable only after verified webhook fulfillment. Send the guest key as
      # Authorization: Bearer.
      #
      # @overload retrieve_status(request_options: {})
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::GuestWalletRetrieveStatusResponse]
      #
      # @see XTwitterScraper::Models::GuestWalletRetrieveStatusParams
      def retrieve_status(params = {})
        @client.request(
          method: :get,
          path: "guest-wallets/status",
          model: XTwitterScraper::Models::GuestWalletRetrieveStatusResponse,
          security: {auth_api_key: true},
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {XTwitterScraper::Models::GuestWalletTopupParams} for more details.
      #
      # Create a one-use Stripe-hosted checkout for an existing paid-read guest key
      # after the user explicitly confirms a $10-$250 USD amount. The key remains the
      # same. This request creates no charge by itself and never redirects through an
      # Xquik web page.
      #
      # @overload topup(amount_minor:, idempotency_key:, currency: :usd, request_options: {})
      #
      # @param amount_minor [Integer] Body param: USD cents accepted for this checkout.
      #
      # @param idempotency_key [String] Header param: Generate a cryptographically random UUID v4. Reuse it only to retr
      #
      # @param currency [Symbol, :usd] Body param
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::GuestWalletTopupResponse]
      #
      # @see XTwitterScraper::Models::GuestWalletTopupParams
      def topup(params)
        parsed, options = XTwitterScraper::GuestWalletTopupParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "guest-wallets/topups",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: XTwitterScraper::Models::GuestWalletTopupResponse,
          security: {auth_api_key: true},
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
