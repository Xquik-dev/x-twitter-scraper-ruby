# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Events#list
    class EventListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute after
      #   Cursor for pagination
      #
      #   @return [String, nil]
      optional :after, String

      # @!attribute event_type
      #
      #   @return [Symbol, XTwitterScraper::Models::EventListParams::EventType, nil]
      optional :event_type, enum: -> { XTwitterScraper::EventListParams::EventType }

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute monitor_id
      #
      #   @return [String, nil]
      optional :monitor_id, String

      # @!method initialize(after: nil, event_type: nil, limit: nil, monitor_id: nil, request_options: {})
      #   @param after [String] Cursor for pagination
      #
      #   @param event_type [Symbol, XTwitterScraper::Models::EventListParams::EventType]
      #
      #   @param limit [Integer]
      #
      #   @param monitor_id [String]
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
