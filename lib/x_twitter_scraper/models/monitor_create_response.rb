# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Monitors#create
    class MonitorCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute event_types
      #   Array of event types to subscribe to.
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::EventType>]
      required :event_types,
               -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType] },
               api_name: :eventTypes

      # @!attribute is_active
      #
      #   @return [Boolean]
      required :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

      # @!attribute next_billing_at
      #   Next hourly credit charge time. New active monitors are due immediately.
      #
      #   @return [Time]
      required :next_billing_at, Time, api_name: :nextBillingAt

      # @!attribute username
      #
      #   @return [String]
      required :username, String

      # @!attribute x_user_id
      #
      #   @return [String]
      required :x_user_id, String, api_name: :xUserId

      # @!method initialize(id:, created_at:, event_types:, is_active:, next_billing_at:, username:, x_user_id:)
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
      #
      #   @param is_active [Boolean]
      #
      #   @param next_billing_at [Time] Next hourly credit charge time. New active monitors are due immediately.
      #
      #   @param username [String]
      #
      #   @param x_user_id [String]
    end
  end
end
