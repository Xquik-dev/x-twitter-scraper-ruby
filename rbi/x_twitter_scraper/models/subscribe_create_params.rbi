# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SubscribeCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::SubscribeCreateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # ISO 4217 code of a currency Xquik charges in.
      sig do
        returns(
          T.nilable(XTwitterScraper::SubscribeCreateParams::Currency::OrSymbol)
        )
      end
      attr_reader :currency

      sig do
        params(
          currency: XTwitterScraper::SubscribeCreateParams::Currency::OrSymbol
        ).void
      end
      attr_writer :currency

      # Subscription tier to pre-select.
      sig do
        returns(
          T.nilable(XTwitterScraper::SubscribeCreateParams::Tier::OrSymbol)
        )
      end
      attr_reader :tier

      sig do
        params(
          tier: XTwitterScraper::SubscribeCreateParams::Tier::OrSymbol
        ).void
      end
      attr_writer :tier

      sig do
        params(
          currency: XTwitterScraper::SubscribeCreateParams::Currency::OrSymbol,
          tier: XTwitterScraper::SubscribeCreateParams::Tier::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ISO 4217 code of a currency Xquik charges in.
        currency: nil,
        # Subscription tier to pre-select.
        tier: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            currency:
              XTwitterScraper::SubscribeCreateParams::Currency::OrSymbol,
            tier: XTwitterScraper::SubscribeCreateParams::Tier::OrSymbol,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Subscription tier to pre-select.
      module Tier
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::SubscribeCreateParams::Tier)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STARTER =
          T.let(
            :starter,
            XTwitterScraper::SubscribeCreateParams::Tier::TaggedSymbol
          )
        PRO =
          T.let(
            :pro,
            XTwitterScraper::SubscribeCreateParams::Tier::TaggedSymbol
          )
        BUSINESS =
          T.let(
            :business,
            XTwitterScraper::SubscribeCreateParams::Tier::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::SubscribeCreateParams::Tier::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # ISO 4217 code of a currency Xquik charges in.
      module Currency
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::SubscribeCreateParams::Currency)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        USD =
          T.let(
            :USD,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        EUR =
          T.let(
            :EUR,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        GBP =
          T.let(
            :GBP,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        TRY =
          T.let(
            :TRY,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        JPY =
          T.let(
            :JPY,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        CNY =
          T.let(
            :CNY,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        KRW =
          T.let(
            :KRW,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        CAD =
          T.let(
            :CAD,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        AUD =
          T.let(
            :AUD,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        MXN =
          T.let(
            :MXN,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        AED =
          T.let(
            :AED,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        BRL =
          T.let(
            :BRL,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        CHF =
          T.let(
            :CHF,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        CZK =
          T.let(
            :CZK,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        DKK =
          T.let(
            :DKK,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        HKD =
          T.let(
            :HKD,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        HUF =
          T.let(
            :HUF,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        IDR =
          T.let(
            :IDR,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        ILS =
          T.let(
            :ILS,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        INR =
          T.let(
            :INR,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        MYR =
          T.let(
            :MYR,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        NOK =
          T.let(
            :NOK,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        NZD =
          T.let(
            :NZD,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        PHP =
          T.let(
            :PHP,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        PLN =
          T.let(
            :PLN,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        QAR =
          T.let(
            :QAR,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        RON =
          T.let(
            :RON,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        SAR =
          T.let(
            :SAR,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        SEK =
          T.let(
            :SEK,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        SGD =
          T.let(
            :SGD,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        THB =
          T.let(
            :THB,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )
        ZAR =
          T.let(
            :ZAR,
            XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::SubscribeCreateParams::Currency::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
