# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    # ISO 4217 code of a currency Xquik charges in.
    module Currency
      extend XTwitterScraper::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, XTwitterScraper::Models::Currency) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      USD = T.let(:USD, XTwitterScraper::Models::Currency::TaggedSymbol)
      EUR = T.let(:EUR, XTwitterScraper::Models::Currency::TaggedSymbol)
      GBP = T.let(:GBP, XTwitterScraper::Models::Currency::TaggedSymbol)
      TRY = T.let(:TRY, XTwitterScraper::Models::Currency::TaggedSymbol)
      JPY = T.let(:JPY, XTwitterScraper::Models::Currency::TaggedSymbol)
      CNY = T.let(:CNY, XTwitterScraper::Models::Currency::TaggedSymbol)
      KRW = T.let(:KRW, XTwitterScraper::Models::Currency::TaggedSymbol)
      CAD = T.let(:CAD, XTwitterScraper::Models::Currency::TaggedSymbol)
      AUD = T.let(:AUD, XTwitterScraper::Models::Currency::TaggedSymbol)
      MXN = T.let(:MXN, XTwitterScraper::Models::Currency::TaggedSymbol)
      AED = T.let(:AED, XTwitterScraper::Models::Currency::TaggedSymbol)
      BRL = T.let(:BRL, XTwitterScraper::Models::Currency::TaggedSymbol)
      CHF = T.let(:CHF, XTwitterScraper::Models::Currency::TaggedSymbol)
      CZK = T.let(:CZK, XTwitterScraper::Models::Currency::TaggedSymbol)
      DKK = T.let(:DKK, XTwitterScraper::Models::Currency::TaggedSymbol)
      HKD = T.let(:HKD, XTwitterScraper::Models::Currency::TaggedSymbol)
      HUF = T.let(:HUF, XTwitterScraper::Models::Currency::TaggedSymbol)
      IDR = T.let(:IDR, XTwitterScraper::Models::Currency::TaggedSymbol)
      ILS = T.let(:ILS, XTwitterScraper::Models::Currency::TaggedSymbol)
      INR = T.let(:INR, XTwitterScraper::Models::Currency::TaggedSymbol)
      MYR = T.let(:MYR, XTwitterScraper::Models::Currency::TaggedSymbol)
      NOK = T.let(:NOK, XTwitterScraper::Models::Currency::TaggedSymbol)
      NZD = T.let(:NZD, XTwitterScraper::Models::Currency::TaggedSymbol)
      PHP = T.let(:PHP, XTwitterScraper::Models::Currency::TaggedSymbol)
      PLN = T.let(:PLN, XTwitterScraper::Models::Currency::TaggedSymbol)
      QAR = T.let(:QAR, XTwitterScraper::Models::Currency::TaggedSymbol)
      RON = T.let(:RON, XTwitterScraper::Models::Currency::TaggedSymbol)
      SAR = T.let(:SAR, XTwitterScraper::Models::Currency::TaggedSymbol)
      SEK = T.let(:SEK, XTwitterScraper::Models::Currency::TaggedSymbol)
      SGD = T.let(:SGD, XTwitterScraper::Models::Currency::TaggedSymbol)
      THB = T.let(:THB, XTwitterScraper::Models::Currency::TaggedSymbol)
      ZAR = T.let(:ZAR, XTwitterScraper::Models::Currency::TaggedSymbol)

      sig do
        override.returns(
          T::Array[XTwitterScraper::Models::Currency::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
