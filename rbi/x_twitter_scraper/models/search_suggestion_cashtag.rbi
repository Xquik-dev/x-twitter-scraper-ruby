# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SearchSuggestionCashtag < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SearchSuggestionCashtag,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Ticker symbol without the $.
      sig { returns(String) }
      attr_accessor :ticker

      # Company or token name.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # X's tag for the asset. $TICKER for a stock, chain:contract for a token.
      sig { returns(T.nilable(String)) }
      attr_reader :smart_tag

      sig { params(smart_tag: String).void }
      attr_writer :smart_tag

      # Currency of price & marketCap.
      sig { returns(T.nilable(String)) }
      attr_reader :currency

      sig { params(currency: String).void }
      attr_writer :currency

      # Latest price as decimal text, which keeps every digit.
      sig { returns(T.nilable(String)) }
      attr_reader :price

      sig { params(price: String).void }
      attr_writer :price

      # Market capitalization as decimal text.
      sig { returns(T.nilable(String)) }
      attr_reader :market_cap

      sig { params(market_cap: String).void }
      attr_writer :market_cap

      # Price change over the last 24 hours, in percent.
      sig { returns(T.nilable(Float)) }
      attr_reader :daily_change_percent

      sig { params(daily_change_percent: Float).void }
      attr_writer :daily_change_percent

      # Logo image URL.
      sig { returns(T.nilable(String)) }
      attr_reader :logo_url

      sig { params(logo_url: String).void }
      attr_writer :logo_url

      # Stock exchange. Stocks only.
      sig { returns(T.nilable(String)) }
      attr_reader :exchange_short_name

      sig { params(exchange_short_name: String).void }
      attr_writer :exchange_short_name

      # Token contract address. Tokens only.
      sig { returns(T.nilable(String)) }
      attr_reader :contract_address

      sig { params(contract_address: String).void }
      attr_writer :contract_address

      # Logo of the token's chain. Tokens only.
      sig { returns(T.nilable(String)) }
      attr_reader :chain_logo_url

      sig { params(chain_logo_url: String).void }
      attr_writer :chain_logo_url

      sig do
        params(
          ticker: String,
          name: String,
          smart_tag: String,
          currency: String,
          price: String,
          market_cap: String,
          daily_change_percent: Float,
          logo_url: String,
          exchange_short_name: String,
          contract_address: String,
          chain_logo_url: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Ticker symbol without the $.
        ticker:,
        # Company or token name.
        name: nil,
        # X's tag for the asset. $TICKER for a stock, chain:contract for a token.
        smart_tag: nil,
        # Currency of price & marketCap.
        currency: nil,
        # Latest price as decimal text, which keeps every digit.
        price: nil,
        # Market capitalization as decimal text.
        market_cap: nil,
        # Price change over the last 24 hours, in percent.
        daily_change_percent: nil,
        # Logo image URL.
        logo_url: nil,
        # Stock exchange. Stocks only.
        exchange_short_name: nil,
        # Token contract address. Tokens only.
        contract_address: nil,
        # Logo of the token's chain. Tokens only.
        chain_logo_url: nil
      )
      end

      sig do
        override.returns(
          {
            ticker: String,
            name: String,
            smart_tag: String,
            currency: String,
            price: String,
            market_cap: String,
            daily_change_percent: Float,
            logo_url: String,
            exchange_short_name: String,
            contract_address: String,
            chain_logo_url: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
