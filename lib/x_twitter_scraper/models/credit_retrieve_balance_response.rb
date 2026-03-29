# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Credits#retrieve_balance
    class CreditRetrieveBalanceResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute auto_topup_enabled
      #
      #   @return [Boolean]
      required :auto_topup_enabled, XTwitterScraper::Internal::Type::Boolean

      # @!attribute balance
      #
      #   @return [Integer]
      required :balance, Integer

      # @!attribute lifetime_purchased
      #
      #   @return [Integer]
      required :lifetime_purchased, Integer

      # @!attribute lifetime_used
      #
      #   @return [Integer]
      required :lifetime_used, Integer

      # @!method initialize(auto_topup_enabled:, balance:, lifetime_purchased:, lifetime_used:)
      #   @param auto_topup_enabled [Boolean]
      #   @param balance [Integer]
      #   @param lifetime_purchased [Integer]
      #   @param lifetime_used [Integer]
    end
  end
end
