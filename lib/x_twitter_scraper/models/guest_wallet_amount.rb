# frozen_string_literal: true

module XTwitterScraper
  module Models
    class GuestWalletAmount < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute amount_minor
      #   USD amount in cents. Accepted range is $10-$250.
      #
      #   @return [Integer]
      required :amount_minor, Integer

      # @!attribute currency
      #
      #   @return [Symbol, :usd]
      required :currency, const: :usd

      # @!method initialize(amount_minor:, currency: :usd)
      #   Confirmed USD amount for a guest wallet purchase.
      #
      #   @param amount_minor [Integer] USD amount in cents. Accepted range is $10-$250.
      #
      #   @param currency [Symbol, :usd]
    end
  end
end
