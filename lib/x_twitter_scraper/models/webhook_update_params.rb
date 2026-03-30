# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#update
    class WebhookUpdateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute event_types
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::EventType>, nil]
      optional :event_types,
               -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType] },
               api_name: :eventTypes

      # @!attribute is_active
      #
      #   @return [Boolean, nil]
      optional :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(id:, event_types: nil, is_active: nil, url: nil, request_options: {})
      #   @param id [String]
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>]
      #   @param is_active [Boolean]
      #   @param url [String]
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
