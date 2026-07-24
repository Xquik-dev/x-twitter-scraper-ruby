# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    # Accountless prepaid access for paid read endpoints
    class GuestWallets
      # Create a one-use Stripe-hosted checkout after the user explicitly confirms a
      # $10-$250 USD amount. This request creates no charge by itself. The user opens
      # checkout_url on Stripe. This endpoint returns the paid-read API key without
      # requiring an Xquik account, email, dashboard, or Xquik web page. An idempotent
      # replay returns the same key.
      sig do
        params(
          amount_minor: Integer,
          idempotency_key: String,
          currency: Symbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::GuestWalletCreateResponse)
      end
      def create(
        # Body param: USD cents accepted for this checkout.
        amount_minor:,
        # Header param: Generate a cryptographically random UUID v4. Reuse it only to
        # retry the same wallet and amount request. Initial wallet creation can recover
        # the API key from this value, so store it as a secret and never log it.
        idempotency_key:,
        # Body param
        currency: :usd,
        request_options: {}
      )
      end

      # Poll after Stripe payment. Use usable to decide whether paid reads can run. An
      # active wallet can remain usable while a top-up is pending. A new wallet becomes
      # usable only after verified webhook fulfillment. Send the guest key as
      # Authorization: Bearer.
      sig do
        params(
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::GuestWalletRetrieveStatusResponse)
      end
      def retrieve_status(request_options: {})
      end

      # Create a one-use Stripe-hosted checkout for an existing paid-read guest key
      # after the user explicitly confirms a $10-$250 USD amount. The key remains the
      # same. This request creates no charge by itself and never redirects through an
      # Xquik web page.
      sig do
        params(
          amount_minor: Integer,
          idempotency_key: String,
          currency: Symbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::GuestWalletTopupResponse)
      end
      def topup(
        # Body param: USD cents accepted for this checkout.
        amount_minor:,
        # Header param: Generate a cryptographically random UUID v4. Reuse it only to
        # retry the same wallet and amount request. Initial wallet creation can recover
        # the API key from this value, so store it as a secret and never log it.
        idempotency_key:,
        # Body param
        currency: :usd,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
