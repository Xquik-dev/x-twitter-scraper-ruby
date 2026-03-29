# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Integrations#list
    class IntegrationListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute integrations
      #
      #   @return [Array<XTwitterScraper::Models::IntegrationListResponse::Integration>]
      required :integrations,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::IntegrationListResponse::Integration] }

      # @!method initialize(integrations:)
      #   @param integrations [Array<XTwitterScraper::Models::IntegrationListResponse::Integration>]

      class Integration < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute config
        #
        #   @return [Hash{Symbol=>Object}]
        required :config, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute event_types
        #
        #   @return [Array<Symbol, XTwitterScraper::Models::IntegrationListResponse::Integration::EventType>]
        required :event_types,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::IntegrationListResponse::Integration::EventType] },
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
        #   @return [Symbol, XTwitterScraper::Models::IntegrationListResponse::Integration::Type]
        required :type, enum: -> { XTwitterScraper::Models::IntegrationListResponse::Integration::Type }

        # @!attribute filters
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

        # @!method initialize(id:, config:, created_at:, event_types:, is_active:, name:, type:, filters: nil, message_template: nil, scope_all_monitors: nil, silent_push: nil)
        #   @param id [String]
        #   @param config [Hash{Symbol=>Object}]
        #   @param created_at [Time]
        #   @param event_types [Array<Symbol, XTwitterScraper::Models::IntegrationListResponse::Integration::EventType>]
        #   @param is_active [Boolean]
        #   @param name [String]
        #   @param type [Symbol, XTwitterScraper::Models::IntegrationListResponse::Integration::Type]
        #   @param filters [Hash{Symbol=>Object}]
        #   @param message_template [String]
        #   @param scope_all_monitors [Boolean]
        #   @param silent_push [Boolean]

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

        # @see XTwitterScraper::Models::IntegrationListResponse::Integration#type
        module Type
          extend XTwitterScraper::Internal::Type::Enum

          TELEGRAM = :telegram

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
