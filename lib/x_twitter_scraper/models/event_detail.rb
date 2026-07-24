# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Events#retrieve
    class EventDetail < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute data
      #   Event payload - shape varies by event type (JSON)
      #
      #   @return [Hash{Symbol=>Object}]
      required :data, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

      # @!attribute monitor_id
      #   Monitor ID associated with this detailed event payload.
      #
      #   @return [String]
      required :monitor_id, String, api_name: :monitorId

      # @!attribute monitor_type
      #   Source monitor type for this detailed event.
      #
      #   @return [Symbol, XTwitterScraper::Models::EventDetail::MonitorType]
      required :monitor_type, enum: -> { XTwitterScraper::EventDetail::MonitorType }, api_name: :monitorType

      # @!attribute occurred_at
      #
      #   @return [Time]
      required :occurred_at, Time, api_name: :occurredAt

      # @!attribute type
      #   Type of monitor event fired when account activity occurs.
      #
      #   @return [Symbol, XTwitterScraper::Models::EventType]
      required :type, enum: -> { XTwitterScraper::EventType }

      # @!attribute keyword_monitor_id
      #   Keyword monitor ID included on detailed keyword events.
      #
      #   @return [String, nil]
      optional :keyword_monitor_id, String, api_name: :keywordMonitorId

      # @!attribute query
      #   Keyword query for this detailed monitor event.
      #
      #   @return [String, nil]
      optional :query, String

      # @!attribute username
      #   Account username for this detailed monitor event.
      #
      #   @return [String, nil]
      optional :username, String

      # @!attribute x_event_id
      #
      #   @return [String, nil]
      optional :x_event_id, String, api_name: :xEventId

      # @!method initialize(id:, data:, monitor_id:, monitor_type:, occurred_at:, type:, keyword_monitor_id: nil, query: nil, username: nil, x_event_id: nil)
      #   Full monitor event including payload data and optional X event ID.
      #
      #   @param id [String]
      #
      #   @param data [Hash{Symbol=>Object}] Event payload - shape varies by event type (JSON)
      #
      #   @param monitor_id [String] Monitor ID associated with this detailed event payload.
      #
      #   @param monitor_type [Symbol, XTwitterScraper::Models::EventDetail::MonitorType] Source monitor type for this detailed event.
      #
      #   @param occurred_at [Time]
      #
      #   @param type [Symbol, XTwitterScraper::Models::EventType] Type of monitor event fired when account activity occurs.
      #
      #   @param keyword_monitor_id [String] Keyword monitor ID included on detailed keyword events.
      #
      #   @param query [String] Keyword query for this detailed monitor event.
      #
      #   @param username [String] Account username for this detailed monitor event.
      #
      #   @param x_event_id [String]

      # Source monitor type for this detailed event.
      #
      # @see XTwitterScraper::Models::EventDetail#monitor_type
      module MonitorType
        extend XTwitterScraper::Internal::Type::Enum

        ACCOUNT = :account
        KEYWORD = :keyword

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
