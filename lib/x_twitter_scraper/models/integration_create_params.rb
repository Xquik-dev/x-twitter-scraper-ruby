# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Integrations#create
    class IntegrationCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute config
      #   Integration config (e.g. Telegram chatId)
      #
      #   @return [XTwitterScraper::Models::IntegrationCreateParams::Config]
      required :config, -> { XTwitterScraper::IntegrationCreateParams::Config }

      # @!attribute event_types
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::IntegrationCreateParams::EventType>]
      required :event_types,
               -> {
                 XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::IntegrationCreateParams::EventType]
               },
               api_name: :eventTypes

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute type
      #
      #   @return [Symbol, XTwitterScraper::Models::IntegrationCreateParams::Type]
      required :type, enum: -> { XTwitterScraper::IntegrationCreateParams::Type }

      # @!method initialize(config:, event_types:, name:, type:, request_options: {})
      #   @param config [XTwitterScraper::Models::IntegrationCreateParams::Config] Integration config (e.g. Telegram chatId)
      #
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::IntegrationCreateParams::EventType>]
      #
      #   @param name [String]
      #
      #   @param type [Symbol, XTwitterScraper::Models::IntegrationCreateParams::Type]
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      class Config < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute chat_id
        #
        #   @return [String]
        required :chat_id, String, api_name: :chatId

        # @!method initialize(chat_id:)
        #   Integration config (e.g. Telegram chatId)
        #
        #   @param chat_id [String]
      end

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

      module Type
        extend XTwitterScraper::Internal::Type::Enum

        TELEGRAM = :telegram

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
