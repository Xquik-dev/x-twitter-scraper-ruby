# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Monitors
      # @see XTwitterScraper::Resources::Monitors::Keywords#create
      class KeywordCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute event_types
        #   Array of event types to subscribe to.
        #
        #   @return [Array<Symbol, XTwitterScraper::Models::EventType>]
        required :event_types,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType] },
                 api_name: :eventTypes

        # @!attribute query
        #   X search query to monitor. Whitespace is normalized.
        #
        #   @return [String]
        required :query, String

        # @!method initialize(event_types:, query:, request_options: {})
        #   @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
        #
        #   @param query [String] X search query to monitor. Whitespace is normalized.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
