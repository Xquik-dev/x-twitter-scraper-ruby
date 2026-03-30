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
      #   @return [Symbol, XTwitterScraper::Models::EventType, nil]
      optional :event_type, enum: -> { XTwitterScraper::EventType }

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
      #   @param event_type [Symbol, XTwitterScraper::Models::EventType]
      #
      #   @param limit [Integer]
      #
      #   @param monitor_id [String]
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
