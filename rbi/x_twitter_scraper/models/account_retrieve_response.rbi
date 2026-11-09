# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class AccountRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::AccountRetrieveResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(
          XTwitterScraper::Models::AccountRetrieveResponse::MonitorBilling
        )
      end
      attr_reader :monitor_billing

      sig do
        params(
          monitor_billing:
            XTwitterScraper::Models::AccountRetrieveResponse::MonitorBilling::OrHash
        ).void
      end
      attr_writer :monitor_billing

      # Deprecated. Monitor slots are unlimited, so this is always
      # Number.MAX_SAFE_INTEGER.
      sig { returns(Integer) }
      attr_accessor :monitors_allowed

      sig { returns(Integer) }
      attr_accessor :monitors_used

      sig do
        returns(
          XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol
        )
      end
      attr_accessor :plan

      # Subscription state without billing provider identifiers.
      sig do
        returns(XTwitterScraper::Models::AccountRetrieveResponse::Subscription)
      end
      attr_accessor :subscription

      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo
          )
        )
      end
      attr_reader :credit_info

      sig do
        params(
          credit_info:
            XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo::OrHash
        ).void
      end
      attr_writer :credit_info

      # Linked X username, omitted when no X account is connected.
      sig { returns(T.nilable(String)) }
      attr_reader :x_username

      sig { params(x_username: String).void }
      attr_writer :x_username

      sig do
        params(
          monitor_billing:
            XTwitterScraper::Models::AccountRetrieveResponse::MonitorBilling::OrHash,
          monitors_allowed: Integer,
          monitors_used: Integer,
          plan:
            XTwitterScraper::Models::AccountRetrieveResponse::Plan::OrSymbol,
          subscription:
            XTwitterScraper::Models::AccountRetrieveResponse::Subscription::OrHash,
          credit_info:
            XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo::OrHash,
          x_username: String
        ).returns(T.attached_class)
      end
      def self.new(
        monitor_billing:,
        # Deprecated. Monitor slots are unlimited, so this is always
        # Number.MAX_SAFE_INTEGER.
        monitors_allowed:,
        monitors_used:,
        plan:,
        # Subscription state without billing provider identifiers.
        subscription:,
        credit_info: nil,
        # Linked X username, omitted when no X account is connected.
        x_username: nil
      )
      end

      sig do
        override.returns(
          {
            monitor_billing:
              XTwitterScraper::Models::AccountRetrieveResponse::MonitorBilling,
            monitors_allowed: Integer,
            monitors_used: Integer,
            plan:
              XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol,
            subscription:
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription,
            credit_info:
              XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo,
            x_username: String
          }
        )
      end
      def to_hash
      end

      class MonitorBilling < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::AccountRetrieveResponse::MonitorBilling,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Estimated daily credits for currently active monitors.
        sig { returns(String) }
        attr_accessor :active_daily_estimate

        # Credits charged each hour for currently active monitors.
        sig { returns(String) }
        attr_accessor :active_hourly_burn

        # Rounded daily estimate for 1 active monitor.
        sig { returns(String) }
        attr_accessor :credits_per_active_monitor_day

        # Hourly credits charged for 1 active monitor.
        sig { returns(String) }
        attr_accessor :credits_per_active_monitor_hour

        # Webhook and event deliveries are included in monitor billing.
        sig { returns(T::Boolean) }
        attr_accessor :events_included

        # Active monitors check every 1 second.
        sig { returns(Integer) }
        attr_accessor :instant_check_interval_seconds

        # Monitor slot count is unlimited.
        sig { returns(T::Boolean) }
        attr_accessor :unlimited_slots

        sig do
          params(
            active_daily_estimate: String,
            active_hourly_burn: String,
            credits_per_active_monitor_day: String,
            credits_per_active_monitor_hour: String,
            events_included: T::Boolean,
            instant_check_interval_seconds: Integer,
            unlimited_slots: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Estimated daily credits for currently active monitors.
          active_daily_estimate:,
          # Credits charged each hour for currently active monitors.
          active_hourly_burn:,
          # Rounded daily estimate for 1 active monitor.
          credits_per_active_monitor_day:,
          # Hourly credits charged for 1 active monitor.
          credits_per_active_monitor_hour:,
          # Webhook and event deliveries are included in monitor billing.
          events_included:,
          # Active monitors check every 1 second.
          instant_check_interval_seconds:,
          # Monitor slot count is unlimited.
          unlimited_slots:
        )
        end

        sig do
          override.returns(
            {
              active_daily_estimate: String,
              active_hourly_burn: String,
              credits_per_active_monitor_day: String,
              credits_per_active_monitor_hour: String,
              events_included: T::Boolean,
              instant_check_interval_seconds: Integer,
              unlimited_slots: T::Boolean
            }
          )
        end
        def to_hash
        end
      end

      module Plan
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::AccountRetrieveResponse::Plan
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(
            :active,
            XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol
          )
        INACTIVE =
          T.let(
            :inactive,
            XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::AccountRetrieveResponse::Plan::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class CreditInfo < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Dollar amount charged when automatic top-up runs.
        sig { returns(Float) }
        attr_accessor :auto_topup_amount_dollars

        sig { returns(T::Boolean) }
        attr_accessor :auto_topup_enabled

        # True when 3 declined charges in a row on 1 card stopped automatic top-up. The
        # setting stays enabled. A paid top-up, a paid plan renewal, or the next automatic
        # top-up on a new card clears it.
        sig { returns(T::Boolean) }
        attr_accessor :auto_topup_stopped

        # Bigint string threshold that triggers automatic top-up when enabled.
        sig { returns(String) }
        attr_accessor :auto_topup_threshold

        # Bigint string to preserve precision above Number.MAX_SAFE_INTEGER.
        sig { returns(String) }
        attr_accessor :balance

        # Total purchased credits as a bigint string.
        sig { returns(String) }
        attr_accessor :lifetime_purchased

        # Total consumed credits as a bigint string.
        sig { returns(String) }
        attr_accessor :lifetime_used

        sig do
          params(
            auto_topup_amount_dollars: Float,
            auto_topup_enabled: T::Boolean,
            auto_topup_stopped: T::Boolean,
            auto_topup_threshold: String,
            balance: String,
            lifetime_purchased: String,
            lifetime_used: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Dollar amount charged when automatic top-up runs.
          auto_topup_amount_dollars:,
          auto_topup_enabled:,
          # True when 3 declined charges in a row on 1 card stopped automatic top-up. The
          # setting stays enabled. A paid top-up, a paid plan renewal, or the next automatic
          # top-up on a new card clears it.
          auto_topup_stopped:,
          # Bigint string threshold that triggers automatic top-up when enabled.
          auto_topup_threshold:,
          # Bigint string to preserve precision above Number.MAX_SAFE_INTEGER.
          balance:,
          # Total purchased credits as a bigint string.
          lifetime_purchased:,
          # Total consumed credits as a bigint string.
          lifetime_used:
        )
        end

        sig do
          override.returns(
            {
              auto_topup_amount_dollars: Float,
              auto_topup_enabled: T::Boolean,
              auto_topup_stopped: T::Boolean,
              auto_topup_threshold: String,
              balance: String,
              lifetime_purchased: String,
              lifetime_used: String
            }
          )
        end
        def to_hash
        end
      end

      class Subscription < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Tier::TaggedSymbol
            )
          )
        end
        attr_reader :tier

        sig do
          params(
            tier:
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Tier::OrSymbol
          ).void
        end
        attr_writer :tier

        sig { returns(T.nilable(Time)) }
        attr_reader :current_period_start

        sig { params(current_period_start: Time).void }
        attr_writer :current_period_start

        # Renewal date, or the end date when canceling.
        sig { returns(T.nilable(Time)) }
        attr_reader :current_period_end

        sig { params(current_period_end: Time).void }
        attr_writer :current_period_end

        # Subscription state without billing provider identifiers.
        sig do
          params(
            status:
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Status::OrSymbol,
            tier:
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Tier::OrSymbol,
            current_period_start: Time,
            current_period_end: Time
          ).returns(T.attached_class)
        end
        def self.new(
          status:,
          tier: nil,
          current_period_start: nil,
          # Renewal date, or the end date when canceling.
          current_period_end: nil
        )
        end

        sig do
          override.returns(
            {
              status:
                XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Status::TaggedSymbol,
              tier:
                XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Tier::TaggedSymbol,
              current_period_start: Time,
              current_period_end: Time
            }
          )
        end
        def to_hash
        end

        module Status
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NONE =
            T.let(
              :none,
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Status::TaggedSymbol
            )
          ACTIVE =
            T.let(
              :active,
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Status::TaggedSymbol
            )
          PAST_DUE =
            T.let(
              :past_due,
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Status::TaggedSymbol
            )
          CANCELING =
            T.let(
              :canceling,
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Status::TaggedSymbol
            )
          INCOMPLETE =
            T.let(
              :incomplete,
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Tier
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Tier
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STARTER =
            T.let(
              :starter,
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Tier::TaggedSymbol
            )
          PRO =
            T.let(
              :pro,
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Tier::TaggedSymbol
            )
          BUSINESS =
            T.let(
              :business,
              XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Tier::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::AccountRetrieveResponse::Subscription::Tier::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
