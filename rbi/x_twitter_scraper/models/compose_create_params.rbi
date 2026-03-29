# typed: strong

module XTwitterScraper
  module Models
    class ComposeCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::ComposeCreateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Workflow step
      sig { returns(XTwitterScraper::ComposeCreateParams::Step::OrSymbol) }
      attr_accessor :step

      # Extra context or URLs (refine)
      sig { returns(T.nilable(String)) }
      attr_reader :additional_context

      sig { params(additional_context: String).void }
      attr_writer :additional_context

      # Desired call to action (refine)
      sig { returns(T.nilable(String)) }
      attr_reader :call_to_action

      sig { params(call_to_action: String).void }
      attr_writer :call_to_action

      # Tweet draft text to evaluate (score)
      sig { returns(T.nilable(String)) }
      attr_reader :draft

      sig { params(draft: String).void }
      attr_writer :draft

      # Optimization goal
      sig do
        returns(T.nilable(XTwitterScraper::ComposeCreateParams::Goal::OrSymbol))
      end
      attr_reader :goal

      sig do
        params(goal: XTwitterScraper::ComposeCreateParams::Goal::OrSymbol).void
      end
      attr_writer :goal

      # Whether a link is attached (score)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_link

      sig { params(has_link: T::Boolean).void }
      attr_writer :has_link

      # Whether media is attached (score)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_media

      sig { params(has_media: T::Boolean).void }
      attr_writer :has_media

      # Media type (refine)
      sig do
        returns(
          T.nilable(XTwitterScraper::ComposeCreateParams::MediaType::OrSymbol)
        )
      end
      attr_reader :media_type

      sig do
        params(
          media_type: XTwitterScraper::ComposeCreateParams::MediaType::OrSymbol
        ).void
      end
      attr_writer :media_type

      # Cached style username for voice matching (compose)
      sig { returns(T.nilable(String)) }
      attr_reader :style_username

      sig { params(style_username: String).void }
      attr_writer :style_username

      # Desired tone (refine)
      sig { returns(T.nilable(String)) }
      attr_reader :tone

      sig { params(tone: String).void }
      attr_writer :tone

      # Tweet topic (compose, refine)
      sig { returns(T.nilable(String)) }
      attr_reader :topic

      sig { params(topic: String).void }
      attr_writer :topic

      sig do
        params(
          step: XTwitterScraper::ComposeCreateParams::Step::OrSymbol,
          additional_context: String,
          call_to_action: String,
          draft: String,
          goal: XTwitterScraper::ComposeCreateParams::Goal::OrSymbol,
          has_link: T::Boolean,
          has_media: T::Boolean,
          media_type: XTwitterScraper::ComposeCreateParams::MediaType::OrSymbol,
          style_username: String,
          tone: String,
          topic: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Workflow step
        step:,
        # Extra context or URLs (refine)
        additional_context: nil,
        # Desired call to action (refine)
        call_to_action: nil,
        # Tweet draft text to evaluate (score)
        draft: nil,
        # Optimization goal
        goal: nil,
        # Whether a link is attached (score)
        has_link: nil,
        # Whether media is attached (score)
        has_media: nil,
        # Media type (refine)
        media_type: nil,
        # Cached style username for voice matching (compose)
        style_username: nil,
        # Desired tone (refine)
        tone: nil,
        # Tweet topic (compose, refine)
        topic: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            step: XTwitterScraper::ComposeCreateParams::Step::OrSymbol,
            additional_context: String,
            call_to_action: String,
            draft: String,
            goal: XTwitterScraper::ComposeCreateParams::Goal::OrSymbol,
            has_link: T::Boolean,
            has_media: T::Boolean,
            media_type:
              XTwitterScraper::ComposeCreateParams::MediaType::OrSymbol,
            style_username: String,
            tone: String,
            topic: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Workflow step
      module Step
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ComposeCreateParams::Step)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COMPOSE =
          T.let(
            :compose,
            XTwitterScraper::ComposeCreateParams::Step::TaggedSymbol
          )
        REFINE =
          T.let(
            :refine,
            XTwitterScraper::ComposeCreateParams::Step::TaggedSymbol
          )
        SCORE =
          T.let(
            :score,
            XTwitterScraper::ComposeCreateParams::Step::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::ComposeCreateParams::Step::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Optimization goal
      module Goal
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ComposeCreateParams::Goal)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENGAGEMENT =
          T.let(
            :engagement,
            XTwitterScraper::ComposeCreateParams::Goal::TaggedSymbol
          )
        FOLLOWERS =
          T.let(
            :followers,
            XTwitterScraper::ComposeCreateParams::Goal::TaggedSymbol
          )
        AUTHORITY =
          T.let(
            :authority,
            XTwitterScraper::ComposeCreateParams::Goal::TaggedSymbol
          )
        CONVERSATION =
          T.let(
            :conversation,
            XTwitterScraper::ComposeCreateParams::Goal::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::ComposeCreateParams::Goal::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Media type (refine)
      module MediaType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ComposeCreateParams::MediaType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PHOTO =
          T.let(
            :photo,
            XTwitterScraper::ComposeCreateParams::MediaType::TaggedSymbol
          )
        VIDEO =
          T.let(
            :video,
            XTwitterScraper::ComposeCreateParams::MediaType::TaggedSymbol
          )
        NONE =
          T.let(
            :none,
            XTwitterScraper::ComposeCreateParams::MediaType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ComposeCreateParams::MediaType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
