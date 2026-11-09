# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Credits#topup_balance
    class CreditTopupBalanceResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute charged_currency
      #   Currency the checkout charges.
      #
      #   @return [Symbol, XTwitterScraper::Models::Currency]
      required :charged_currency, enum: -> { XTwitterScraper::Models::Currency }, api_name: :chargedCurrency

      # @!attribute charged_minor_units
      #   Amount the checkout charges before tax, in the currency's smallest unit. JPY and
      #   KRW have no decimals, so 1580 JPY is ¥1,580.
      #
      #   @return [Integer]
      required :charged_minor_units, Integer, api_name: :chargedMinorUnits

      # @!attribute redirect_url
      #   Stable Xquik redirect URL for the active checkout.
      #
      #   @return [String]
      required :redirect_url, String

      # @!attribute url
      #   Same stable Xquik redirect URL as redirect_url. The response never exposes the
      #   hosted checkout URL.
      #
      #   @return [String]
      required :url, String

      # @!method initialize(charged_currency:, charged_minor_units:, redirect_url:, url:)
      #   @param charged_currency [Symbol, XTwitterScraper::Models::Currency] Currency the checkout charges.
      #
      #   @param charged_minor_units [Integer] Amount the checkout charges before tax, in the currency's smallest unit. JPY and
      #
      #   @param redirect_url [String] Stable Xquik redirect URL for the active checkout.
      #
      #   @param url [String] Same stable Xquik redirect URL as redirect_url. The response never exposes the h
    end
  end
end
