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

      # @!method initialize(id:, data:, monitor_id:, occurred_at:, type:, username:)
      #   Monitor event summary with type, username, and occurrence time.
      #
      #   @param id [String]
      #
      #   @param data [Hash{Symbol=>Object}]
      #
      #   @param monitor_id [String]
      #
      #   @param occurred_at [Time]
      #
      #   @param type [Symbol, XTwitterScraper::Models::EventType] Type of monitor event fired when account activity occurs.
      #
      #   @param username [String]
    end
  end
end
