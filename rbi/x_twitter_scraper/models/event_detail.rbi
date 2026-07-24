# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class EventDetail < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::EventDetail,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Event payload - shape varies by event type (JSON)
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :data

      # Monitor ID associated with this detailed event payload.
      sig { returns(String) }
      attr_accessor :monitor_id

      # Source monitor type for this detailed event.
      sig { returns(XTwitterScraper::EventDetail::MonitorType::TaggedSymbol) }
      attr_accessor :monitor_type

      sig { returns(Time) }
      attr_accessor :occurred_at

      # Type of monitor event fired when account activity occurs.
      sig { returns(XTwitterScraper::EventType::TaggedSymbol) }
      attr_accessor :type

      # Keyword monitor ID included on detailed keyword events.
      sig { returns(T.nilable(String)) }
      attr_reader :keyword_monitor_id

      sig { params(keyword_monitor_id: String).void }
      attr_writer :keyword_monitor_id

      # Keyword query for this detailed monitor event.
      sig { returns(T.nilable(String)) }
      attr_reader :query

      sig { params(query: String).void }
      attr_writer :query

      # Account username for this detailed monitor event.
      sig { returns(T.nilable(String)) }
      attr_reader :username

      sig { params(username: String).void }
      attr_writer :username

      sig { returns(T.nilable(String)) }
      attr_reader :x_event_id

      sig { params(x_event_id: String).void }
      attr_writer :x_event_id

      # Full monitor event including payload data and optional X event ID.
      sig do
        params(
          id: String,
          data: T::Hash[Symbol, T.anything],
          monitor_id: String,
          monitor_type: XTwitterScraper::EventDetail::MonitorType::OrSymbol,
          occurred_at: Time,
          type: XTwitterScraper::EventType::OrSymbol,
          keyword_monitor_id: String,
          query: String,
          username: String,
          x_event_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Event payload - shape varies by event type (JSON)
        data:,
        # Monitor ID associated with this detailed event payload.
        monitor_id:,
        # Source monitor type for this detailed event.
        monitor_type:,
        occurred_at:,
        # Type of monitor event fired when account activity occurs.
        type:,
        # Keyword monitor ID included on detailed keyword events.
        keyword_monitor_id: nil,
        # Keyword query for this detailed monitor event.
        query: nil,
        # Account username for this detailed monitor event.
        username: nil,
        x_event_id: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            data: T::Hash[Symbol, T.anything],
            monitor_id: String,
            monitor_type:
              XTwitterScraper::EventDetail::MonitorType::TaggedSymbol,
            occurred_at: Time,
            type: XTwitterScraper::EventType::TaggedSymbol,
            keyword_monitor_id: String,
            query: String,
            username: String,
            x_event_id: String
          }
        )
      end
      def to_hash
      end

      # Source monitor type for this detailed event.
      module MonitorType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::EventDetail::MonitorType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT =
          T.let(
            :account,
            XTwitterScraper::EventDetail::MonitorType::TaggedSymbol
          )
        KEYWORD =
          T.let(
            :keyword,
            XTwitterScraper::EventDetail::MonitorType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::EventDetail::MonitorType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
