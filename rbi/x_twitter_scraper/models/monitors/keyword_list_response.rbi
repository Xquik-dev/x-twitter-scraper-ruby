# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module Monitors
      class KeywordListResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Monitors::KeywordListResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :has_more

        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::Monitors::KeywordListResponse::Monitor
            ]
          )
        end
        attr_accessor :monitors

        sig { returns(Integer) }
        attr_accessor :total

        sig { returns(T.nilable(String)) }
        attr_reader :next_cursor

        sig { params(next_cursor: String).void }
        attr_writer :next_cursor

        sig do
          params(
            has_more: T::Boolean,
            monitors:
              T::Array[
                XTwitterScraper::Models::Monitors::KeywordListResponse::Monitor::OrHash
              ],
            total: Integer,
            next_cursor: String
          ).returns(T.attached_class)
        end
        def self.new(has_more:, monitors:, total:, next_cursor: nil)
        end

        sig do
          override.returns(
            {
              has_more: T::Boolean,
              monitors:
                T::Array[
                  XTwitterScraper::Models::Monitors::KeywordListResponse::Monitor
                ],
              total: Integer,
              next_cursor: String
            }
          )
        end
        def to_hash
        end

        class Monitor < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::Monitors::KeywordListResponse::Monitor,
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

          # Next hourly credit charge time for this keyword query monitor.
          sig { returns(Time) }
          attr_accessor :next_billing_at

          sig { returns(String) }
          attr_accessor :query

          # Customer-set label of the keyword monitor, when set.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # When Xquik paused this keyword monitor.
          sig { returns(T.nilable(Time)) }
          attr_reader :paused_at

          sig { params(paused_at: Time).void }
          attr_writer :paused_at

          # Why Xquik paused this keyword monitor. The balance could not pay an hour, so add
          # credits & resume. Absent when the monitor is active or you paused it yourself.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Monitors::KeywordListResponse::Monitor::PausedReason::TaggedSymbol
              )
            )
          end
          attr_reader :paused_reason

          sig do
            params(
              paused_reason:
                XTwitterScraper::Monitors::KeywordListResponse::Monitor::PausedReason::OrSymbol
            ).void
          end
          attr_writer :paused_reason

          # Keyword monitor that tracks matching public X activity.
          sig do
            params(
              id: String,
              created_at: Time,
              event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
              is_active: T::Boolean,
              next_billing_at: Time,
              query: String,
              name: String,
              paused_at: Time,
              paused_reason:
                XTwitterScraper::Monitors::KeywordListResponse::Monitor::PausedReason::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            created_at:,
            # Array of event types to subscribe to.
            event_types:,
            is_active:,
            # Next hourly credit charge time for this keyword query monitor.
            next_billing_at:,
            query:,
            # Customer-set label of the keyword monitor, when set.
            name: nil,
            # When Xquik paused this keyword monitor.
            paused_at: nil,
            # Why Xquik paused this keyword monitor. The balance could not pay an hour, so add
            # credits & resume. Absent when the monitor is active or you paused it yourself.
            paused_reason: nil
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
                query: String,
                name: String,
                paused_at: Time,
                paused_reason:
                  XTwitterScraper::Monitors::KeywordListResponse::Monitor::PausedReason::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Why Xquik paused this keyword monitor. The balance could not pay an hour, so add
          # credits & resume. Absent when the monitor is active or you paused it yourself.
          module PausedReason
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Monitors::KeywordListResponse::Monitor::PausedReason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INSUFFICIENT_CREDITS =
              T.let(
                :insufficient_credits,
                XTwitterScraper::Monitors::KeywordListResponse::Monitor::PausedReason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Monitors::KeywordListResponse::Monitor::PausedReason::TaggedSymbol
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
end
