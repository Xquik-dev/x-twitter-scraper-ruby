# frozen_string_literal: true

module XTwitterScraper
  module Models
    class EventDetail < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute data
      #   Event payload — shape varies by event type (JSON)
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
      #
      #   @return [Symbol, XTwitterScraper::Models::EventDetail::Type]
      required :type, enum: -> { XTwitterScraper::EventDetail::Type }

      # @!attribute username
      #
      #   @return [String]
      required :username, String

      # @!attribute x_event_id
      #
      #   @return [String, nil]
      optional :x_event_id, String, api_name: :xEventId

      # @!method initialize(id:, data:, monitor_id:, occurred_at:, type:, username:, x_event_id: nil)
      #   @param id [String]
      #
      #   @param data [Hash{Symbol=>Object}] Event payload — shape varies by event type (JSON)
      #
      #   @param monitor_id [String]
      #
      #   @param occurred_at [Time]
      #
      #   @param type [Symbol, XTwitterScraper::Models::EventDetail::Type]
      #
      #   @param username [String]
      #
      #   @param x_event_id [String]

      # @see XTwitterScraper::Models::EventDetail#type
      module Type
        extend XTwitterScraper::Internal::Type::Enum

        TWEET_NEW = :"tweet.new"
        TWEET_REPLY = :"tweet.reply"
        TWEET_RETWEET = :"tweet.retweet"
        TWEET_QUOTE = :"tweet.quote"
        FOLLOWER_GAINED = :"follower.gained"
        FOLLOWER_LOST = :"follower.lost"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
