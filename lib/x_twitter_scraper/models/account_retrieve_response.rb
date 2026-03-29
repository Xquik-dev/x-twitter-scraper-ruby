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

      # @!attribute current_period
      #
      #   @return [XTwitterScraper::Models::AccountRetrieveResponse::CurrentPeriod, nil]
      optional :current_period,
               -> { XTwitterScraper::Models::AccountRetrieveResponse::CurrentPeriod },
               api_name: :currentPeriod

      # @!method initialize(monitors_allowed:, monitors_used:, plan:, current_period: nil)
      #   @param monitors_allowed [Integer]
      #   @param monitors_used [Integer]
      #   @param plan [Symbol, XTwitterScraper::Models::AccountRetrieveResponse::Plan]
      #   @param current_period [XTwitterScraper::Models::AccountRetrieveResponse::CurrentPeriod]

      # @see XTwitterScraper::Models::AccountRetrieveResponse#plan
      module Plan
        extend XTwitterScraper::Internal::Type::Enum

        ACTIVE = :active
        INACTIVE = :inactive

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see XTwitterScraper::Models::AccountRetrieveResponse#current_period
      class CurrentPeriod < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute end_
        #
        #   @return [Time]
        required :end_, Time, api_name: :end

        # @!attribute start
        #
        #   @return [Time]
        required :start, Time

        # @!attribute usage_percent
        #
        #   @return [Float]
        required :usage_percent, Float, api_name: :usagePercent

        # @!method initialize(end_:, start:, usage_percent:)
        #   @param end_ [Time]
        #   @param start [Time]
        #   @param usage_percent [Float]
      end
    end
  end
end
