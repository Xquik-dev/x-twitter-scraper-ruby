# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::GuestWallets#create
    class GuestWalletCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute account_required
      #
      #   @return [Boolean, false]
      required :account_required, const: false

      # @!attribute amount
      #   Confirmed USD amount for a guest wallet purchase.
      #
      #   @return [XTwitterScraper::Models::GuestWalletAmount]
      required :amount, -> { XTwitterScraper::GuestWalletAmount }

      # @!attribute api_key
      #   Paid-read bearer credential returned only by initial creation. Store it as a
      #   secret. Never place it in a URL or log.
      #
      #   @return [String]
      required :api_key, String

      # @!attribute authorization
      #
      #   @return [XTwitterScraper::Models::GuestWalletCreateResponse::Authorization]
      required :authorization, -> { XTwitterScraper::Models::GuestWalletCreateResponse::Authorization }

      # @!attribute checkout_url
      #   Raw Stripe-hosted checkout URL for user interaction.
      #
      #   @return [String]
      required :checkout_url, String

      # @!attribute credential_notice
      #
      #   @return [Symbol, :"Store api_key and the Idempotency-Key securely before sharing checkout_url. No email recovery is available."]
      required :credential_notice,
               const: :"Store api_key and the Idempotency-Key securely before sharing checkout_url. No email recovery is available."

      # @!attribute credits
      #   Credits granted after verified payment.
      #
      #   @return [String]
      required :credits, String

      # @!attribute expires_at
      #   Time when the pending checkout expires.
      #
      #   @return [Time]
      required :expires_at, Time

      # @!attribute instructions
      #
      #   @return [Symbol, :"Give checkout_url to the user. They must complete payment on Stripe. Never submit payment for them. After payment, poll status_url every poll_after_seconds until latest_purchase.status is no longer pending."]
      required :instructions,
               const: :"Give checkout_url to the user. They must complete payment on Stripe. Never submit payment for them. After payment, poll status_url every poll_after_seconds until latest_purchase.status is no longer pending."

      # @!attribute poll_after_seconds
      #   Wait at least this long before polling status_url.
      #
      #   @return [Integer, 2]
      required :poll_after_seconds, const: 2

      # @!attribute purchase_id
      #
      #   @return [String]
      required :purchase_id, String

      # @!attribute requires_user_interaction
      #
      #   @return [Boolean, true]
      required :requires_user_interaction, const: true

      # @!attribute status
      #
      #   @return [Symbol, XTwitterScraper::Models::GuestWalletCreateResponse::Status]
      required :status, enum: -> { XTwitterScraper::Models::GuestWalletCreateResponse::Status }

      # @!attribute status_url
      #
      #   @return [Symbol, :"https://xquik.com/api/v1/guest-wallets/status"]
      required :status_url, const: :"https://xquik.com/api/v1/guest-wallets/status"

      # @!attribute wallet_id
      #
      #   @return [String]
      required :wallet_id, String

      # @!method initialize(amount:, api_key:, authorization:, checkout_url:, credits:, expires_at:, purchase_id:, status:, wallet_id:, account_required: false, credential_notice: :"Store api_key and the Idempotency-Key securely before sharing checkout_url. No email recovery is available.", instructions: :"Give checkout_url to the user. They must complete payment on Stripe. Never submit payment for them. After payment, poll status_url every poll_after_seconds until latest_purchase.status is no longer pending.", poll_after_seconds: 2, requires_user_interaction: true, status_url: :"https://xquik.com/api/v1/guest-wallets/status")
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::GuestWalletCreateResponse} for more details.
      #
      #   Initial guest wallet response containing the one-time key.
      #
      #   @param amount [XTwitterScraper::Models::GuestWalletAmount] Confirmed USD amount for a guest wallet purchase.
      #
      #   @param api_key [String] Paid-read bearer credential returned only by initial creation. Store it as a sec
      #
      #   @param authorization [XTwitterScraper::Models::GuestWalletCreateResponse::Authorization]
      #
      #   @param checkout_url [String] Raw Stripe-hosted checkout URL for user interaction.
      #
      #   @param credits [String] Credits granted after verified payment.
      #
      #   @param expires_at [Time] Time when the pending checkout expires.
      #
      #   @param purchase_id [String]
      #
      #   @param status [Symbol, XTwitterScraper::Models::GuestWalletCreateResponse::Status]
      #
      #   @param wallet_id [String]
      #
      #   @param account_required [Boolean, false]
      #
      #   @param credential_notice [Symbol, :"Store api_key and the Idempotency-Key securely before sharing checkout_url. No email recovery is available."]
      #
      #   @param instructions [Symbol, :"Give checkout_url to the user. They must complete payment on Stripe. Never submit payment for them. After payment, poll status_url every poll_after_seconds until latest_purchase.status is no longer pending."]
      #
      #   @param poll_after_seconds [Integer, 2] Wait at least this long before polling status_url.
      #
      #   @param requires_user_interaction [Boolean, true]
      #
      #   @param status_url [Symbol, :"https://xquik.com/api/v1/guest-wallets/status"]

      # @see XTwitterScraper::Models::GuestWalletCreateResponse#authorization
      class Authorization < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute header
        #
        #   @return [Symbol, XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Header]
        required :header, enum: -> { XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Header }

        # @!attribute scheme
        #
        #   @return [Symbol, XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Scheme]
        required :scheme, enum: -> { XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Scheme }

        # @!method initialize(header:, scheme:)
        #   @param header [Symbol, XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Header]
        #   @param scheme [Symbol, XTwitterScraper::Models::GuestWalletCreateResponse::Authorization::Scheme]

        # @see XTwitterScraper::Models::GuestWalletCreateResponse::Authorization#header
        module Header
          extend XTwitterScraper::Internal::Type::Enum

          AUTHORIZATION = :Authorization

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see XTwitterScraper::Models::GuestWalletCreateResponse::Authorization#scheme
        module Scheme
          extend XTwitterScraper::Internal::Type::Enum

          BEARER = :Bearer

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see XTwitterScraper::Models::GuestWalletCreateResponse#status
      module Status
        extend XTwitterScraper::Internal::Type::Enum

        CREATING = :creating
        PENDING = :pending
        PAID = :paid
        EXPIRED = :expired
        FAILED = :failed
        REFUNDED = :refunded
        DISPUTED = :disputed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
