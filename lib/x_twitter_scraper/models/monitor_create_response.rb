# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Monitors#create
    class MonitorCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute event_types
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::MonitorCreateResponse::EventType>]
      required :event_types,
               -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::MonitorCreateResponse::EventType] },
               api_name: :eventTypes

      # @!attribute username
      #
      #   @return [String]
      required :username, String

      # @!attribute x_user_id
      #
      #   @return [String]
      required :x_user_id, String, api_name: :xUserId

      # @!method initialize(id:, created_at:, event_types:, username:, x_user_id:)
      #   @param id [String]
      #   @param created_at [Time]
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::MonitorCreateResponse::EventType>]
      #   @param username [String]
      #   @param x_user_id [String]

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
