# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Monitors#create
    class MonitorCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute event_types
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::MonitorCreateParams::EventType>]
      required :event_types,
               -> {
                 XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::MonitorCreateParams::EventType]
               },
               api_name: :eventTypes

      # @!attribute username
      #   X username (without @)
      #
      #   @return [String]
      required :username, String

      # @!method initialize(event_types:, username:, request_options: {})
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::MonitorCreateParams::EventType>]
      #
      #   @param username [String] X username (without @)
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
