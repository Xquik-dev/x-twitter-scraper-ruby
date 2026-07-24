# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CreditRetrieveBalanceResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CreditRetrieveBalanceResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Configured dollar amount for each automatic top-up.
      sig { returns(Float) }
      attr_accessor :auto_topup_amount_dollars

      sig { returns(T::Boolean) }
      attr_accessor :auto_topup_enabled

      # Credit balance threshold that triggers automatic top-up when enabled,
      # represented as a bigint string.
      sig { returns(String) }
      attr_accessor :auto_topup_threshold

      # Current credit balance as a bigint string to preserve precision above
      # Number.MAX_SAFE_INTEGER.
      sig { returns(String) }
      attr_accessor :balance

      # Lifetime purchased credits as a bigint string.
      sig { returns(String) }
      attr_accessor :lifetime_purchased

      # Lifetime consumed credits as a bigint string.
      sig { returns(String) }
      attr_accessor :lifetime_used

      sig do
        params(
          auto_topup_amount_dollars: Float,
          auto_topup_enabled: T::Boolean,
          auto_topup_threshold: String,
          balance: String,
          lifetime_purchased: String,
          lifetime_used: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Configured dollar amount for each automatic top-up.
        auto_topup_amount_dollars:,
        auto_topup_enabled:,
        # Credit balance threshold that triggers automatic top-up when enabled,
        # represented as a bigint string.
        auto_topup_threshold:,
        # Current credit balance as a bigint string to preserve precision above
        # Number.MAX_SAFE_INTEGER.
        balance:,
        # Lifetime purchased credits as a bigint string.
        lifetime_purchased:,
        # Lifetime consumed credits as a bigint string.
        lifetime_used:
      )
      end

      sig do
        override.returns(
          {
            auto_topup_amount_dollars: Float,
            auto_topup_enabled: T::Boolean,
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
  end
end
