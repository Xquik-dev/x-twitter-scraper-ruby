# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Integrations#create
    class Integration < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute config
      #   Integration config — shape varies by type (JSON)
      #
      #   @return [Hash{Symbol=>Object}]
      required :config, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute event_types
      #   Array of event types to subscribe to.
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::EventType>]
      required :event_types,
               -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::EventType] },
               api_name: :eventTypes

      # @!attribute is_active
      #
      #   @return [Boolean]
      required :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute type
      #
      #   @return [Symbol, :telegram]
      required :type, const: :telegram

      # @!attribute filters
      #   Event filter rules (JSON)
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :filters, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

      # @!attribute message_template
      #
      #   @return [String, nil]
      optional :message_template, String, api_name: :messageTemplate

      # @!attribute scope_all_monitors
      #
      #   @return [Boolean, nil]
      optional :scope_all_monitors, XTwitterScraper::Internal::Type::Boolean, api_name: :scopeAllMonitors

      # @!attribute silent_push
      #
      #   @return [Boolean, nil]
      optional :silent_push, XTwitterScraper::Internal::Type::Boolean, api_name: :silentPush

      # @!method initialize(id:, config:, created_at:, event_types:, is_active:, name:, filters: nil, message_template: nil, scope_all_monitors: nil, silent_push: nil, type: :telegram)
      #   Third-party integration (e.g. Telegram) subscribed to monitor events.
      #
      #   @param id [String]
      #
      #   @param config [Hash{Symbol=>Object}] Integration config — shape varies by type (JSON)
      #
      #   @param created_at [Time]
      #
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::EventType>] Array of event types to subscribe to.
      #
      #   @param is_active [Boolean]
      #
      #   @param name [String]
      #
      #   @param filters [Hash{Symbol=>Object}] Event filter rules (JSON)
      #
      #   @param message_template [String]
      #
      #   @param scope_all_monitors [Boolean]
      #
      #   @param silent_push [Boolean]
      #
      #   @param type [Symbol, :telegram]
    end
  end
end
