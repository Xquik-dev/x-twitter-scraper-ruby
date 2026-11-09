# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Subscribe#create
    class SubscribeCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute currency
      #   ISO 4217 code of a currency Xquik charges in.
      #
      #   @return [Symbol, XTwitterScraper::Models::SubscribeCreateParams::Currency, nil]
      optional :currency, enum: -> { XTwitterScraper::SubscribeCreateParams::Currency }

      # @!attribute tier
      #   Subscription tier to pre-select.
      #
      #   @return [Symbol, XTwitterScraper::Models::SubscribeCreateParams::Tier, nil]
      optional :tier, enum: -> { XTwitterScraper::SubscribeCreateParams::Tier }

      # @!method initialize(currency: nil, tier: nil, request_options: {})
      #   @param currency [Symbol, XTwitterScraper::Models::SubscribeCreateParams::Currency] ISO 4217 code of a currency Xquik charges in.
      #
      #   @param tier [Symbol, XTwitterScraper::Models::SubscribeCreateParams::Tier] Subscription tier to pre-select.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Subscription tier to pre-select.
      module Tier
        extend XTwitterScraper::Internal::Type::Enum

        STARTER = :starter
        PRO = :pro
        BUSINESS = :business

        # @!method self.values
        #   @return [Array<Symbol>]
      end

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
