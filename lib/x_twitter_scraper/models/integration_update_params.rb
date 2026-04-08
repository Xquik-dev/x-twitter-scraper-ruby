# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Integrations#update
    class IntegrationUpdateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute event_types
      #   Array of event types to subscribe to.
      #
      #   @return [Array<Symbol, XTwitterScraper::Models::IntegrationUpdateParams::EventType>, nil]
      optional :event_types,
               -> {
                 XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::IntegrationUpdateParams::EventType]
               },
               api_name: :eventTypes

      # @!attribute filters
      #   Event filter rules (JSON)
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :filters, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

      # @!attribute is_active
      #
      #   @return [Boolean, nil]
      optional :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

      # @!attribute message_template
      #   Custom message template (JSON)
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :message_template,
               XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
               api_name: :messageTemplate

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute scope_all_monitors
      #
      #   @return [Boolean, nil]
      optional :scope_all_monitors, XTwitterScraper::Internal::Type::Boolean, api_name: :scopeAllMonitors

      # @!attribute silent_push
      #
      #   @return [Boolean, nil]
      optional :silent_push, XTwitterScraper::Internal::Type::Boolean, api_name: :silentPush

      # @!method initialize(id:, event_types: nil, filters: nil, is_active: nil, message_template: nil, name: nil, scope_all_monitors: nil, silent_push: nil, request_options: {})
      #   @param id [String]
      #
      #   @param event_types [Array<Symbol, XTwitterScraper::Models::IntegrationUpdateParams::EventType>] Array of event types to subscribe to.
      #
      #   @param filters [Hash{Symbol=>Object}] Event filter rules (JSON)
      #
      #   @param is_active [Boolean]
      #
      #   @param message_template [Hash{Symbol=>Object}] Custom message template (JSON)
      #
      #   @param name [String]
      #
      #   @param scope_all_monitors [Boolean]
      #
      #   @param silent_push [Boolean]
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Type of monitor event fired when account activity occurs.
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
