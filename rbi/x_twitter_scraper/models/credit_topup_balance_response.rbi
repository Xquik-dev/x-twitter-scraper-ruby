# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CreditTopupBalanceResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CreditTopupBalanceResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Currency the checkout charges.
      sig { returns(XTwitterScraper::Models::Currency::TaggedSymbol) }
      attr_accessor :charged_currency

      # Amount the checkout charges before tax, in the currency's smallest unit. JPY and
      # KRW have no decimals, so 1580 JPY is ¥1,580.
      sig { returns(Integer) }
      attr_accessor :charged_minor_units

      # Stable Xquik redirect URL for the active checkout.
      sig { returns(String) }
      attr_accessor :redirect_url

      # Same stable Xquik redirect URL as redirect_url. The response never exposes the
      # hosted checkout URL.
      sig { returns(String) }
      attr_accessor :url

      sig do
        params(charged_currency: XTwitterScraper::Models::Currency::OrSymbol, charged_minor_units: Integer, redirect_url: String, url: String).returns(T.attached_class)
      end
      def self.new(
        # Currency the checkout charges.
        charged_currency:,
        # Amount the checkout charges before tax, in the currency's smallest unit. JPY and
        # KRW have no decimals, so 1580 JPY is ¥1,580.
        charged_minor_units:,
        # Stable Xquik redirect URL for the active checkout.
        redirect_url:,
        # Same stable Xquik redirect URL as redirect_url. The response never exposes the
        # hosted checkout URL.
        url:
      )
      end

      sig { override.returns({ charged_currency: XTwitterScraper::Models::Currency::TaggedSymbol, charged_minor_units: Integer, redirect_url: String, url: String }) }
      def to_hash
      end
    end
  end
end
