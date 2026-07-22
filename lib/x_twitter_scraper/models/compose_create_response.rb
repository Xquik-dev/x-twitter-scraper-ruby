# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Compose#create
    module ComposeCreateResponse
      extend XTwitterScraper::Internal::Type::Union

      variant -> { XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult }

      variant -> { XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult }

      variant -> { XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult }

      class ComposePrepareResult < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute content_rules
        #   Xquik editorial heuristics, ordered for the goal.
        #
        #   @return [Array<XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ContentRule>]
        required :content_rules,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ContentRule] },
                 api_name: :contentRules

        # @!attribute engagement_multipliers
        #   Published engagement signal names. Production multipliers are not published.
        #
        #   @return [Array<XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::EngagementMultiplier>]
        required :engagement_multipliers,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::EngagementMultiplier] },
                 api_name: :engagementMultipliers

        # @!attribute engagement_velocity
        #   Publication limit for timing and decay claims.
        #
        #   @return [String]
        required :engagement_velocity, String, api_name: :engagementVelocity

        # @!attribute follow_up_questions
        #
        #   @return [Array<String>]
        required :follow_up_questions,
                 XTwitterScraper::Internal::Type::ArrayOf[String],
                 api_name: :followUpQuestions

        # @!attribute intent_url
        #   X post intent seeded with the topic.
        #
        #   @return [String]
        required :intent_url, String, api_name: :intentUrl

        # @!attribute next_step
        #
        #   @return [String]
        required :next_step, String, api_name: :nextStep

        # @!attribute scorer_weights
        #   Published signal names with unpublished weights as null.
        #
        #   @return [Array<XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ScorerWeight>]
        required :scorer_weights,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ScorerWeight] },
                 api_name: :scorerWeights

        # @!attribute source
        #   Signal source and evidence limits.
        #
        #   @return [String]
        required :source, String

        # @!attribute top_penalties
        #   Negative engagement predictions in the public model.
        #
        #   @return [Array<String>]
        required :top_penalties, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :topPenalties

        # @!attribute saved_styles
        #   Style analyses saved to the account.
        #
        #   @return [Array<XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::SavedStyle>, nil]
        optional :saved_styles,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::SavedStyle] },
                 api_name: :savedStyles

        # @!attribute style_note
        #   Next action when no cached style is available.
        #
        #   @return [String, nil]
        optional :style_note, String, api_name: :styleNote

        # @!attribute style_tweets
        #   Cached examples for the requested style username.
        #
        #   @return [Array<String>, nil]
        optional :style_tweets, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :styleTweets

        # @!method initialize(content_rules:, engagement_multipliers:, engagement_velocity:, follow_up_questions:, intent_url:, next_step:, scorer_weights:, source:, top_penalties:, saved_styles: nil, style_note: nil, style_tweets: nil)
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult} for more
        #   details.
        #
        #   @param content_rules [Array<XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ContentRule>] Xquik editorial heuristics, ordered for the goal.
        #
        #   @param engagement_multipliers [Array<XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::EngagementMultiplier>] Published engagement signal names. Production multipliers are not published.
        #
        #   @param engagement_velocity [String] Publication limit for timing and decay claims.
        #
        #   @param follow_up_questions [Array<String>]
        #
        #   @param intent_url [String] X post intent seeded with the topic.
        #
        #   @param next_step [String]
        #
        #   @param scorer_weights [Array<XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::ScorerWeight>] Published signal names with unpublished weights as null.
        #
        #   @param source [String] Signal source and evidence limits.
        #
        #   @param top_penalties [Array<String>] Negative engagement predictions in the public model.
        #
        #   @param saved_styles [Array<XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult::SavedStyle>] Style analyses saved to the account.
        #
        #   @param style_note [String] Next action when no cached style is available.
        #
        #   @param style_tweets [Array<String>] Cached examples for the requested style username.

        class ContentRule < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute rule
          #
          #   @return [String]
          required :rule, String

          # @!method initialize(rule:)
          #   @param rule [String]
        end

        class EngagementMultiplier < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute action
          #   Human-readable published signal name.
          #
          #   @return [String]
          required :action, String

          # @!attribute multiplier
          #
          #   @return [Symbol, :"Production weight not published by X"]
          required :multiplier, const: :"Production weight not published by X"

          # @!method initialize(action:, multiplier: :"Production weight not published by X")
          #   @param action [String] Human-readable published signal name.
          #
          #   @param multiplier [Symbol, :"Production weight not published by X"]
        end

        class ScorerWeight < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute context
          #   Signal direction and publication limit.
          #
          #   @return [String]
          required :context, String

          # @!attribute signal
          #   Signal name from X's public ranking repository.
          #
          #   @return [String]
          required :signal, String

          # @!attribute weight
          #   X does not publish the production weight.
          #
          #   @return [nil]
          required :weight, NilClass

          # @!method initialize(context:, signal:, weight:)
          #   @param context [String] Signal direction and publication limit.
          #
          #   @param signal [String] Signal name from X's public ranking repository.
          #
          #   @param weight [nil] X does not publish the production weight.
        end

        class SavedStyle < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute tweet_count
          #
          #   @return [Integer]
          required :tweet_count, Integer, api_name: :tweetCount

          # @!attribute username
          #
          #   @return [String]
          required :username, String

          # @!method initialize(tweet_count:, username:)
          #   @param tweet_count [Integer]
          #   @param username [String]
        end
      end

      class ComposeRefineResult < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute composition_guidance
        #   Goal, tone, media, and editorial guidance.
        #
        #   @return [Array<String>]
        required :composition_guidance,
                 XTwitterScraper::Internal::Type::ArrayOf[String],
                 api_name: :compositionGuidance

        # @!attribute example_patterns
        #
        #   @return [Array<XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult::ExamplePattern>]
        required :example_patterns,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult::ExamplePattern] },
                 api_name: :examplePatterns

        # @!attribute intent_url
        #   X post intent seeded with the topic.
        #
        #   @return [String]
        required :intent_url, String, api_name: :intentUrl

        # @!attribute next_step
        #
        #   @return [String]
        required :next_step, String, api_name: :nextStep

        # @!method initialize(composition_guidance:, example_patterns:, intent_url:, next_step:)
        #   @param composition_guidance [Array<String>] Goal, tone, media, and editorial guidance.
        #
        #   @param example_patterns [Array<XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult::ExamplePattern>]
        #
        #   @param intent_url [String] X post intent seeded with the topic.
        #
        #   @param next_step [String]

        class ExamplePattern < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String]
          required :description, String

          # @!attribute pattern
          #
          #   @return [String]
          required :pattern, String

          # @!method initialize(description:, pattern:)
          #   @param description [String]
          #   @param pattern [String]
        end
      end

      class ComposeScoreResult < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute checklist
        #   Deterministic editorial checks. Not a reach prediction.
        #
        #   @return [Array<XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult::Checklist>]
        required :checklist,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult::Checklist] }

        # @!attribute next_step
        #
        #   @return [String]
        required :next_step, String, api_name: :nextStep

        # @!attribute passed
        #
        #   @return [Boolean]
        required :passed, XTwitterScraper::Internal::Type::Boolean

        # @!attribute passed_count
        #
        #   @return [Integer]
        required :passed_count, Integer, api_name: :passedCount

        # @!attribute top_suggestion
        #
        #   @return [String]
        required :top_suggestion, String, api_name: :topSuggestion

        # @!attribute total_checks
        #
        #   @return [Integer, 9]
        required :total_checks, const: 9, api_name: :totalChecks

        # @!attribute intent_url
        #   Present only when every check passes.
        #
        #   @return [String, nil]
        optional :intent_url, String, api_name: :intentUrl

        # @!method initialize(checklist:, next_step:, passed:, passed_count:, top_suggestion:, intent_url: nil, total_checks: 9)
        #   @param checklist [Array<XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult::Checklist>] Deterministic editorial checks. Not a reach prediction.
        #
        #   @param next_step [String]
        #
        #   @param passed [Boolean]
        #
        #   @param passed_count [Integer]
        #
        #   @param top_suggestion [String]
        #
        #   @param intent_url [String] Present only when every check passes.
        #
        #   @param total_checks [Integer, 9]

        class Checklist < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute factor
          #
          #   @return [String]
          required :factor, String

          # @!attribute passed
          #
          #   @return [Boolean]
          required :passed, XTwitterScraper::Internal::Type::Boolean

          # @!attribute suggestion
          #   Present only when the check fails.
          #
          #   @return [String, nil]
          optional :suggestion, String

          # @!method initialize(factor:, passed:, suggestion: nil)
          #   @param factor [String]
          #
          #   @param passed [Boolean]
          #
          #   @param suggestion [String] Present only when the check fails.
        end
      end

      # @!method self.variants
      #   @return [Array(XTwitterScraper::Models::ComposeCreateResponse::ComposePrepareResult, XTwitterScraper::Models::ComposeCreateResponse::ComposeRefineResult, XTwitterScraper::Models::ComposeCreateResponse::ComposeScoreResult)]
    end
  end
end
