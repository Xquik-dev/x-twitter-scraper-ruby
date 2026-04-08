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
      #   Array of event types to subscribe to.
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::EventType>]
      required :event_types,
               -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType] },
               api_name: :eventTypes

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute type
      #
      #   @return [Symbol, :telegram]
      required :type, const: :telegram

      # @!method initialize(config:, event_types:, name:, type: :telegram, request_options: {})
      #   @param config [XTwitterScraper::Models::IntegrationCreateParams::Config] Integration config (e.g. Telegram chatId)
      #
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
      #
      #   @param name [String]
      #
      #   @param type [Symbol, :telegram]
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
    end
  end
end
