# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#create
    class WebhookCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute event_types
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::EventType>]
      required :event_types,
               -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType] },
               api_name: :eventTypes

      # @!attribute url
      #   HTTPS URL
      #
      #   @return [String]
      required :url, String

      # @!method initialize(event_types:, url:, request_options: {})
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>]
      #
      #   @param url [String] HTTPS URL
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
