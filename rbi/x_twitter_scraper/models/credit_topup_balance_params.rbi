# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CreditTopupBalanceParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::CreditTopupBalanceParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Amount to top up in US dollars. Minimum 10.
      sig { returns(Integer) }
      attr_accessor :dollars

      # ISO 4217 code of a currency Xquik charges in.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::CreditTopupBalanceParams::Currency::OrSymbol
          )
        )
      end
      attr_reader :currency

      sig do
        params(
          currency:
            XTwitterScraper::CreditTopupBalanceParams::Currency::OrSymbol
        ).void
      end
      attr_writer :currency

      # Optional checkout locale. Defaults to en.
      sig { returns(T.nilable(String)) }
      attr_reader :locale

      sig { params(locale: String).void }
      attr_writer :locale

      # Optional Xquik tool page to return to after Checkout, such as
      # /en/x-article-reader.
      sig { returns(T.nilable(String)) }
      attr_reader :return_path

      sig { params(return_path: String).void }
      attr_writer :return_path

      sig do
        params(
          dollars: Integer,
          currency:
            XTwitterScraper::CreditTopupBalanceParams::Currency::OrSymbol,
          locale: String,
          return_path: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Amount to top up in US dollars. Minimum 10.
        dollars:,
        # ISO 4217 code of a currency Xquik charges in.
        currency: nil,
        # Optional checkout locale. Defaults to en.
        locale: nil,
        # Optional Xquik tool page to return to after Checkout, such as
        # /en/x-article-reader.
        return_path: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            dollars: Integer,
            currency:
              XTwitterScraper::CreditTopupBalanceParams::Currency::OrSymbol,
            locale: String,
            return_path: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      # ISO 4217 code of a currency Xquik charges in.
      module Currency
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::CreditTopupBalanceParams::Currency)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        USD =
          T.let(
            :USD,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        EUR =
          T.let(
            :EUR,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        GBP =
          T.let(
            :GBP,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        TRY =
          T.let(
            :TRY,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        JPY =
          T.let(
            :JPY,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        CNY =
          T.let(
            :CNY,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        KRW =
          T.let(
            :KRW,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        CAD =
          T.let(
            :CAD,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        AUD =
          T.let(
            :AUD,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        MXN =
          T.let(
            :MXN,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        AED =
          T.let(
            :AED,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        BRL =
          T.let(
            :BRL,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        CHF =
          T.let(
            :CHF,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        CZK =
          T.let(
            :CZK,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        DKK =
          T.let(
            :DKK,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        HKD =
          T.let(
            :HKD,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        HUF =
          T.let(
            :HUF,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        IDR =
          T.let(
            :IDR,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        ILS =
          T.let(
            :ILS,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        INR =
          T.let(
            :INR,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        MYR =
          T.let(
            :MYR,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        NOK =
          T.let(
            :NOK,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        NZD =
          T.let(
            :NZD,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        PHP =
          T.let(
            :PHP,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        PLN =
          T.let(
            :PLN,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        QAR =
          T.let(
            :QAR,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        RON =
          T.let(
            :RON,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        SAR =
          T.let(
            :SAR,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        SEK =
          T.let(
            :SEK,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        SGD =
          T.let(
            :SGD,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        THB =
          T.let(
            :THB,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )
        ZAR =
          T.let(
            :ZAR,
            XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::CreditTopupBalanceParams::Currency::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
