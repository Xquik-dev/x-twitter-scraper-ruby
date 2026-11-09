# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Credits#topup_balance
    class CreditTopupBalanceParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute dollars
      #   Amount to top up in US dollars. Minimum 10.
      #
      #   @return [Integer]
      required :dollars, Integer

      # @!attribute currency
      #   ISO 4217 code of a currency Xquik charges in.
      #
      #   @return [Symbol, XTwitterScraper::Models::CreditTopupBalanceParams::Currency, nil]
      optional :currency, enum: -> { XTwitterScraper::CreditTopupBalanceParams::Currency }

      # @!attribute locale
      #   Optional checkout locale. Defaults to en.
      #
      #   @return [String, nil]
      optional :locale, String

      # @!attribute return_path
      #   Optional Xquik tool page to return to after Checkout, such as
      #   /en/x-article-reader.
      #
      #   @return [String, nil]
      optional :return_path, String, api_name: :returnPath

      # @!method initialize(dollars:, currency: nil, locale: nil, return_path: nil, request_options: {})
      #   @param dollars [Integer] Amount to top up in US dollars. Minimum 10.
      #
      #   @param currency [Symbol, XTwitterScraper::Models::CreditTopupBalanceParams::Currency] ISO 4217 code of a currency Xquik charges in.
      #
      #   @param locale [String] Optional checkout locale. Defaults to en.
      #
      #   @param return_path [String] Optional Xquik tool page to return to after Checkout, such as /en/x-article-read
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # ISO 4217 code of a currency Xquik charges in.
      module Currency
        extend XTwitterScraper::Internal::Type::Enum

        USD = :USD
        EUR = :EUR
        GBP = :GBP
        TRY = :TRY
        JPY = :JPY
        CNY = :CNY
        KRW = :KRW
        CAD = :CAD
        AUD = :AUD
        MXN = :MXN
        AED = :AED
        BRL = :BRL
        CHF = :CHF
        CZK = :CZK
        DKK = :DKK
        HKD = :HKD
        HUF = :HUF
        IDR = :IDR
        ILS = :ILS
        INR = :INR
        MYR = :MYR
        NOK = :NOK
        NZD = :NZD
        PHP = :PHP
        PLN = :PLN
        QAR = :QAR
        RON = :RON
        SAR = :SAR
        SEK = :SEK
        SGD = :SGD
        THB = :THB
        ZAR = :ZAR

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
