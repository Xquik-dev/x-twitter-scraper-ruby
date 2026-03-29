# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Monitors#update
    class MonitorUpdateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute event_types
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::MonitorUpdateParams::EventType>, nil]
      optional :event_types,
               -> {
                 XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::MonitorUpdateParams::EventType]
               },
               api_name: :eventTypes

      # @!attribute is_active
      #
      #   @return [Boolean, nil]
      optional :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

      # @!method initialize(id:, event_types: nil, is_active: nil, request_options: {})
      #   @param id [String]
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::MonitorUpdateParams::EventType>]
      #   @param is_active [Boolean]
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
