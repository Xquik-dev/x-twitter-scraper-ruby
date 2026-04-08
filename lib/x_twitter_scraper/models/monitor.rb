# frozen_string_literal: true

module XTwitterScraper
  module Models
    class Monitor < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute event_types
      #   Array of event types to subscribe to.
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::Monitor::EventType>]
      required :event_types,
               -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Monitor::EventType] },
               api_name: :eventTypes

      # @!attribute is_active
      #
      #   @return [Boolean]
      required :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

      # @!attribute username
      #
      #   @return [String]
      required :username, String

      # @!attribute x_user_id
      #
      #   @return [String]
      required :x_user_id, String, api_name: :xUserId

      # @!method initialize(id:, created_at:, event_types:, is_active:, username:, x_user_id:)
      #   Account monitor that tracks activity for a given X user.
      #
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::Monitor::EventType>] Array of event types to subscribe to.
      #
      #   @param is_active [Boolean]
      #
      #   @param username [String]
      #
      #   @param x_user_id [String]

      # Type of monitor event fired when account activity occurs.
      module EventType
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
