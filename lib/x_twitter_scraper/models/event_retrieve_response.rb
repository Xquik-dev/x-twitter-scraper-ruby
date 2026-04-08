# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Events#retrieve
    class EventRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
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
      #   Type of monitor event fired when account activity occurs.
      #
      #   @return [Symbol, XTwitterScraper::Models::EventRetrieveResponse::Type]
      required :type, enum: -> { XTwitterScraper::Models::EventRetrieveResponse::Type }

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
      #   @param data [Hash{Symbol=>Object}] Event payload — shape varies by event type (JSON)
      #
      #   @param monitor_id [String]
      #
      #   @param occurred_at [Time]
      #
      #   @param type [Symbol, XTwitterScraper::Models::EventRetrieveResponse::Type] Type of monitor event fired when account activity occurs.
      #
      #   @param username [String]
      #
      #   @param x_event_id [String]

      # Type of monitor event fired when account activity occurs.
      #
      # @see XTwitterScraper::Models::EventRetrieveResponse#type
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
