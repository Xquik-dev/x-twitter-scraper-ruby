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

      sig do
        returns(
          T.any(
            XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest,
            XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest,
            XTwitterScraper::ComposeCreateParams::Body::ComposeScoreRequest
          )
        )
      end
      attr_accessor :body

      sig do
        params(
          body:
            T.any(
              XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::OrHash,
              XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::OrHash,
              XTwitterScraper::ComposeCreateParams::Body::ComposeScoreRequest::OrHash
            ),
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(body:, request_options: {})
      end

      sig do
        override.returns(
          {
            body:
              T.any(
                XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest,
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest,
                XTwitterScraper::ComposeCreateParams::Body::ComposeScoreRequest
              ),
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Body
        extend XTwitterScraper::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest,
              XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest,
              XTwitterScraper::ComposeCreateParams::Body::ComposeScoreRequest
            )
          end

        class ComposePrepareRequest < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :step

          # Subject for the post.
          sig { returns(String) }
          attr_accessor :topic

          # Editorial goal used to order the rules and questions.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::Goal::OrSymbol
              )
            )
          end
          attr_reader :goal

          sig do
            params(
              goal:
                XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::Goal::OrSymbol
            ).void
          end
          attr_writer :goal

          # Username from a style analysis saved to this account.
          sig { returns(T.nilable(String)) }
          attr_reader :style_username

          sig { params(style_username: String).void }
          attr_writer :style_username

          sig do
            params(
              topic: String,
              goal:
                XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::Goal::OrSymbol,
              style_username: String,
              step: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Subject for the post.
            topic:,
            # Editorial goal used to order the rules and questions.
            goal: nil,
            # Username from a style analysis saved to this account.
            style_username: nil,
            step: :compose
          )
          end

          sig do
            override.returns(
              {
                step: Symbol,
                topic: String,
                goal:
                  XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::Goal::OrSymbol,
                style_username: String
              }
            )
          end
          def to_hash
          end

          # Editorial goal used to order the rules and questions.
          module Goal
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::Goal
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ENGAGEMENT =
              T.let(
                :engagement,
                XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::Goal::TaggedSymbol
              )
            FOLLOWERS =
              T.let(
                :followers,
                XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::Goal::TaggedSymbol
              )
            AUTHORITY =
              T.let(
                :authority,
                XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::Goal::TaggedSymbol
              )
            CONVERSATION =
              T.let(
                :conversation,
                XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::Goal::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::ComposeCreateParams::Body::ComposePrepareRequest::Goal::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class ComposeRefineRequest < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Editorial goal for the guidance.
          sig do
            returns(
              XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::Goal::OrSymbol
            )
          end
          attr_accessor :goal

          sig { returns(Symbol) }
          attr_accessor :step

          # Requested writing tone.
          sig { returns(String) }
          attr_accessor :tone

          # Subject for the post.
          sig { returns(String) }
          attr_accessor :topic

          # Audience, constraints, sources, or other writing context.
          sig { returns(T.nilable(String)) }
          attr_reader :additional_context

          sig { params(additional_context: String).void }
          attr_writer :additional_context

          # Specific action the draft should request.
          sig { returns(T.nilable(String)) }
          attr_reader :call_to_action

          sig { params(call_to_action: String).void }
          attr_writer :call_to_action

          # Planned media type.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::MediaType::OrSymbol
              )
            )
          end
          attr_reader :media_type

          sig do
            params(
              media_type:
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::MediaType::OrSymbol
            ).void
          end
          attr_writer :media_type

          sig do
            params(
              goal:
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::Goal::OrSymbol,
              tone: String,
              topic: String,
              additional_context: String,
              call_to_action: String,
              media_type:
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::MediaType::OrSymbol,
              step: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Editorial goal for the guidance.
            goal:,
            # Requested writing tone.
            tone:,
            # Subject for the post.
            topic:,
            # Audience, constraints, sources, or other writing context.
            additional_context: nil,
            # Specific action the draft should request.
            call_to_action: nil,
            # Planned media type.
            media_type: nil,
            step: :refine
          )
          end

          sig do
            override.returns(
              {
                goal:
                  XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::Goal::OrSymbol,
                step: Symbol,
                tone: String,
                topic: String,
                additional_context: String,
                call_to_action: String,
                media_type:
                  XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::MediaType::OrSymbol
              }
            )
          end
          def to_hash
          end

          # Editorial goal for the guidance.
          module Goal
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::Goal
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ENGAGEMENT =
              T.let(
                :engagement,
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::Goal::TaggedSymbol
              )
            FOLLOWERS =
              T.let(
                :followers,
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::Goal::TaggedSymbol
              )
            AUTHORITY =
              T.let(
                :authority,
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::Goal::TaggedSymbol
              )
            CONVERSATION =
              T.let(
                :conversation,
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::Goal::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::Goal::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Planned media type.
          module MediaType
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::MediaType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PHOTO =
              T.let(
                :photo,
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::MediaType::TaggedSymbol
              )
            VIDEO =
              T.let(
                :video,
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::MediaType::TaggedSymbol
              )
            NONE =
              T.let(
                :none,
                XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::MediaType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::ComposeCreateParams::Body::ComposeRefineRequest::MediaType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class ComposeScoreRequest < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::ComposeCreateParams::Body::ComposeScoreRequest,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Full post text for deterministic editorial checks.
          sig { returns(String) }
          attr_accessor :draft

          sig { returns(Symbol) }
          attr_accessor :step

          # True when a separate link card is attached.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :has_link

          sig { params(has_link: T::Boolean).void }
          attr_writer :has_link

          # Accepted for backward compatibility. Text checks ignore this field.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :has_media

          sig { params(has_media: T::Boolean).void }
          attr_writer :has_media

          sig do
            params(
              draft: String,
              has_link: T::Boolean,
              has_media: T::Boolean,
              step: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Full post text for deterministic editorial checks.
            draft:,
            # True when a separate link card is attached.
            has_link: nil,
            # Accepted for backward compatibility. Text checks ignore this field.
            has_media: nil,
            step: :score
          )
          end

          sig do
            override.returns(
              {
                draft: String,
                step: Symbol,
                has_link: T::Boolean,
                has_media: T::Boolean
              }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[XTwitterScraper::ComposeCreateParams::Body::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
