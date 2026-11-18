# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class MonitorUpsertByUsernameResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::MonitorUpsertByUsernameResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :username

      sig { returns(String) }
      attr_accessor :x_user_id

      # Customer-set label of the account monitor, when set.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Array of event types to subscribe to.
      sig do
        returns(T::Array[XTwitterScraper::Models::EventType::TaggedSymbol])
      end
      attr_reader :event_types

      sig do
        params(
          event_types: T::Array[XTwitterScraper::Models::EventType::OrSymbol]
        ).void
      end
      attr_writer :event_types

      sig { returns(T::Boolean) }
      attr_accessor :is_active

      sig { returns(Time) }
      attr_accessor :created_at

      # Next hourly credit charge time for this account monitor.
      sig { returns(Time) }
      attr_accessor :next_billing_at

      # Why Xquik paused this account monitor. `insufficient_credits` means the balance
      # could not pay an hour, so add credits & resume. The other 2 mean X stopped
      # showing the account. Absent when the monitor is active or you paused it
      # yourself.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::MonitorUpsertByUsernameResponse::PausedReason::TaggedSymbol
          )
        )
      end
      attr_reader :paused_reason

      sig do
        params(
          paused_reason:
            XTwitterScraper::Models::MonitorUpsertByUsernameResponse::PausedReason::OrSymbol
        ).void
      end
      attr_writer :paused_reason

      # When Xquik paused this account monitor.
      sig { returns(T.nilable(Time)) }
      attr_reader :paused_at

      sig { params(paused_at: Time).void }
      attr_writer :paused_at

      # False, since this call updated a running monitor.
      sig { returns(T::Boolean) }
      attr_accessor :created

      sig do
        params(
          id: String,
          username: String,
          x_user_id: String,
          event_types: T::Array[XTwitterScraper::Models::EventType::OrSymbol],
          is_active: T::Boolean,
          created_at: Time,
          next_billing_at: Time,
          created: T::Boolean,
          name: String,
          paused_reason:
            XTwitterScraper::Models::MonitorUpsertByUsernameResponse::PausedReason::OrSymbol,
          paused_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        username:,
        x_user_id:,
        # Array of event types to subscribe to.
        event_types:,
        is_active:,
        created_at:,
        # Next hourly credit charge time for this account monitor.
        next_billing_at:,
        # False, since this call updated a running monitor.
        created:,
        # Customer-set label of the account monitor, when set.
        name: nil,
        # Why Xquik paused this account monitor. `insufficient_credits` means the balance
        # could not pay an hour, so add credits & resume. The other 2 mean X stopped
        # showing the account. Absent when the monitor is active or you paused it
        # yourself.
        paused_reason: nil,
        # When Xquik paused this account monitor.
        paused_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            username: String,
            x_user_id: String,
            name: String,
            event_types:
              T::Array[XTwitterScraper::Models::EventType::TaggedSymbol],
            is_active: T::Boolean,
            created_at: Time,
            next_billing_at: Time,
            paused_reason:
              XTwitterScraper::Models::MonitorUpsertByUsernameResponse::PausedReason::TaggedSymbol,
            paused_at: Time,
            created: T::Boolean
          }
        )
      end
      def to_hash
      end

      # Why Xquik paused this account monitor. `insufficient_credits` means the balance
      # could not pay an hour, so add credits & resume. The other 2 mean X stopped
      # showing the account. Absent when the monitor is active or you paused it
      # yourself.
      module PausedReason
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::MonitorUpsertByUsernameResponse::PausedReason
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INSUFFICIENT_CREDITS =
          T.let(
            :insufficient_credits,
            XTwitterScraper::Models::MonitorUpsertByUsernameResponse::PausedReason::TaggedSymbol
          )
        X_ACCOUNT_PROTECTED =
          T.let(
            :x_account_protected,
            XTwitterScraper::Models::MonitorUpsertByUsernameResponse::PausedReason::TaggedSymbol
          )
        X_USER_NOT_FOUND =
          T.let(
            :x_user_not_found,
            XTwitterScraper::Models::MonitorUpsertByUsernameResponse::PausedReason::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::MonitorUpsertByUsernameResponse::PausedReason::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
