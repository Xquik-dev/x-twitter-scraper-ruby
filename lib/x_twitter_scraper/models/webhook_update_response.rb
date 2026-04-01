# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#update
    class WebhookUpdateResponse < XTwitterScraper::Internal::Type::BaseModel
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
      #   @return [Array<Symbol, XTwitterScraper::Models::WebhookUpdateResponse::EventType>]
      required :event_types,
               -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::WebhookUpdateResponse::EventType] },
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
      #   @param id [String]
      #   @param created_at [Time]
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::WebhookUpdateResponse::EventType>]
      #   @param is_active [Boolean]
      #   @param url [String]

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
