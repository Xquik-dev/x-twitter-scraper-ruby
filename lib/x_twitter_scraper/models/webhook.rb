# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#update
    class Webhook < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute consecutive_failures
      #   Consecutive failed delivery attempts since the last success.
      #
      #   @return [Integer]
      required :consecutive_failures, Integer, api_name: :consecutiveFailures

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute delivery_status
      #   Endpoint delivery state. needs_attention means delivery stopped after repeated
      #   failures.
      #
      #   @return [Symbol, XTwitterScraper::Models::Webhook::DeliveryStatus]
      required :delivery_status,
               enum: -> { XTwitterScraper::Webhook::DeliveryStatus },
               api_name: :deliveryStatus

      # @!attribute event_types
      #   Array of event types to subscribe to.
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::EventType>]
      required :event_types,
               -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType] },
               api_name: :eventTypes

      # @!attribute failure_hard_cap
      #   Consecutive delivery failures that pause the endpoint.
      #
      #   @return [Integer]
      required :failure_hard_cap, Integer, api_name: :failureHardCap

      # @!attribute is_active
      #
      #   @return [Boolean]
      required :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!method initialize(id:, consecutive_failures:, created_at:, delivery_status:, event_types:, failure_hard_cap:, is_active:, url:)
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::Webhook} for more details.
      #
      #   Webhook endpoint registered to receive event deliveries.
      #
      #   @param id [String]
      #
      #   @param consecutive_failures [Integer] Consecutive failed delivery attempts since the last success.
      #
      #   @param created_at [Time]
      #
      #   @param delivery_status [Symbol, XTwitterScraper::Models::Webhook::DeliveryStatus] Endpoint delivery state. needs_attention means delivery stopped after repeated f
      #
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
      #
      #   @param failure_hard_cap [Integer] Consecutive delivery failures that pause the endpoint.
      #
      #   @param is_active [Boolean]
      #
      #   @param url [String]

      # Endpoint delivery state. needs_attention means delivery stopped after repeated
      # failures.
      #
      # @see XTwitterScraper::Models::Webhook#delivery_status
      module DeliveryStatus
        extend XTwitterScraper::Internal::Type::Enum

        ACTIVE = :active
        PAUSED = :paused
        NEEDS_ATTENTION = :needs_attention

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
