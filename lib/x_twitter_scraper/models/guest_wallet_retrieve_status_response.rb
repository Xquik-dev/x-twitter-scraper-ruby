# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::GuestWallets#retrieve_status
    class GuestWalletRetrieveStatusResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute balance
      #
      #   @return [String]
      required :balance, String

      # @!attribute latest_purchase
      #   Latest guest wallet purchase fulfillment state.
      #
      #   @return [XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase, nil]
      required :latest_purchase,
               -> { XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase },
               nil?: true

      # @!attribute poll_after_seconds
      #   Polling delay while payment is pending. Null means stop.
      #
      #   @return [Integer, XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::PollAfterSeconds, nil]
      required :poll_after_seconds,
               enum: -> { XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::PollAfterSeconds },
               nil?: true

      # @!attribute scope
      #
      #   @return [Symbol, :paid_reads]
      required :scope, const: :paid_reads

      # @!attribute status
      #   Combined wallet and pending-checkout state. A pending top-up can coexist with
      #   usable true. Terminal expired or failed states require a new guest wallet.
      #
      #   @return [Symbol, XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status]
      required :status, enum: -> { XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status }

      # @!attribute top_up
      #   Top-up action when usable and no checkout is pending.
      #
      #   @return [XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::TopUp, nil]
      required :top_up, -> { XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::TopUp }, nil?: true

      # @!attribute usable
      #   Authoritative paid-read readiness. Use instead of status.
      #
      #   @return [Boolean]
      required :usable, XTwitterScraper::Internal::Type::Boolean

      # @!attribute wallet_id
      #
      #   @return [String]
      required :wallet_id, String

      # @!method initialize(balance:, latest_purchase:, poll_after_seconds:, status:, top_up:, usable:, wallet_id:, scope: :paid_reads)
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::GuestWalletRetrieveStatusResponse} for more details.
      #
      #   Current balance, usability, and latest guest purchase state.
      #
      #   @param balance [String]
      #
      #   @param latest_purchase [XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase, nil] Latest guest wallet purchase fulfillment state.
      #
      #   @param poll_after_seconds [Integer, XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::PollAfterSeconds, nil] Polling delay while payment is pending. Null means stop.
      #
      #   @param status [Symbol, XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::Status] Combined wallet and pending-checkout state. A pending top-up can coexist with us
      #
      #   @param top_up [XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::TopUp, nil] Top-up action when usable and no checkout is pending.
      #
      #   @param usable [Boolean] Authoritative paid-read readiness. Use instead of status.
      #
      #   @param wallet_id [String]
      #
      #   @param scope [Symbol, :paid_reads]

      # @see XTwitterScraper::Models::GuestWalletRetrieveStatusResponse#latest_purchase
      class LatestPurchase < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute amount
        #   Confirmed USD amount for a guest wallet purchase.
        #
        #   @return [XTwitterScraper::Models::GuestWalletAmount]
        required :amount, -> { XTwitterScraper::GuestWalletAmount }

        # @!attribute checkout_url
        #   Present only while the purchase is pending.
        #
        #   @return [String, nil]
        required :checkout_url, String, nil?: true

        # @!attribute credits
        #
        #   @return [String]
        required :credits, String

        # @!attribute expires_at
        #
        #   @return [Time]
        required :expires_at, Time

        # @!attribute purchase_id
        #
        #   @return [String]
        required :purchase_id, String

        # @!attribute status
        #
        #   @return [Symbol, XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status]
        required :status,
                 enum: -> { XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status }

        # @!method initialize(amount:, checkout_url:, credits:, expires_at:, purchase_id:, status:)
        #   Latest guest wallet purchase fulfillment state.
        #
        #   @param amount [XTwitterScraper::Models::GuestWalletAmount] Confirmed USD amount for a guest wallet purchase.
        #
        #   @param checkout_url [String, nil] Present only while the purchase is pending.
        #
        #   @param credits [String]
        #
        #   @param expires_at [Time]
        #
        #   @param purchase_id [String]
        #
        #   @param status [Symbol, XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase::Status]

        # @see XTwitterScraper::Models::GuestWalletRetrieveStatusResponse::LatestPurchase#status
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

      # Polling delay while payment is pending. Null means stop.
      #
      # @see XTwitterScraper::Models::GuestWalletRetrieveStatusResponse#poll_after_seconds
      module PollAfterSeconds
        extend XTwitterScraper::Internal::Type::Enum

        POLL_AFTER_SECONDS_2 = 2

        # @!method self.values
        #   @return [Array<Integer>]
      end

      # Combined wallet and pending-checkout state. A pending top-up can coexist with
      # usable true. Terminal expired or failed states require a new guest wallet.
      #
      # @see XTwitterScraper::Models::GuestWalletRetrieveStatusResponse#status
      module Status
        extend XTwitterScraper::Internal::Type::Enum

        ACTIVE = :active
        PENDING = :pending
        EXPIRED = :expired
        FAILED = :failed
        FROZEN = :frozen
        CLOSED = :closed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see XTwitterScraper::Models::GuestWalletRetrieveStatusResponse#top_up
      class TopUp < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute method_
        #
        #   @return [Symbol, :POST]
        required :method_, const: :POST, api_name: :method

        # @!attribute path
        #
        #   @return [Symbol, :"/api/v1/guest-wallets/topups"]
        required :path, const: :"/api/v1/guest-wallets/topups"

        # @!method initialize(method_: :POST, path: :"/api/v1/guest-wallets/topups")
        #   Top-up action when usable and no checkout is pending.
        #
        #   @param method_ [Symbol, :POST]
        #   @param path [Symbol, :"/api/v1/guest-wallets/topups"]
      end
    end
  end
end
