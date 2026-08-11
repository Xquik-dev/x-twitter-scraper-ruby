# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Events#list
    class EventListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Previous nextCursor.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute event_type
      #   Filter events by type
      #
      #   @return [Symbol, XTwitterScraper::Models::EventType, nil]
      optional :event_type, enum: -> { XTwitterScraper::EventType }

      # @!attribute keyword_monitor_id
      #   Keyword monitor ID.
      #
      #   @return [String, nil]
      optional :keyword_monitor_id, String

      # @!attribute limit
      #   Maximum number of items to return (1-100, default 50). For paid per-result
      #   endpoints, the returned count may be lower when remaining credits cannot cover
      #   the requested page. If zero paid results are affordable, the endpoint returns
      #   402 insufficient_credits.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute monitor_id
      #   Account monitor ID.
      #
      #   @return [String, nil]
      optional :monitor_id, String

      # @!method initialize(cursor: nil, event_type: nil, keyword_monitor_id: nil, limit: nil, monitor_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::EventListParams} for more details.
      #
      #   @param cursor [String] Previous nextCursor.
      #
      #   @param event_type [Symbol, XTwitterScraper::Models::EventType] Filter events by type
      #
      #   @param keyword_monitor_id [String] Keyword monitor ID.
      #
      #   @param limit [Integer] Maximum number of items to return (1-100, default 50). For paid per-result endpo
      #
      #   @param monitor_id [String] Account monitor ID.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
