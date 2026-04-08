# frozen_string_literal: true

module XTwitterScraper
  module Models
    class Webhook < XTwitterScraper::Internal::Type::BaseModel
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
      #   @return [Array<Symbol, XTwitterScraper::Models::Webhook::EventType>]
      required :event_types,
               -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Webhook::EventType] },
               api_name: :eventTypes

      # @!attribute is_active
      #
      #   @return [Boolean]
      required :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!method initialize(id:, created_at:, event_types:, is_active:, url:)
      #   Webhook endpoint registered to receive event deliveries.
      #
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::Webhook::EventType>] Array of event types to subscribe to.
      #
      #   @param is_active [Boolean]
      #
      #   @param url [String]

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
