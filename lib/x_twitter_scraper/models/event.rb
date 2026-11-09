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
      #   Type of event an account, keyword or post monitor fires, as events and webhooks name it.
      #
      #   @return [Symbol, XTwitterScraper::Models::StreamEventType]
      required :type, enum: -> { XTwitterScraper::StreamEventType }

      # @!attribute author_id
      #   Permanent X user ID of the monitored post's author, present for post events.
      #
      #   @return [String, nil]
      optional :author_id, String, api_name: :authorId

      # @!attribute author_username
      #   Username of the monitored post's author, present for post events.
      #
      #   @return [String, nil]
      optional :author_username, String, api_name: :authorUsername

      # @!attribute keyword_monitor_id
      #   Keyword monitor ID, present for keyword monitor events.
      #
      #   @return [String, nil]
      optional :keyword_monitor_id, String, api_name: :keywordMonitorId

      # @!attribute monitor_name
      #   Your monitor label when Xquik created the event, present when set. A rename
      #   leaves the event's label unchanged.
      #
      #   @return [String, nil]
      optional :monitor_name, String, api_name: :monitorName

      # @!attribute post_id
      #   ID of the monitored post, present for post events.
      #
      #   @return [String, nil]
      optional :post_id, String, api_name: :postId

      # @!attribute post_url
      #   Link to the monitored post, present for post events.
      #
      #   @return [String, nil]
      optional :post_url, String, api_name: :postUrl

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

      # @!attribute x_user_id
      #   Permanent X user ID of the monitored account, present for account monitor
      #   events. It stays the same after a username change.
      #
      #   @return [String, nil]
      optional :x_user_id, String, api_name: :xUserId

      # @!method initialize(id:, data:, monitor_id:, monitor_type:, occurred_at:, type:, author_id: nil, author_username: nil, keyword_monitor_id: nil, monitor_name: nil, post_id: nil, post_url: nil, query: nil, username: nil, x_user_id: nil)
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
      #   @param type [Symbol, XTwitterScraper::Models::StreamEventType] Type of event an account, keyword or post monitor fires, as events and webhooks name it.
      #
      #   @param author_id [String] Permanent X user ID of the monitored post's author, present for post events.
      #
      #   @param author_username [String] Username of the monitored post's author, present for post events.
      #
      #   @param keyword_monitor_id [String] Keyword monitor ID, present for keyword monitor events.
      #
      #   @param monitor_name [String] Your monitor label when Xquik created the event, present when set. A rename leav
      #
      #   @param post_id [String] ID of the monitored post, present for post events.
      #
      #   @param post_url [String] Link to the monitored post, present for post events.
      #
      #   @param query [String] Keyword query, present for keyword monitor events.
      #
      #   @param username [String] Account username, present for account monitor events.
      #
      #   @param x_user_id [String] Permanent X user ID of the monitored account, present for account monitor events

      # Source monitor type.
      #
      # @see XTwitterScraper::Models::Event#monitor_type
      module MonitorType
        extend XTwitterScraper::Internal::Type::Enum

        ACCOUNT = :account
        KEYWORD = :keyword
        POST = :post

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
