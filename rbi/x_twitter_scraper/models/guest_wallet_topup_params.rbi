# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class GuestWalletTopupParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::GuestWalletTopupParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # USD cents accepted for this checkout.
      sig { returns(Integer) }
      attr_accessor :amount_minor

      sig { returns(Symbol) }
      attr_accessor :currency

      sig { returns(String) }
      attr_accessor :idempotency_key

      sig do
        params(
          amount_minor: Integer,
          idempotency_key: String,
          currency: Symbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # USD cents accepted for this checkout.
        amount_minor:,
        idempotency_key:,
        currency: :usd,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            amount_minor: Integer,
            currency: Symbol,
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
