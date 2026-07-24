# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Credits#retrieve_balance
    class CreditRetrieveBalanceResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute auto_topup_amount_dollars
      #   Configured dollar amount for each automatic top-up.
      #
      #   @return [Float]
      required :auto_topup_amount_dollars, Float

      # @!attribute auto_topup_enabled
      #
      #   @return [Boolean]
      required :auto_topup_enabled, XTwitterScraper::Internal::Type::Boolean

      # @!attribute auto_topup_threshold
      #   Credit balance threshold that triggers automatic top-up when enabled,
      #   represented as a bigint string.
      #
      #   @return [String]
      required :auto_topup_threshold, String

      # @!attribute balance
      #   Current credit balance as a bigint string to preserve precision above
      #   Number.MAX_SAFE_INTEGER.
      #
      #   @return [String]
      required :balance, String

      # @!attribute lifetime_purchased
      #   Lifetime purchased credits as a bigint string.
      #
      #   @return [String]
      required :lifetime_purchased, String

      # @!attribute lifetime_used
      #   Lifetime consumed credits as a bigint string.
      #
      #   @return [String]
      required :lifetime_used, String

      # @!method initialize(auto_topup_amount_dollars:, auto_topup_enabled:, auto_topup_threshold:, balance:, lifetime_purchased:, lifetime_used:)
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::CreditRetrieveBalanceResponse} for more details.
      #
      #   @param auto_topup_amount_dollars [Float] Configured dollar amount for each automatic top-up.
      #
      #   @param auto_topup_enabled [Boolean]
      #
      #   @param auto_topup_threshold [String] Credit balance threshold that triggers automatic top-up when enabled, represente
      #
      #   @param balance [String] Current credit balance as a bigint string to preserve precision above Number.MAX
      #
      #   @param lifetime_purchased [String] Lifetime purchased credits as a bigint string.
      #
      #   @param lifetime_used [String] Lifetime consumed credits as a bigint string.
    end
  end
end
