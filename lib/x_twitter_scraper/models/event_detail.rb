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
      #
      #   @return [String]
      required :monitor_id, String, api_name: :monitorId

      # @!attribute occurred_at
      #
      #   @return [Time]
      required :occurred_at, Time, api_name: :occurredAt

      # @!attribute type
      #   Type of monitor event fired when account activity occurs.
      #
      #   @return [Symbol, XTwitterScraper::Models::EventType]
      required :type, enum: -> { XTwitterScraper::EventType }

      # @!attribute username
      #
      #   @return [String]
      required :username, String

      # @!attribute x_event_id
      #
      #   @return [String, nil]
      optional :x_event_id, String, api_name: :xEventId

      # @!method initialize(id:, data:, monitor_id:, occurred_at:, type:, username:, x_event_id: nil)
      #   Full monitor event including payload data and optional X event ID.
      #
      #   @param id [String]
      #
      #   @param data [Hash{Symbol=>Object}] Event payload - shape varies by event type (JSON)
      #
      #   @param monitor_id [String]
      #
      #   @param occurred_at [Time]
      #
      #   @param type [Symbol, XTwitterScraper::Models::EventType] Type of monitor event fired when account activity occurs.
      #
      #   @param username [String]
      #
      #   @param x_event_id [String]
    end
  end
end
