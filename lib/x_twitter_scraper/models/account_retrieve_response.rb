# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Account#retrieve
    class AccountRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute monitor_billing
      #
      #   @return [XTwitterScraper::Models::AccountRetrieveResponse::MonitorBilling]
      required :monitor_billing,
               -> { XTwitterScraper::Models::AccountRetrieveResponse::MonitorBilling },
               api_name: :monitorBilling

      # @!attribute monitors_allowed
      #   @deprecated Monitor slots are unlimited. Use monitorBilling.unlimitedSlots instead.
      #
      #   Deprecated. Monitor slots are unlimited, so this is always
      #   Number.MAX_SAFE_INTEGER.
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

      # @!attribute x_username
      #   Linked X username, omitted when no X account is connected.
      #
      #   @return [String, nil]
      optional :x_username, String, api_name: :xUsername

      # @!method initialize(monitor_billing:, monitors_allowed:, monitors_used:, plan:, credit_info: nil, x_username: nil)
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::AccountRetrieveResponse} for more details.
      #
      #   @param monitor_billing [XTwitterScraper::Models::AccountRetrieveResponse::MonitorBilling]
      #
      #   @param monitors_allowed [Integer] Deprecated. Monitor slots are unlimited, so this is always Number.MAX_SAFE_INTEG
      #
      #   @param monitors_used [Integer]
      #
      #   @param plan [Symbol, XTwitterScraper::Models::AccountRetrieveResponse::Plan]
      #
      #   @param credit_info [XTwitterScraper::Models::AccountRetrieveResponse::CreditInfo]
      #
      #   @param x_username [String] Linked X username, omitted when no X account is connected.

      # @see XTwitterScraper::Models::AccountRetrieveResponse#monitor_billing
      class MonitorBilling < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute active_daily_estimate
        #   Estimated daily credits for currently active monitors.
        #
        #   @return [String]
        required :active_daily_estimate, String, api_name: :activeDailyEstimate

        # @!attribute active_hourly_burn
        #   Credits charged each hour for currently active monitors.
        #
        #   @return [String]
        required :active_hourly_burn, String, api_name: :activeHourlyBurn

        # @!attribute credits_per_active_monitor_day
        #   Rounded daily estimate for 1 active monitor.
        #
        #   @return [String]
        required :credits_per_active_monitor_day, String, api_name: :creditsPerActiveMonitorDay

        # @!attribute credits_per_active_monitor_hour
        #   Hourly credits charged for 1 active monitor.
        #
        #   @return [String]
        required :credits_per_active_monitor_hour, String, api_name: :creditsPerActiveMonitorHour

        # @!attribute events_included
        #   Webhook and event deliveries are included in monitor billing.
        #
        #   @return [Boolean]
        required :events_included, XTwitterScraper::Internal::Type::Boolean, api_name: :eventsIncluded

        # @!attribute instant_check_interval_seconds
        #   Active monitors check every 1 second.
        #
        #   @return [Integer]
        required :instant_check_interval_seconds, Integer, api_name: :instantCheckIntervalSeconds

        # @!attribute unlimited_slots
        #   Monitor slot count is unlimited.
        #
        #   @return [Boolean]
        required :unlimited_slots, XTwitterScraper::Internal::Type::Boolean, api_name: :unlimitedSlots

        # @!method initialize(active_daily_estimate:, active_hourly_burn:, credits_per_active_monitor_day:, credits_per_active_monitor_hour:, events_included:, instant_check_interval_seconds:, unlimited_slots:)
        #   @param active_daily_estimate [String] Estimated daily credits for currently active monitors.
        #
        #   @param active_hourly_burn [String] Credits charged each hour for currently active monitors.
        #
        #   @param credits_per_active_monitor_day [String] Rounded daily estimate for 1 active monitor.
        #
        #   @param credits_per_active_monitor_hour [String] Hourly credits charged for 1 active monitor.
        #
        #   @param events_included [Boolean] Webhook and event deliveries are included in monitor billing.
        #
        #   @param instant_check_interval_seconds [Integer] Active monitors check every 1 second.
        #
        #   @param unlimited_slots [Boolean] Monitor slot count is unlimited.
      end

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
        # @!attribute auto_topup_amount_dollars
        #   Dollar amount charged when automatic top-up runs.
        #
        #   @return [Float]
        required :auto_topup_amount_dollars, Float, api_name: :autoTopupAmountDollars

        # @!attribute auto_topup_enabled
        #
        #   @return [Boolean]
        required :auto_topup_enabled, XTwitterScraper::Internal::Type::Boolean, api_name: :autoTopupEnabled

        # @!attribute auto_topup_threshold
        #   Bigint string threshold that triggers automatic top-up when enabled.
        #
        #   @return [String]
        required :auto_topup_threshold, String, api_name: :autoTopupThreshold

        # @!attribute balance
        #   Bigint string to preserve precision above Number.MAX_SAFE_INTEGER.
        #
        #   @return [String]
        required :balance, String

        # @!attribute lifetime_purchased
        #   Total purchased credits as a bigint string.
        #
        #   @return [String]
        required :lifetime_purchased, String, api_name: :lifetimePurchased

        # @!attribute lifetime_used
        #   Total consumed credits as a bigint string.
        #
        #   @return [String]
        required :lifetime_used, String, api_name: :lifetimeUsed

        # @!method initialize(auto_topup_amount_dollars:, auto_topup_enabled:, auto_topup_threshold:, balance:, lifetime_purchased:, lifetime_used:)
        #   @param auto_topup_amount_dollars [Float] Dollar amount charged when automatic top-up runs.
        #
        #   @param auto_topup_enabled [Boolean]
        #
        #   @param auto_topup_threshold [String] Bigint string threshold that triggers automatic top-up when enabled.
        #
        #   @param balance [String] Bigint string to preserve precision above Number.MAX_SAFE_INTEGER.
        #
        #   @param lifetime_purchased [String] Total purchased credits as a bigint string.
        #
        #   @param lifetime_used [String] Total consumed credits as a bigint string.
      end
    end
  end
end
