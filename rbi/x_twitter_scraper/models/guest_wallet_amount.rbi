# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class GuestWalletAmount < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::GuestWalletAmount,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # USD amount in cents. Accepted range is $10-$250.
      sig { returns(Integer) }
      attr_accessor :amount_minor

      sig { returns(Symbol) }
      attr_accessor :currency

      # Confirmed USD amount for a guest wallet purchase.
      sig do
        params(amount_minor: Integer, currency: Symbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # USD amount in cents. Accepted range is $10-$250.
        amount_minor:,
        currency: :usd
      )
      end

      sig { override.returns({ amount_minor: Integer, currency: Symbol }) }
      def to_hash
      end
    end
  end
end
