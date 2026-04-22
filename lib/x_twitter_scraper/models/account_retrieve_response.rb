# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Account#retrieve
    class AccountRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute monitors_allowed
      #
      #   @return [Integer]
      required :monitors_allowed, Integer, api_name: :monitorsAllowed

      # @!attribute monitors_used
      #
      #   @return [Integer]
      required :monitors_used, Integer, api_name: :monitorsUsed

      # @!attribute plan
      #
      #   @return [Symbol, XTwitterScraper::Models::AccountRetrieveResponse::Plan]
      required :plan, enum: -> { XTwitterScraper::Models::AccountRetrieveResponse::Plan }

      # @!attribute credit_info
      #
      #   @return [XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo, nil]
      optional :credit_info,
               -> { XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo },
               api_name: :creditInfo

      # @!method initialize(monitors_allowed:, monitors_used:, plan:, credit_info: nil)
      #   @param monitors_allowed [Integer]
      #   @param monitors_used [Integer]
      #   @param plan [Symbol, XTwitterScraper::Models::AccountRetrieveResponse::Plan]
      #   @param credit_info [XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo]

      # @see XTwitterScraper::Models::AccountRetrieveResponse#plan
      module Plan
        extend XTwitterScraper::Internal::Type::Enum

        ACTIVE = :active
        INACTIVE = :inactive

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see XTwitterScraper::Models::AccountRetrieveResponse#credit_info
      class CreditInfo < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute auto_topup_enabled
        #
        #   @return [Boolean]
        required :auto_topup_enabled, XTwitterScraper::Internal::Type::Boolean, api_name: :autoTopupEnabled

        # @!attribute balance
        #
        #   @return [Integer]
        required :balance, Integer

        # @!attribute lifetime_purchased
        #
        #   @return [Integer]
        required :lifetime_purchased, Integer, api_name: :lifetimePurchased

        # @!attribute lifetime_used
        #
        #   @return [Integer]
        required :lifetime_used, Integer, api_name: :lifetimeUsed

        # @!method initialize(auto_topup_enabled:, balance:, lifetime_purchased:, lifetime_used:)
        #   @param auto_topup_enabled [Boolean]
        #   @param balance [Integer]
        #   @param lifetime_purchased [Integer]
        #   @param lifetime_used [Integer]
      end
    end
  end
end
