# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::GuestWallets#topup
    class GuestWalletTopupParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute amount_minor
      #   USD cents accepted for this checkout.
      #
      #   @return [Integer]
      required :amount_minor, Integer

      # @!attribute currency
      #
      #   @return [Symbol, :usd]
      required :currency, const: :usd

      # @!attribute idempotency_key
      #
      #   @return [String]
      required :idempotency_key, String

      # @!method initialize(amount_minor:, idempotency_key:, currency: :usd, request_options: {})
      #   @param amount_minor [Integer] USD cents accepted for this checkout.
      #
      #   @param idempotency_key [String]
      #
      #   @param currency [Symbol, :usd]
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
