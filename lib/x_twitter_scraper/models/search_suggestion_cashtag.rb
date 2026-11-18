# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class SearchSuggestionCashtag < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute ticker
      #   Ticker symbol without the $.
      #
      #   @return [String]
      required :ticker, String

      # @!attribute name
      #   Company or token name.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute smart_tag
      #   X's tag for the asset. $TICKER for a stock, chain:contract for a token.
      #
      #   @return [String, nil]
      optional :smart_tag, String, api_name: :smartTag

      # @!attribute currency
      #   Currency of price & marketCap.
      #
      #   @return [String, nil]
      optional :currency, String

      # @!attribute price
      #   Latest price as decimal text, which keeps every digit.
      #
      #   @return [String, nil]
      optional :price, String

      # @!attribute market_cap
      #   Market capitalization as decimal text.
      #
      #   @return [String, nil]
      optional :market_cap, String, api_name: :marketCap

      # @!attribute daily_change_percent
      #   Price change over the last 24 hours, in percent.
      #
      #   @return [Float, nil]
      optional :daily_change_percent, Float, api_name: :dailyChangePercent

      # @!attribute logo_url
      #   Logo image URL.
      #
      #   @return [String, nil]
      optional :logo_url, String, api_name: :logoUrl

      # @!attribute exchange_short_name
      #   Stock exchange. Stocks only.
      #
      #   @return [String, nil]
      optional :exchange_short_name, String, api_name: :exchangeShortName

      # @!attribute contract_address
      #   Token contract address. Tokens only.
      #
      #   @return [String, nil]
      optional :contract_address, String, api_name: :contractAddress

      # @!attribute chain_logo_url
      #   Logo of the token's chain. Tokens only.
      #
      #   @return [String, nil]
      optional :chain_logo_url, String, api_name: :chainLogoUrl

      # @!method initialize(ticker:, name: nil, smart_tag: nil, currency: nil, price: nil, market_cap: nil, daily_change_percent: nil, logo_url: nil, exchange_short_name: nil, contract_address: nil, chain_logo_url: nil)
      #   A stock or crypto token X suggests for the query.
      #
      #   @param ticker [String] Ticker symbol without the $.
      #
      #   @param name [String] Company or token name.
      #
      #   @param smart_tag [String] X's tag for the asset. $TICKER for a stock, chain:contract for a token.
      #
      #   @param currency [String] Currency of price & marketCap.
      #
      #   @param price [String] Latest price as decimal text, which keeps every digit.
      #
      #   @param market_cap [String] Market capitalization as decimal text.
      #
      #   @param daily_change_percent [Float] Price change over the last 24 hours, in percent.
      #
      #   @param logo_url [String] Logo image URL.
      #
      #   @param exchange_short_name [String] Stock exchange. Stocks only.
      #
      #   @param contract_address [String] Token contract address. Tokens only.
      #
      #   @param chain_logo_url [String] Logo of the token's chain. Tokens only.
    end
  end
end
