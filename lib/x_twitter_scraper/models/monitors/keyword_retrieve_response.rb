# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Monitors
      # @see XTwitterScraper::Resources::Monitors::Keywords#retrieve
      class KeywordRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
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
        #   Next hourly credit charge time for this keyword query monitor.
        #
        #   @return [Time]
        required :next_billing_at, Time, api_name: :nextBillingAt

        # @!attribute query
        #
        #   @return [String]
        required :query, String

        # @!attribute name
        #   Customer-set label of the keyword monitor, when set.
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute paused_at
        #   When Xquik paused this keyword monitor.
        #
        #   @return [Time, nil]
        optional :paused_at, Time, api_name: :pausedAt

        # @!attribute paused_reason
        #   Why Xquik paused this keyword monitor. The balance could not pay an hour, so add
        #   credits & resume. Absent when the monitor is active or you paused it yourself.
        #
        #   @return [Symbol, XTwitterScraper::Models::Monitors::KeywordRetrieveResponse::PausedReason, nil]
        optional :paused_reason,
                 enum: -> {
                   XTwitterScraper::Monitors::KeywordRetrieveResponse::PausedReason
                 },
                 api_name: :pausedReason

        # @!method initialize(id:, created_at:, event_types:, is_active:, next_billing_at:, query:, name: nil, paused_at: nil, paused_reason: nil)
        #   Keyword monitor that tracks matching public X activity.
        #
        #   @param id [String]
        #
        #   @param created_at [Time]
        #
        #   @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
        #
        #   @param is_active [Boolean]
        #
        #   @param next_billing_at [Time] Next hourly credit charge time for this keyword query monitor.
        #
        #   @param query [String]
        #
        #   @param name [String] Customer-set label of the keyword monitor, when set.
        #
        #   @param paused_at [Time] When Xquik paused this keyword monitor.
        #
        #   @param paused_reason [Symbol, XTwitterScraper::Models::Monitors::KeywordRetrieveResponse::PausedReason] Why Xquik paused this keyword monitor. The balance could not pay an hour, so add

        # Why Xquik paused this keyword monitor. The balance could not pay an hour, so add
        # credits & resume. Absent when the monitor is active or you paused it yourself.
        #
        # @see XTwitterScraper::Models::Monitors::KeywordRetrieveResponse#paused_reason
        module PausedReason
          extend XTwitterScraper::Internal::Type::Enum

          INSUFFICIENT_CREDITS = :insufficient_credits

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
