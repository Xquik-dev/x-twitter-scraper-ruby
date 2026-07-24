# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module ComposeCreateResponse
      extend XTwitterScraper::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult,
            XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult,
            XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult
          )
        end

      class ComposePrepareResult < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Xquik editorial heuristics, ordered for the goal.
        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ContentRule
            ]
          )
        end
        attr_accessor :content_rules

        # Published engagement signal names. Production multipliers are not published.
        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::EngagementMultiplier
            ]
          )
        end
        attr_accessor :engagement_multipliers

        # Publication limit for timing and decay claims.
        sig { returns(String) }
        attr_accessor :engagement_velocity

        sig { returns(T::Array[String]) }
        attr_accessor :follow_up_questions

        # X post intent seeded with the topic.
        sig { returns(String) }
        attr_accessor :intent_url

        sig { returns(String) }
        attr_accessor :next_step

        # Published signal names with unpublished weights as null.
        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ScorerWeight
            ]
          )
        end
        attr_accessor :scorer_weights

        # Signal source and evidence limits.
        sig { returns(String) }
        attr_accessor :source

        # Negative engagement predictions in the public model.
        sig { returns(T::Array[String]) }
        attr_accessor :top_penalties

        # Style analyses saved to the account.
        sig do
          returns(
            T.nilable(
              T::Array[
                XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::SavedStyle
              ]
            )
          )
        end
        attr_reader :saved_styles

        sig do
          params(
            saved_styles:
              T::Array[
                XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::SavedStyle::OrHash
              ]
          ).void
        end
        attr_writer :saved_styles

        # Next action when no cached style is available.
        sig { returns(T.nilable(String)) }
        attr_reader :style_note

        sig { params(style_note: String).void }
        attr_writer :style_note

        # Cached examples for the requested style username.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :style_tweets

        sig { params(style_tweets: T::Array[String]).void }
        attr_writer :style_tweets

        sig do
          params(
            content_rules:
              T::Array[
                XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ContentRule::OrHash
              ],
            engagement_multipliers:
              T::Array[
                XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::EngagementMultiplier::OrHash
              ],
            engagement_velocity: String,
            follow_up_questions: T::Array[String],
            intent_url: String,
            next_step: String,
            scorer_weights:
              T::Array[
                XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ScorerWeight::OrHash
              ],
            source: String,
            top_penalties: T::Array[String],
            saved_styles:
              T::Array[
                XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::SavedStyle::OrHash
              ],
            style_note: String,
            style_tweets: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Xquik editorial heuristics, ordered for the goal.
          content_rules:,
          # Published engagement signal names. Production multipliers are not published.
          engagement_multipliers:,
          # Publication limit for timing and decay claims.
          engagement_velocity:,
          follow_up_questions:,
          # X post intent seeded with the topic.
          intent_url:,
          next_step:,
          # Published signal names with unpublished weights as null.
          scorer_weights:,
          # Signal source and evidence limits.
          source:,
          # Negative engagement predictions in the public model.
          top_penalties:,
          # Style analyses saved to the account.
          saved_styles: nil,
          # Next action when no cached style is available.
          style_note: nil,
          # Cached examples for the requested style username.
          style_tweets: nil
        )
        end

        sig do
          override.returns(
            {
              content_rules:
                T::Array[
                  XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ContentRule
                ],
              engagement_multipliers:
                T::Array[
                  XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::EngagementMultiplier
                ],
              engagement_velocity: String,
              follow_up_questions: T::Array[String],
              intent_url: String,
              next_step: String,
              scorer_weights:
                T::Array[
                  XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ScorerWeight
                ],
              source: String,
              top_penalties: T::Array[String],
              saved_styles:
                T::Array[
                  XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::SavedStyle
                ],
              style_note: String,
              style_tweets: T::Array[String]
            }
          )
        end
        def to_hash
        end

        class ContentRule < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ContentRule,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :rule

          sig { params(rule: String).returns(T.attached_class) }
          def self.new(rule:)
          end

          sig { override.returns({ rule: String }) }
          def to_hash
          end
        end

        class EngagementMultiplier < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::EngagementMultiplier,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Human-readable published signal name.
          sig { returns(String) }
          attr_accessor :action

          sig { returns(Symbol) }
          attr_accessor :multiplier

          sig do
            params(action: String, multiplier: Symbol).returns(T.attached_class)
          end
          def self.new(
            # Human-readable published signal name.
            action:,
            multiplier: :"Production weight not published by X"
          )
          end

          sig { override.returns({ action: String, multiplier: Symbol }) }
          def to_hash
          end
        end

        class ScorerWeight < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ScorerWeight,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Signal direction and publication limit.
          sig { returns(String) }
          attr_accessor :context

          # Signal name from X's public ranking repository.
          sig { returns(String) }
          attr_accessor :signal

          # X does not publish the production weight.
          sig { returns(NilClass) }
          attr_accessor :weight

          sig do
            params(context: String, signal: String, weight: NilClass).returns(
              T.attached_class
            )
          end
          def self.new(
            # Signal direction and publication limit.
            context:,
            # Signal name from X's public ranking repository.
            signal:,
            # X does not publish the production weight.
            weight:
          )
          end

          sig do
            override.returns(
              { context: String, signal: String, weight: NilClass }
            )
          end
          def to_hash
          end
        end

        class SavedStyle < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::SavedStyle,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(Integer) }
          attr_accessor :tweet_count

          sig { returns(String) }
          attr_accessor :username

          sig do
            params(tweet_count: Integer, username: String).returns(
              T.attached_class
            )
          end
          def self.new(tweet_count:, username:)
          end

          sig { override.returns({ tweet_count: Integer, username: String }) }
          def to_hash
          end
        end
      end

      class ComposeRefineResult < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Goal, tone, media, and editorial guidance.
        sig { returns(T::Array[String]) }
        attr_accessor :composition_guidance

        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult::ExamplePattern
            ]
          )
        end
        attr_accessor :example_patterns

        # X post intent seeded with the topic.
        sig { returns(String) }
        attr_accessor :intent_url

        sig { returns(String) }
        attr_accessor :next_step

        sig do
          params(
            composition_guidance: T::Array[String],
            example_patterns:
              T::Array[
                XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult::ExamplePattern::OrHash
              ],
            intent_url: String,
            next_step: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Goal, tone, media, and editorial guidance.
          composition_guidance:,
          example_patterns:,
          # X post intent seeded with the topic.
          intent_url:,
          next_step:
        )
        end

        sig do
          override.returns(
            {
              composition_guidance: T::Array[String],
              example_patterns:
                T::Array[
                  XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult::ExamplePattern
                ],
              intent_url: String,
              next_step: String
            }
          )
        end
        def to_hash
        end

        class ExamplePattern < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult::ExamplePattern,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :description

          sig { returns(String) }
          attr_accessor :pattern

          sig do
            params(description: String, pattern: String).returns(
              T.attached_class
            )
          end
          def self.new(description:, pattern:)
          end

          sig { override.returns({ description: String, pattern: String }) }
          def to_hash
          end
        end
      end

      class ComposeScoreResult < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Deterministic editorial checks. Not a reach prediction.
        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult::Checklist
            ]
          )
        end
        attr_accessor :checklist

        sig { returns(String) }
        attr_accessor :next_step

        sig { returns(T::Boolean) }
        attr_accessor :passed

        sig { returns(Integer) }
        attr_accessor :passed_count

        sig { returns(String) }
        attr_accessor :top_suggestion

        sig { returns(Integer) }
        attr_accessor :total_checks

        # Present only when every check passes.
        sig { returns(T.nilable(String)) }
        attr_reader :intent_url

        sig { params(intent_url: String).void }
        attr_writer :intent_url

        sig do
          params(
            checklist:
              T::Array[
                XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult::Checklist::OrHash
              ],
            next_step: String,
            passed: T::Boolean,
            passed_count: Integer,
            top_suggestion: String,
            intent_url: String,
            total_checks: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Deterministic editorial checks. Not a reach prediction.
          checklist:,
          next_step:,
          passed:,
          passed_count:,
          top_suggestion:,
          # Present only when every check passes.
          intent_url: nil,
          total_checks: 9
        )
        end

        sig do
          override.returns(
            {
              checklist:
                T::Array[
                  XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult::Checklist
                ],
              next_step: String,
              passed: T::Boolean,
              passed_count: Integer,
              top_suggestion: String,
              total_checks: Integer,
              intent_url: String
            }
          )
        end
        def to_hash
        end

        class Checklist < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult::Checklist,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :factor

          sig { returns(T::Boolean) }
          attr_accessor :passed

          # Present only when the check fails.
          sig { returns(T.nilable(String)) }
          attr_reader :suggestion

          sig { params(suggestion: String).void }
          attr_writer :suggestion

          sig do
            params(
              factor: String,
              passed: T::Boolean,
              suggestion: String
            ).returns(T.attached_class)
          end
          def self.new(
            factor:,
            passed:,
            # Present only when the check fails.
            suggestion: nil
          )
          end

          sig do
            override.returns(
              { factor: String, passed: T::Boolean, suggestion: String }
            )
          end
          def to_hash
          end
        end
      end

      sig do
        override.returns(
          T::Array[XTwitterScraper::Models::ComposeCreateResponse::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
