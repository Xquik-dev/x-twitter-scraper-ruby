# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Compose#create
    class ComposeCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [XTwitterScraper::Models::ComposeCreateParams::Body::ComposePrepareRequest, XTwitterScraper::Models::ComposeCreateParams::Body::ComposeRefineRequest, XTwitterScraper::Models::ComposeCreateParams::Body::ComposeScoreRequest]
      required :body, union: -> { XTwitterScraper::ComposeCreateParams::Body }

      # @!method initialize(body:, request_options: {})
      #   @param body [XTwitterScraper::Models::ComposeCreateParams::Body::ComposePrepareRequest, XTwitterScraper::Models::ComposeCreateParams::Body::ComposeRefineRequest, XTwitterScraper::Models::ComposeCreateParams::Body::ComposeScoreRequest]
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      module Body
        extend XTwitterScraper::Internal::Type::Union

        variant -> { XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest }

        variant -> { XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest }

        variant -> { XTwitterScraper::ComposeCreateParams::Body::ComposeScoreRequest }

        class ComposePrepareRequest < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute step
          #
          #   @return [Symbol, :compose]
          required :step, const: :compose

          # @!attribute topic
          #   Subject for the post.
          #
          #   @return [String]
          required :topic, String

          # @!attribute goal
          #   Editorial goal used to order the rules and questions.
          #
          #   @return [Symbol, XTwitterScraper::Models::ComposeCreateParams::Body::ComposePrepareRequest::Goal, nil]
          optional :goal, enum: -> { XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::Goal }

          # @!attribute style_username
          #   Username from a style analysis saved to this account.
          #
          #   @return [String, nil]
          optional :style_username, String, api_name: :styleUsername

          # @!method initialize(topic:, goal: nil, style_username: nil, step: :compose)
          #   @param topic [String] Subject for the post.
          #
          #   @param goal [Symbol, XTwitterScraper::Models::ComposeCreateParams::Body::ComposePrepareRequest::Goal] Editorial goal used to order the rules and questions.
          #
          #   @param style_username [String] Username from a style analysis saved to this account.
          #
          #   @param step [Symbol, :compose]

          # Editorial goal used to order the rules and questions.
          #
          # @see XTwitterScraper::Models::ComposeCreateParams::Body::ComposePrepareRequest#goal
          module Goal
            extend XTwitterScraper::Internal::Type::Enum

            ENGAGEMENT = :engagement
            FOLLOWERS = :followers
            AUTHORITY = :authority
            CONVERSATION = :conversation

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class ComposeRefineRequest < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute goal
          #   Editorial goal for the guidance.
          #
          #   @return [Symbol, XTwitterScraper::Models::ComposeCreateParams::Body::ComposeRefineRequest::Goal]
          required :goal, enum: -> { XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::Goal }

          # @!attribute step
          #
          #   @return [Symbol, :refine]
          required :step, const: :refine

          # @!attribute tone
          #   Requested writing tone.
          #
          #   @return [String]
          required :tone, String

          # @!attribute topic
          #   Subject for the post.
          #
          #   @return [String]
          required :topic, String

          # @!attribute additional_context
          #   Audience, constraints, sources, or other writing context.
          #
          #   @return [String, nil]
          optional :additional_context, String, api_name: :additionalContext

          # @!attribute call_to_action
          #   Specific action the draft should request.
          #
          #   @return [String, nil]
          optional :call_to_action, String, api_name: :callToAction

          # @!attribute media_type
          #   Planned media type.
          #
          #   @return [Symbol, XTwitterScraper::Models::ComposeCreateParams::Body::ComposeRefineRequest::MediaType, nil]
          optional :media_type,
                   enum: -> { XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::MediaType },
                   api_name: :mediaType

          # @!method initialize(goal:, tone:, topic:, additional_context: nil, call_to_action: nil, media_type: nil, step: :refine)
          #   @param goal [Symbol, XTwitterScraper::Models::ComposeCreateParams::Body::ComposeRefineRequest::Goal] Editorial goal for the guidance.
          #
          #   @param tone [String] Requested writing tone.
          #
          #   @param topic [String] Subject for the post.
          #
          #   @param additional_context [String] Audience, constraints, sources, or other writing context.
          #
          #   @param call_to_action [String] Specific action the draft should request.
          #
          #   @param media_type [Symbol, XTwitterScraper::Models::ComposeCreateParams::Body::ComposeRefineRequest::MediaType] Planned media type.
          #
          #   @param step [Symbol, :refine]

          # Editorial goal for the guidance.
          #
          # @see XTwitterScraper::Models::ComposeCreateParams::Body::ComposeRefineRequest#goal
          module Goal
            extend XTwitterScraper::Internal::Type::Enum

            ENGAGEMENT = :engagement
            FOLLOWERS = :followers
            AUTHORITY = :authority
            CONVERSATION = :conversation

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Planned media type.
          #
          # @see XTwitterScraper::Models::ComposeCreateParams::Body::ComposeRefineRequest#media_type
          module MediaType
            extend XTwitterScraper::Internal::Type::Enum

            PHOTO = :photo
            VIDEO = :video
            NONE = :none

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class ComposeScoreRequest < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute draft
          #   Full post text for deterministic editorial checks.
          #
          #   @return [String]
          required :draft, String

          # @!attribute step
          #
          #   @return [Symbol, :score]
          required :step, const: :score

          # @!attribute has_link
          #   True when a separate link card is attached.
          #
          #   @return [Boolean, nil]
          optional :has_link, XTwitterScraper::Internal::Type::Boolean, api_name: :hasLink

          # @!attribute has_media
          #   @deprecated Ignored. Remove this field. Use hasLink for a separate link card.
          #
          #   Accepted for backward compatibility. Text checks ignore this field.
          #
          #   @return [Boolean, nil]
          optional :has_media, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMedia

          # @!method initialize(draft:, has_link: nil, has_media: nil, step: :score)
          #   Some parameter documentations has been truncated, see
          #   {XTwitterScraper::Models::ComposeCreateParams::Body::ComposeScoreRequest} for
          #   more details.
          #
          #   @param draft [String] Full post text for deterministic editorial checks.
          #
          #   @param has_link [Boolean] True when a separate link card is attached.
          #
          #   @param has_media [Boolean] Accepted for backward compatibility. Text checks ignore this field.
          #
          #   @param step [Symbol, :score]
        end

        # @!method self.variants
        #   @return [Array(XTwitterScraper::Models::ComposeCreateParams::Body::ComposePrepareRequest, XTwitterScraper::Models::ComposeCreateParams::Body::ComposeRefineRequest, XTwitterScraper::Models::ComposeCreateParams::Body::ComposeScoreRequest)]
      end
    end
  end
end
