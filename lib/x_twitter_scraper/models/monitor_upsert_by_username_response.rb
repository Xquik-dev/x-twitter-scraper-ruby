# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Monitors#upsert_by_username
    class MonitorUpsertByUsernameResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute username
      #
      #   @return [String]
      required :username, String

      # @!attribute x_user_id
      #
      #   @return [String]
      required :x_user_id, String, api_name: :xUserId

      # @!attribute name
      #   Customer-set label of the account monitor, when set.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute event_types
      #   Array of event types to subscribe to.
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::EventType>]
      required :event_types, -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::EventType] }, api_name: :eventTypes

      # @!attribute is_active
      #
      #   @return [Boolean]
      required :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute next_billing_at
      #   Next hourly credit charge time for this account monitor.
      #
      #   @return [Time]
      required :next_billing_at, Time, api_name: :nextBillingAt

      # @!attribute paused_reason
      #   Why Xquik paused this account monitor. `insufficient_credits` means the balance
      #   could not pay an hour, so add credits & resume. The other 2 mean X stopped
      #   showing the account. Absent when the monitor is active or you paused it
      #   yourself.
      #
      #   @return [Symbol, XTwitterScraper::Models::MonitorUpsertByUsernameResponse::PausedReason, nil]
      optional :paused_reason, enum: -> { XTwitterScraper::Models::MonitorUpsertByUsernameResponse::PausedReason }, api_name: :pausedReason

      # @!attribute paused_at
      #   When Xquik paused this account monitor.
      #
      #   @return [Time, nil]
      optional :paused_at, Time, api_name: :pausedAt

      # @!attribute created
      #   False, since this call updated a running monitor.
      #
      #   @return [Boolean]
      required :created, XTwitterScraper::Internal::Type::Boolean

      # @!method initialize(id:, username:, x_user_id:, event_types:, is_active:, created_at:, next_billing_at:, created:, name: nil, paused_reason: nil, paused_at: nil)
      #   Account monitor that tracks activity for a given X user.
      #
      #   @param id [String]
      #
      #   @param username [String]
      #
      #   @param x_user_id [String]
      #
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
      #
      #   @param is_active [Boolean]
      #
      #   @param created_at [Time]
      #
      #   @param next_billing_at [Time] Next hourly credit charge time for this account monitor.
      #
      #   @param created [Boolean] False, since this call updated a running monitor.
      #
      #   @param name [String] Customer-set label of the account monitor, when set.
      #
      #   @param paused_reason [Symbol, XTwitterScraper::Models::MonitorUpsertByUsernameResponse::PausedReason] Why Xquik paused this account monitor. `insufficient_credits` means the balance could not pay an hour, so add credits & resume. The other 2 mean X stopped showing the account. Absent when the monitor is active or you paused it yourself.
      #
      #   @param paused_at [Time] When Xquik paused this account monitor.

      # Why Xquik paused this account monitor. `insufficient_credits` means the balance
      # could not pay an hour, so add credits & resume. The other 2 mean X stopped
      # showing the account. Absent when the monitor is active or you paused it
      # yourself.
      module PausedReason
        extend XTwitterScraper::Internal::Type::Enum

        INSUFFICIENT_CREDITS = :insufficient_credits
        X_ACCOUNT_PROTECTED = :x_account_protected
        X_USER_NOT_FOUND = :x_user_not_found

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
