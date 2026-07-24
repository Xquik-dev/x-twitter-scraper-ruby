# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class Event < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}]
      required :data, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

      # @!attribute monitor_id
      #   Account monitor ID for account events, or keyword monitor ID for keyword events.
      #
      #   @return [String]
      required :monitor_id, String, api_name: :monitorId

      # @!attribute monitor_type
      #   Source monitor type.
      #
      #   @return [Symbol, XTwitterScraper::Models::Event::MonitorType]
      required :monitor_type, enum: -> { XTwitterScraper::Event::MonitorType }, api_name: :monitorType

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
      #   Keyword monitor ID, present for keyword monitor events.
      #
      #   @return [String, nil]
      optional :keyword_monitor_id, String, api_name: :keywordMonitorId

      # @!attribute query
      #   Keyword query, present for keyword monitor events.
      #
      #   @return [String, nil]
      optional :query, String

      # @!attribute username
      #   Account username, present for account monitor events.
      #
      #   @return [String, nil]
      optional :username, String

      # @!method initialize(id:, data:, monitor_id:, monitor_type:, occurred_at:, type:, keyword_monitor_id: nil, query: nil, username: nil)
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::Event} for more details.
      #
      #   Monitor event summary with source metadata and occurrence time.
      #
      #   @param id [String]
      #
      #   @param data [Hash{Symbol=>Object}]
      #
      #   @param monitor_id [String] Account monitor ID for account events, or keyword monitor ID for keyword events.
      #
      #   @param monitor_type [Symbol, XTwitterScraper::Models::Event::MonitorType] Source monitor type.
      #
      #   @param occurred_at [Time]
      #
      #   @param type [Symbol, XTwitterScraper::Models::EventType] Type of monitor event fired when account activity occurs.
      #
      #   @param keyword_monitor_id [String] Keyword monitor ID, present for keyword monitor events.
      #
      #   @param query [String] Keyword query, present for keyword monitor events.
      #
      #   @param username [String] Account username, present for account monitor events.

      # Source monitor type.
      #
      # @see XTwitterScraper::Models::Event#monitor_type
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
