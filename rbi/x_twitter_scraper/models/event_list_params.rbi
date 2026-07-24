# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class EventListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::EventListParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Cursor for keyset pagination from prior response next_cursor
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Filter events by type
      sig { returns(T.nilable(XTwitterScraper::EventType::OrSymbol)) }
      attr_reader :event_type

      sig { params(event_type: XTwitterScraper::EventType::OrSymbol).void }
      attr_writer :event_type

      # Maximum number of items to return (1-100, default 50). For paid per-result
      # endpoints, the returned count may be lower when remaining credits cannot cover
      # the requested page. If zero paid results are affordable, the endpoint returns
      # 402 insufficient_credits.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter events by monitor ID
      sig { returns(T.nilable(String)) }
      attr_reader :monitor_id

      sig { params(monitor_id: String).void }
      attr_writer :monitor_id

      sig do
        params(
          cursor: String,
          event_type: XTwitterScraper::EventType::OrSymbol,
          limit: Integer,
          monitor_id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor for keyset pagination from prior response next_cursor
        cursor: nil,
        # Filter events by type
        event_type: nil,
        # Maximum number of items to return (1-100, default 50). For paid per-result
        # endpoints, the returned count may be lower when remaining credits cannot cover
        # the requested page. If zero paid results are affordable, the endpoint returns
        # 402 insufficient_credits.
        limit: nil,
        # Filter events by monitor ID
        monitor_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            event_type: XTwitterScraper::EventType::OrSymbol,
            limit: Integer,
            monitor_id: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
