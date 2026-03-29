# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Compose#create
    class ComposeCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute step
      #   Workflow step
      #
      #   @return [Symbol, XTwitterScraper::Models::ComposeCreateParams::Step]
      required :step, enum: -> { XTwitterScraper::ComposeCreateParams::Step }

      # @!attribute additional_context
      #   Extra context or URLs (refine)
      #
      #   @return [String, nil]
      optional :additional_context, String, api_name: :additionalContext

      # @!attribute call_to_action
      #   Desired call to action (refine)
      #
      #   @return [String, nil]
      optional :call_to_action, String, api_name: :callToAction

      # @!attribute draft
      #   Tweet draft text to evaluate (score)
      #
      #   @return [String, nil]
      optional :draft, String

      # @!attribute goal
      #   Optimization goal
      #
      #   @return [Symbol, XTwitterScraper::Models::ComposeCreateParams::Goal, nil]
      optional :goal, enum: -> { XTwitterScraper::ComposeCreateParams::Goal }

      # @!attribute has_link
      #   Whether a link is attached (score)
      #
      #   @return [Boolean, nil]
      optional :has_link, XTwitterScraper::Internal::Type::Boolean, api_name: :hasLink

      # @!attribute has_media
      #   Whether media is attached (score)
      #
      #   @return [Boolean, nil]
      optional :has_media, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMedia

      # @!attribute media_type
      #   Media type (refine)
      #
      #   @return [Symbol, XTwitterScraper::Models::ComposeCreateParams::MediaType, nil]
      optional :media_type, enum: -> { XTwitterScraper::ComposeCreateParams::MediaType }, api_name: :mediaType

      # @!attribute style_username
      #   Cached style username for voice matching (compose)
      #
      #   @return [String, nil]
      optional :style_username, String, api_name: :styleUsername

      # @!attribute tone
      #   Desired tone (refine)
      #
      #   @return [String, nil]
      optional :tone, String

      # @!attribute topic
      #   Tweet topic (compose, refine)
      #
      #   @return [String, nil]
      optional :topic, String

      # @!method initialize(step:, additional_context: nil, call_to_action: nil, draft: nil, goal: nil, has_link: nil, has_media: nil, media_type: nil, style_username: nil, tone: nil, topic: nil, request_options: {})
      #   @param step [Symbol, XTwitterScraper::Models::ComposeCreateParams::Step] Workflow step
      #
      #   @param additional_context [String] Extra context or URLs (refine)
      #
      #   @param call_to_action [String] Desired call to action (refine)
      #
      #   @param draft [String] Tweet draft text to evaluate (score)
      #
      #   @param goal [Symbol, XTwitterScraper::Models::ComposeCreateParams::Goal] Optimization goal
      #
      #   @param has_link [Boolean] Whether a link is attached (score)
      #
      #   @param has_media [Boolean] Whether media is attached (score)
      #
      #   @param media_type [Symbol, XTwitterScraper::Models::ComposeCreateParams::MediaType] Media type (refine)
      #
      #   @param style_username [String] Cached style username for voice matching (compose)
      #
      #   @param tone [String] Desired tone (refine)
      #
      #   @param topic [String] Tweet topic (compose, refine)
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Workflow step
      module Step
        extend XTwitterScraper::Internal::Type::Enum

        COMPOSE = :compose
        REFINE = :refine
        SCORE = :score

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Optimization goal
      module Goal
        extend XTwitterScraper::Internal::Type::Enum

        ENGAGEMENT = :engagement
        FOLLOWERS = :followers
        AUTHORITY = :authority
        CONVERSATION = :conversation

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Media type (refine)
      module MediaType
        extend XTwitterScraper::Internal::Type::Enum

        PHOTO = :photo
        VIDEO = :video
        NONE = :none

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
