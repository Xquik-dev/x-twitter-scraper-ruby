# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Monitors
      # @see XTwitterScraper::Resources::Monitors::Keywords#update
      class KeywordUpdateResponse < XTwitterScraper::Internal::Type::BaseModel
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

        # @!method initialize(id:, created_at:, event_types:, is_active:, next_billing_at:, query:)
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
      end
    end
  end
end
