# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class Event < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::Event, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :data

      # Account monitor ID for account events, or keyword monitor ID for keyword events.
      sig { returns(String) }
      attr_accessor :monitor_id

      # Source monitor type.
      sig { returns(XTwitterScraper::Event::MonitorType::TaggedSymbol) }
      attr_accessor :monitor_type

      sig { returns(Time) }
      attr_accessor :occurred_at

      # Type of monitor event fired when account activity occurs.
      sig { returns(XTwitterScraper::EventType::TaggedSymbol) }
      attr_accessor :type

      # Keyword monitor ID, present for keyword monitor events.
      sig { returns(T.nilable(String)) }
      attr_reader :keyword_monitor_id

      sig { params(keyword_monitor_id: String).void }
      attr_writer :keyword_monitor_id

      # Keyword query, present for keyword monitor events.
      sig { returns(T.nilable(String)) }
      attr_reader :query

      sig { params(query: String).void }
      attr_writer :query

      # Account username, present for account monitor events.
      sig { returns(T.nilable(String)) }
      attr_reader :username

      sig { params(username: String).void }
      attr_writer :username

      # Monitor event summary with source metadata and occurrence time.
      sig do
        params(
          id: String,
          data: T::Hash[Symbol, T.anything],
          monitor_id: String,
          monitor_type: XTwitterScraper::Event::MonitorType::OrSymbol,
          occurred_at: Time,
          type: XTwitterScraper::EventType::OrSymbol,
          keyword_monitor_id: String,
          query: String,
          username: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        data:,
        # Account monitor ID for account events, or keyword monitor ID for keyword events.
        monitor_id:,
        # Source monitor type.
        monitor_type:,
        occurred_at:,
        # Type of monitor event fired when account activity occurs.
        type:,
        # Keyword monitor ID, present for keyword monitor events.
        keyword_monitor_id: nil,
        # Keyword query, present for keyword monitor events.
        query: nil,
        # Account username, present for account monitor events.
        username: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            data: T::Hash[Symbol, T.anything],
            monitor_id: String,
            monitor_type: XTwitterScraper::Event::MonitorType::TaggedSymbol,
            occurred_at: Time,
            type: XTwitterScraper::EventType::TaggedSymbol,
            keyword_monitor_id: String,
            query: String,
            username: String
          }
        )
      end
      def to_hash
      end

      # Source monitor type.
      module MonitorType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::Event::MonitorType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT =
          T.let(:account, XTwitterScraper::Event::MonitorType::TaggedSymbol)
        KEYWORD =
          T.let(:keyword, XTwitterScraper::Event::MonitorType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[XTwitterScraper::Event::MonitorType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
