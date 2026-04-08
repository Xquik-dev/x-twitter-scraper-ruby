# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Events#list
    class EventListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute events
      #
      #   @return [Array<XTwitterScraper::Models::EventListResponse::Event>]
      required :events,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::EventListResponse::Event] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(events:, has_more:, next_cursor: nil)
      #   @param events [Array<XTwitterScraper::Models::EventListResponse::Event>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String]

      class Event < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute data
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
        #   @return [Symbol, XTwitterScraper::Models::EventListResponse::Event::Type]
        required :type, enum: -> { XTwitterScraper::Models::EventListResponse::Event::Type }

        # @!attribute username
        #
        #   @return [String]
        required :username, String

        # @!method initialize(id:, data:, monitor_id:, occurred_at:, type:, username:)
        #   Monitor event summary with type, username, and occurrence time.
        #
        #   @param id [String]
        #
        #   @param data [Hash{Symbol=>Object}]
        #
        #   @param monitor_id [String]
        #
        #   @param occurred_at [Time]
        #
        #   @param type [Symbol, XTwitterScraper::Models::EventListResponse::Event::Type] Type of monitor event fired when account activity occurs.
        #
        #   @param username [String]

        # Type of monitor event fired when account activity occurs.
        #
        # @see XTwitterScraper::Models::EventListResponse::Event#type
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
end
