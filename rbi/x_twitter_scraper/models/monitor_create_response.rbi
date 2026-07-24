# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class MonitorCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::MonitorCreateResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      # Array of event types to subscribe to.
      sig { returns(T::Array[XTwitterScraper::EventType::TaggedSymbol]) }
      attr_accessor :event_types

      sig { returns(T::Boolean) }
      attr_accessor :is_active

      # Next hourly credit charge time. New active monitors are due immediately.
      sig { returns(Time) }
      attr_accessor :next_billing_at

      sig { returns(String) }
      attr_accessor :username

      sig { returns(String) }
      attr_accessor :x_user_id

      sig do
        params(
          id: String,
          created_at: Time,
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          is_active: T::Boolean,
          next_billing_at: Time,
          username: String,
          x_user_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        # Array of event types to subscribe to.
        event_types:,
        is_active:,
        # Next hourly credit charge time. New active monitors are due immediately.
        next_billing_at:,
        username:,
        x_user_id:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            event_types: T::Array[XTwitterScraper::EventType::TaggedSymbol],
            is_active: T::Boolean,
            next_billing_at: Time,
            username: String,
            x_user_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
