# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#create
    class WebhookCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute event_types
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::WebhookCreateParams::EventType>]
      required :event_types,
               -> {
                 XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::WebhookCreateParams::EventType]
               },
               api_name: :eventTypes

      # @!attribute url
      #   HTTPS URL
      #
      #   @return [String]
      required :url, String

      # @!method initialize(event_types:, url:, request_options: {})
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::WebhookCreateParams::EventType>]
      #
      #   @param url [String] HTTPS URL
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

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
