# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Credits#topup_balance
    class CreditTopupBalanceResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute redirect_url
      #   Stable first-party Xquik redirect URL for the active Stripe Checkout session.
      #
      #   @return [String]
      required :redirect_url, String

      # @!attribute url
      #   Same stable first-party Xquik redirect URL as redirect_url. The response never
      #   exposes a raw Stripe Checkout URL.
      #
      #   @return [String]
      required :url, String

      # @!method initialize(redirect_url:, url:)
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::CreditTopupBalanceResponse} for more details.
      #
      #   @param redirect_url [String] Stable first-party Xquik redirect URL for the active Stripe Checkout session.
      #
      #   @param url [String] Same stable first-party Xquik redirect URL as redirect_url. The response never e
    end
  end
end
