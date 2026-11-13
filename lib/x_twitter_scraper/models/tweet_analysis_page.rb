# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetAnalysisPage < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute results
      #   Each analyzed post with its answers.
      #
      #   @return [Array<XTwitterScraper::Models::TweetAnalysisPage::Result>]
      required :results, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetAnalysisPage::Result] }

      # @!attribute unanalyzed
      #   Each post without an analysis, by ID & reason. These cost nothing.
      #
      #   @return [Array<XTwitterScraper::Models::TweetAnalysisPage::Unanalyzed>]
      required :unanalyzed,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetAnalysisPage::Unanalyzed] }

      # @!attribute analysis_summary
      #   Totals of the answers across the analyzed posts.
      #
      #   @return [XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary]
      required :analysis_summary,
               -> { XTwitterScraper::TweetAnalysisPage::AnalysisSummary },
               api_name: :analysisSummary

      # @!attribute has_next_page
      #   Whether the search has more posts. Send next_cursor as cursor.
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #   Cursor of the search's next page, else empty.
      #
      #   @return [String]
      required :next_cursor, String

      # @!attribute topic_filter
      #   What the topic filter asked & how many posts it kept. Present when you send
      #   topic.
      #
      #   @return [XTwitterScraper::Models::TopicFilterSummary, nil]
      optional :topic_filter, -> { XTwitterScraper::TopicFilterSummary }, api_name: :topicFilter

      # @!attribute image_filter
      #   What the image filter asked & how many posts it kept. Present when you send
      #   imageShows.
      #
      #   @return [XTwitterScraper::Models::ImageFilterSummary, nil]
      optional :image_filter, -> { XTwitterScraper::ImageFilterSummary }, api_name: :imageFilter

      # @!method initialize(results:, unanalyzed:, analysis_summary:, has_next_page:, next_cursor:, topic_filter: nil, image_filter: nil)
      #   Analyzed posts, the posts without an analysis & the totals of the answers. Each
      #   row in results costs 2 credits.
      #
      #   @param results [Array<XTwitterScraper::Models::TweetAnalysisPage::Result>] Each analyzed post with its answers.
      #
      #   @param unanalyzed [Array<XTwitterScraper::Models::TweetAnalysisPage::Unanalyzed>] Each post without an analysis, by ID & reason. These cost nothing.
      #
      #   @param analysis_summary [XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary] Totals of the answers across the analyzed posts.
      #
      #   @param has_next_page [Boolean] Whether the search has more posts. Send next_cursor as cursor.
      #
      #   @param next_cursor [String] Cursor of the search's next page, else empty.
      #
      #   @param topic_filter [XTwitterScraper::Models::TopicFilterSummary] What the topic filter asked & how many posts it kept. Present when you send
      #
      #   @param image_filter [XTwitterScraper::Models::ImageFilterSummary] What the image filter asked & how many posts it kept. Present when you send

      # A choice gives its category, a score its level from 0, which can have decimals,
      # & a probability its value from 0 to 1.
      module AnswerValue
        extend XTwitterScraper::Internal::Type::Union

        variant String

        variant Float

        # @!method self.variants
        #   @return [Array(String, Float)]
      end

      class Change < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute question_id
        #
        #   @return [String]
        required :question_id, String, api_name: :questionId

        # @!attribute previous
        #
        #   @return [String]
        required :previous, String

        # @!attribute current
        #
        #   @return [String]
        required :current, String

        # @!method initialize(question_id:, previous:, current:)
        #   1 changed decision, earlier & now.
        #
        #   @param question_id [String]
        #   @param previous [String]
        #   @param current [String]
      end

      class Result < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute tweet
        #   The post, as /x/tweets/search returns it. Your own texts have the IDs text:1,
        #   text:2 & so on.
        #
        #   @return [XTwitterScraper::Models::SearchTweet]
        required :tweet, -> { XTwitterScraper::SearchTweet }

        # @!attribute analysis
        #   The answers in full, with their probabilities.
        #
        #   @return [XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis]
        required :analysis, -> { XTwitterScraper::TweetAnalysisPage::Result::Analysis }

        # @!attribute answers
        #   Each question's decision by question ID. A choice gives its category, a score
        #   its level from 0, which can have decimals, & a probability its value from 0 to 1.
        #
        #   @return [Hash{Symbol=>String, Float}]
        required :answers,
                 -> { XTwitterScraper::Internal::Type::HashOf[union: XTwitterScraper::TweetAnalysisPage::AnswerValue] }

        # @!attribute source_domains
        #   Hostnames the post links to, without t.co.
        #
        #   @return [Array<String>]
        required :source_domains, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :sourceDomains

        # @!attribute cashtags
        #   Cashtags in the post's text, in upper case.
        #
        #   @return [Array<String>]
        required :cashtags, XTwitterScraper::Internal::Type::ArrayOf[String]

        # @!attribute viral_score
        #   Only from /x/analysis/viral-score. How viral the wording reads, or null when a
        #   trait has no answer.
        #
        #   @return [Integer, nil]
        optional :viral_score, Integer, api_name: :viralScore, nil?: true

        # @!attribute viral_verdict
        #   Only from /x/analysis/viral-score. send_it from 70, edit_first from 40, else
        #   sleep_on_it.
        #
        #   @return [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::ViralVerdict, nil]
        optional :viral_verdict,
                 enum: -> { XTwitterScraper::TweetAnalysisPage::Result::ViralVerdict },
                 api_name: :viralVerdict,
                 nil?: true

        # @!attribute viral_algorithm_score
        #   Only from /x/analysis/viral-score. The post's public counts under X's published
        #   ranking weights, per 1,000 views or followers.
        #
        #   @return [Float, nil]
        optional :viral_algorithm_score, Float, api_name: :viralAlgorithmScore, nil?: true

        # @!attribute viral_actual_engagement_rate
        #   Only from /x/analysis/viral-score. log10 of 1 plus the weighted engagement per
        #   1,000 followers. Null without a follower count.
        #
        #   @return [Float, nil]
        optional :viral_actual_engagement_rate, Float, api_name: :viralActualEngagementRate, nil?: true

        # @!attribute viral
        #   Only from /x/analysis/viral-score. The score with its weights version, the caps
        #   that applied & the engagement comparison.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :viral, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

        # @!attribute monitor
        #   How the post's answers compare with its row in baseline, as the AI Actors
        #   compare a run with an earlier dataset.
        #
        #   @return [XTwitterScraper::Models::TweetAnalysisPage::Result::Monitor]
        required :monitor, -> { XTwitterScraper::TweetAnalysisPage::Result::Monitor }

        # @!method initialize(tweet:, analysis:, answers:, source_domains:, cashtags:, monitor:, viral_score: nil, viral_verdict: nil, viral_algorithm_score: nil, viral_actual_engagement_rate: nil, viral: nil)
        #   1 analyzed post with its answers.
        #
        #   @param tweet [XTwitterScraper::Models::SearchTweet] The post, as /x/tweets/search returns it. Your own texts have the IDs text:1,
        #
        #   @param analysis [XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis] The answers in full, with their probabilities.
        #
        #   @param answers [Hash{Symbol=>String, Float}] Each question's decision by question ID. A choice gives its category, a score
        #
        #   @param source_domains [Array<String>] Hostnames the post links to, without t.co.
        #
        #   @param cashtags [Array<String>] Cashtags in the post's text, in upper case.
        #
        #   @param monitor [XTwitterScraper::Models::TweetAnalysisPage::Result::Monitor] How the post's answers compare with its row in baseline, as the AI Actors
        #
        #   @param viral_score [Integer, nil] Only from /x/analysis/viral-score. How viral the wording reads, or null when a
        #
        #   @param viral_verdict [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::ViralVerdict, nil] Only from /x/analysis/viral-score. send_it from 70, edit_first from 40, else
        #
        #   @param viral_algorithm_score [Float, nil] Only from /x/analysis/viral-score. The post's public counts under X's published
        #
        #   @param viral_actual_engagement_rate [Float, nil] Only from /x/analysis/viral-score. log10 of 1 plus the weighted engagement per
        #
        #   @param viral [Hash{Symbol=>Object}] Only from /x/analysis/viral-score. The score with its weights version, the caps

        # @see XTwitterScraper::Models::TweetAnalysisPage::Result#analysis
        class Analysis < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute status
          #
          #   @return [Symbol, :succeeded]
          required :status, const: :succeeded

          # @!attribute answers
          #   1 answer per question, in question order.
          #
          #   @return [Array<XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::Answer>]
          required :answers,
                   -> {
                     XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer]
                   }

          # @!attribute questions
          #   The ID & version of each question asked.
          #
          #   @return [Array<XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::Question>]
          required :questions,
                   -> {
                     XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetAnalysisPage::Result::Analysis::Question]
                   }

          # @!attribute context_bytes
          #   Bytes of post & settings the AI read.
          #
          #   @return [Integer]
          required :context_bytes, Integer, api_name: :contextBytes

          # @!attribute context_availability
          #   What the AI read beside the post's text.
          #
          #   @return [XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability]
          required :context_availability,
                   -> { XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability },
                   api_name: :contextAvailability

          # @!method initialize(answers:, questions:, context_bytes:, context_availability:, status: :succeeded)
          #   The answers in full, with their probabilities.
          #
          #   @param answers [Array<XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::Answer>] 1 answer per question, in question order.
          #
          #   @param questions [Array<XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::Question>] The ID & version of each question asked.
          #
          #   @param context_bytes [Integer] Bytes of post & settings the AI read.
          #
          #   @param context_availability [XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability] What the AI read beside the post's text.
          #
          #   @param status [Symbol, :succeeded]

          class Answer < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute question_id
            #
            #   @return [String]
            required :question_id, String, api_name: :questionId

            # @!attribute question_version
            #
            #   @return [String]
            required :question_version, String, api_name: :questionVersion

            # @!attribute type
            #
            #   @return [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::Answer::Type]
            required :type, enum: -> { XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer::Type }

            # @!attribute value
            #   The chosen category, or the level from 0, which can have decimals, such as 1.4
            #   between levels 1 & 2.
            #
            #   @return [String, Float, nil]
            optional :value, union: -> { XTwitterScraper::TweetAnalysisPage::AnswerValue }

            # @!attribute confidence
            #
            #   @return [Float, nil]
            optional :confidence, Float

            # @!attribute probabilities
            #   Probability of each category, or of each level by index.
            #
            #   @return [Hash{Symbol=>Float}, nil]
            optional :probabilities, XTwitterScraper::Internal::Type::HashOf[Float]

            # @!attribute levels
            #   For a score. The levels the question named, from 0.
            #
            #   @return [Array<String>, nil]
            optional :levels, XTwitterScraper::Internal::Type::ArrayOf[String]

            # @!attribute probability
            #   For a probability. The chance the answer is yes.
            #
            #   @return [Float, nil]
            optional :probability, Float

            # @!method initialize(question_id:, question_version:, type:, value: nil, confidence: nil, probabilities: nil, levels: nil, probability: nil)
            #   1 question's answer. A probability has probability. A choice or score has
            #   value, confidence & the probability of each category or level.
            #
            #   @param question_id [String]
            #
            #   @param question_version [String]
            #
            #   @param type [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::Answer::Type]
            #
            #   @param value [String, Float] The chosen category, or the level from 0, which can have decimals, such as 1.4
            #
            #   @param confidence [Float]
            #
            #   @param probabilities [Hash{Symbol=>Float}] Probability of each category, or of each level by index.
            #
            #   @param levels [Array<String>] For a score. The levels the question named, from 0.
            #
            #   @param probability [Float] For a probability. The chance the answer is yes.

            # @see XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::Answer#type
            module Type
              extend XTwitterScraper::Internal::Type::Enum

              CHOICE = :choice
              SCORE = :score
              PROBABILITY = :probability

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class Question < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String]
            required :id, String

            # @!attribute version
            #
            #   @return [String]
            required :version, String

            # @!method initialize(id:, version:)
            #   @param id [String]
            #   @param version [String]
          end

          # @see XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis#context_availability
          class ContextAvailability < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute quote
            #
            #   @return [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability::Quote]
            required :quote,
                     enum: -> { XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Quote }

            # @!attribute reply
            #
            #   @return [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability::Reply]
            required :reply,
                     enum: -> { XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Reply }

            # @!attribute author
            #
            #   @return [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability::Author]
            required :author,
                     enum: -> { XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Author }

            # @!attribute media
            #   images when the AI read the post's images. text_descriptions_only when it read
            #   only their alt text.
            #
            #   @return [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability::Media]
            required :media,
                     enum: -> { XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Media }

            # @!attribute article
            #
            #   @return [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability::Article]
            required :article,
                     enum: -> { XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Article }

            # @!attribute post_text
            #   truncated when the post was cut to fit.
            #
            #   @return [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability::PostText]
            required :post_text,
                     enum: -> { XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::PostText },
                     api_name: :postText

            # @!method initialize(quote:, reply:, author:, media:, article:, post_text:)
            #   What the AI read beside the post's text.
            #
            #   @param quote [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability::Quote]
            #
            #   @param reply [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability::Reply]
            #
            #   @param author [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability::Author]
            #
            #   @param media [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability::Media] images when the AI read the post's images. text_descriptions_only when it read
            #
            #   @param article [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability::Article]
            #
            #   @param post_text [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability::PostText] truncated when the post was cut to fit.

            # @see XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability#quote
            module Quote
              extend XTwitterScraper::Internal::Type::Enum

              AVAILABLE = :available
              MISSING = :missing
              NOT_APPLICABLE = :not_applicable

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability#reply
            module Reply
              extend XTwitterScraper::Internal::Type::Enum

              AVAILABLE = :available
              MISSING = :missing
              NOT_APPLICABLE = :not_applicable

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability#author
            module Author
              extend XTwitterScraper::Internal::Type::Enum

              AVAILABLE = :available
              MISSING = :missing

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # images when the AI read the post's images. text_descriptions_only when it read
            # only their alt text.
            #
            # @see XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability#media
            module Media
              extend XTwitterScraper::Internal::Type::Enum

              IMAGES = :images
              TEXT_DESCRIPTIONS_ONLY = :text_descriptions_only
              NOT_SUPPLIED = :not_supplied

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability#article
            module Article
              extend XTwitterScraper::Internal::Type::Enum

              TEXT_BLOCKS = :text_blocks
              SUMMARY = :summary
              NOT_SUPPLIED = :not_supplied

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # truncated when the post was cut to fit.
            #
            # @see XTwitterScraper::Models::TweetAnalysisPage::Result::Analysis::ContextAvailability#post_text
            module PostText
              extend XTwitterScraper::Internal::Type::Enum

              FULL = :full
              TRUNCATED = :truncated

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        # Only from /x/analysis/viral-score. send_it from 70, edit_first from 40, else
        # sleep_on_it.
        #
        # @see XTwitterScraper::Models::TweetAnalysisPage::Result#viral_verdict
        module ViralVerdict
          extend XTwitterScraper::Internal::Type::Enum

          SEND_IT = :send_it
          EDIT_FIRST = :edit_first
          SLEEP_ON_IT = :sleep_on_it

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see XTwitterScraper::Models::TweetAnalysisPage::Result#monitor
        class Monitor < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute configuration_fingerprint
          #   Hash of the questions, targets & context. Rows with another hash are
          #   not_comparable.
          #
          #   @return [String]
          required :configuration_fingerprint, String, api_name: :configurationFingerprint

          # @!attribute baseline_dataset_id
          #   Always null. The baseline is the rows you sent.
          #
          #   @return [nil]
          required :baseline_dataset_id, NilClass, api_name: :baselineDatasetId

          # @!attribute status
          #   first_run without baseline. new_to_baseline for a post baseline lacks. changed
          #   when an answer clearly left its earlier decision. not_comparable when other
          #   settings made the earlier row or it answers none of these questions.
          #
          #   @return [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Monitor::Status]
          required :status, enum: -> { XTwitterScraper::TweetAnalysisPage::Result::Monitor::Status }

          # @!attribute changed_question_ids
          #   IDs of the questions whose decision changed.
          #
          #   @return [Array<String>]
          required :changed_question_ids,
                   XTwitterScraper::Internal::Type::ArrayOf[String],
                   api_name: :changedQuestionIds

          # @!attribute changes
          #   Each changed decision, earlier & now.
          #
          #   @return [Array<XTwitterScraper::Models::TweetAnalysisPage::Change>]
          required :changes, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetAnalysisPage::Change] }

          # @!method initialize(configuration_fingerprint:, baseline_dataset_id:, status:, changed_question_ids:, changes:)
          #   How the post's answers compare with its row in baseline, as the AI Actors
          #   compare a run with an earlier dataset.
          #
          #   @param configuration_fingerprint [String] Hash of the questions, targets & context. Rows with another hash are
          #
          #   @param baseline_dataset_id [nil] Always null. The baseline is the rows you sent.
          #
          #   @param status [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Result::Monitor::Status] first_run without baseline. new_to_baseline for a post baseline lacks. changed
          #
          #   @param changed_question_ids [Array<String>] IDs of the questions whose decision changed.
          #
          #   @param changes [Array<XTwitterScraper::Models::TweetAnalysisPage::Change>] Each changed decision, earlier & now.

          # first_run without baseline. new_to_baseline for a post baseline lacks. changed
          # when an answer clearly left its earlier decision. not_comparable when other
          # settings made the earlier row or it answers none of these questions.
          #
          # @see XTwitterScraper::Models::TweetAnalysisPage::Result::Monitor#status
          module Status
            extend XTwitterScraper::Internal::Type::Enum

            FIRST_RUN = :first_run
            NEW_TO_BASELINE = :new_to_baseline
            UNCHANGED = :unchanged
            CHANGED = :changed
            NOT_COMPARABLE = :not_comparable
            ANALYSIS_UNAVAILABLE = :analysis_unavailable

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      class Unanalyzed < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #   Post ID. Your own texts have the IDs text:1, text:2 & so on.
        #
        #   @return [String]
        required :id, String

        # @!attribute status
        #
        #   @return [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Unanalyzed::Status]
        required :status, enum: -> { XTwitterScraper::TweetAnalysisPage::Unanalyzed::Status }

        # @!attribute reason
        #   post_unavailable when X returns no such post. missing_text for a post without
        #   text. insufficient_credits when credits ran out. context_limit when the settings
        #   leave the post no room. The other reasons mean the analysis failed. Send the
        #   post again.
        #
        #   @return [String]
        required :reason, String

        # @!method initialize(id:, status:, reason:)
        #   A post without an analysis. It costs nothing.
        #
        #   @param id [String] Post ID. Your own texts have the IDs text:1, text:2 & so on.
        #
        #   @param status [Symbol, XTwitterScraper::Models::TweetAnalysisPage::Unanalyzed::Status]
        #
        #   @param reason [String] post_unavailable when X returns no such post. missing_text for a post without

        # @see XTwitterScraper::Models::TweetAnalysisPage::Unanalyzed#status
        module Status
          extend XTwitterScraper::Internal::Type::Enum

          FAILED = :failed
          SKIPPED = :skipped

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see XTwitterScraper::Models::TweetAnalysisPage#analysis_summary
      class AnalysisSummary < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute schema_version
        #
        #   @return [Integer]
        required :schema_version, Integer, api_name: :schemaVersion

        # @!attribute rows
        #   Posts by analysis outcome.
        #
        #   @return [XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Rows]
        required :rows, -> { XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Rows }

        # @!attribute engagement
        #   Likes, reposts, replies & quotes of the analyzed posts.
        #
        #   @return [Integer]
        required :engagement, Integer

        # @!attribute questions
        #   Totals by question ID. A choice has counts, shares, engagementShares & top posts
        #   per category. A score has mean, engagementWeightedMean & levels. A probability
        #   has mean, yes & no.
        #
        #   @return [Hash{Symbol=>Hash{Symbol=>Object}}]
        required :questions,
                 XTwitterScraper::Internal::Type::HashOf[
                   XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]
                 ]

        # @!attribute targets
        #   Mentions & answers per target in analysis.targets.
        #
        #   @return [Array<XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Target>]
        required :targets,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Target] }

        # @!attribute cashtags
        #   Posts & answers per cashtag, most posts first, up to 20. signal is present for
        #   the market questions.
        #
        #   @return [Array<XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Cashtag>]
        required :cashtags,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Cashtag] }

        # @!attribute source_domains
        #   Posts per linked hostname, most posts first, up to 20.
        #
        #   @return [Array<XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::SourceDomain>]
        required :source_domains,
                 -> {
                   XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetAnalysisPage::AnalysisSummary::SourceDomain]
                 },
                 api_name: :sourceDomains

        # @!attribute viral
        #   Only from /x/analysis/viral-score. Scored posts, the average score, verdict
        #   counts, the scores against actual engagement, a report per author & the
        #   leaderboards.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :viral, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

        # @!attribute monitor
        #   Posts per comparison status, & up to 50 changed posts with their changes. Null
        #   when the answer holds no post.
        #
        #   @return [XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Monitor, nil]
        required :monitor, -> { XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Monitor }, nil?: true

        # @!method initialize(schema_version:, rows:, engagement:, questions:, targets:, cashtags:, source_domains:, monitor:, viral: nil)
        #   Totals of the answers across the analyzed posts.
        #
        #   @param schema_version [Integer]
        #
        #   @param rows [XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Rows] Posts by analysis outcome.
        #
        #   @param engagement [Integer] Likes, reposts, replies & quotes of the analyzed posts.
        #
        #   @param questions [Hash{Symbol=>Hash{Symbol=>Object}}] Totals by question ID. A choice has counts, shares, engagementShares & top posts
        #
        #   @param targets [Array<XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Target>] Mentions & answers per target in analysis.targets.
        #
        #   @param cashtags [Array<XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Cashtag>] Posts & answers per cashtag, most posts first, up to 20. signal is present for
        #
        #   @param source_domains [Array<XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::SourceDomain>] Posts per linked hostname, most posts first, up to 20.
        #
        #   @param monitor [XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Monitor, nil] Posts per comparison status, & up to 50 changed posts with their changes. Null
        #
        #   @param viral [Hash{Symbol=>Object}] Only from /x/analysis/viral-score. Scored posts, the average score, verdict

        # @see XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary#rows
        class Rows < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute analyzed
          #
          #   @return [Integer]
          required :analyzed, Integer

          # @!attribute failed
          #
          #   @return [Integer]
          required :failed, Integer

          # @!attribute skipped
          #
          #   @return [Integer]
          required :skipped, Integer

          # @!method initialize(analyzed:, failed:, skipped:)
          #   Posts by analysis outcome.
          #
          #   @param analyzed [Integer]
          #   @param failed [Integer]
          #   @param skipped [Integer]
        end

        class Target < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute mentions
          #
          #   @return [Integer]
          required :mentions, Integer

          # @!attribute share
          #
          #   @return [Float]
          required :share, Float

          # @!attribute engagement
          #
          #   @return [Integer]
          required :engagement, Integer

          # @!attribute choices
          #   Category counts by question ID.
          #
          #   @return [Hash{Symbol=>Object}]
          required :choices, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

          # @!attribute top
          #   The most engaged posts per question ID & category.
          #
          #   @return [Hash{Symbol=>Object}]
          required :top, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

          # @!method initialize(name:, mentions:, share:, engagement:, choices:, top:)
          #   @param name [String]
          #
          #   @param mentions [Integer]
          #
          #   @param share [Float]
          #
          #   @param engagement [Integer]
          #
          #   @param choices [Hash{Symbol=>Object}] Category counts by question ID.
          #
          #   @param top [Hash{Symbol=>Object}] The most engaged posts per question ID & category.
        end

        class Cashtag < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute cashtag
          #
          #   @return [String]
          required :cashtag, String

          # @!attribute rows
          #
          #   @return [Integer]
          required :rows, Integer

          # @!attribute choices
          #   Category counts of the cashtag's posts by question ID.
          #
          #   @return [Hash{Symbol=>Object}]
          required :choices, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

          # @!attribute signal
          #
          #   @return [XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Cashtag::Signal, nil]
          optional :signal, -> { XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Cashtag::Signal }

          # @!method initialize(cashtag:, rows:, choices:, signal: nil)
          #   @param cashtag [String]
          #
          #   @param rows [Integer]
          #
          #   @param choices [Hash{Symbol=>Object}] Category counts of the cashtag's posts by question ID.
          #
          #   @param signal [XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Cashtag::Signal]

          # @see XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Cashtag#signal
          class Signal < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute bullish
            #
            #   @return [Integer]
            required :bullish, Integer

            # @!attribute bearish
            #
            #   @return [Integer]
            required :bearish, Integer

            # @!attribute score
            #   Bullish minus bearish posts, over all posts.
            #
            #   @return [Float]
            required :score, Float

            # @!method initialize(bullish:, bearish:, score:)
            #   @param bullish [Integer]
            #
            #   @param bearish [Integer]
            #
            #   @param score [Float] Bullish minus bearish posts, over all posts.
          end
        end

        class SourceDomain < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute domain
          #
          #   @return [String]
          required :domain, String

          # @!attribute posts
          #
          #   @return [Integer]
          required :posts, Integer

          # @!method initialize(domain:, posts:)
          #   @param domain [String]
          #   @param posts [Integer]
        end

        # @see XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary#monitor
        class Monitor < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute statuses
          #   Posts per monitor status.
          #
          #   @return [Hash{Symbol=>Integer}]
          required :statuses, XTwitterScraper::Internal::Type::HashOf[Integer]

          # @!attribute changed_rows
          #
          #   @return [Array<XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Monitor::ChangedRow>]
          required :changed_rows,
                   -> {
                     XTwitterScraper::Internal::Type::ArrayOf[
                       XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Monitor::ChangedRow
                     ]
                   },
                   api_name: :changedRows

          # @!method initialize(statuses:, changed_rows:)
          #   Posts per comparison status, & up to 50 changed posts with their changes. Null
          #   when the answer holds no post.
          #
          #   @param statuses [Hash{Symbol=>Integer}] Posts per monitor status.
          #
          #   @param changed_rows [Array<XTwitterScraper::Models::TweetAnalysisPage::AnalysisSummary::Monitor::ChangedRow>]

          class ChangedRow < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute tweet_id
            #
            #   @return [String]
            required :tweet_id, String, api_name: :tweetId

            # @!attribute changes
            #
            #   @return [Array<XTwitterScraper::Models::TweetAnalysisPage::Change>]
            required :changes,
                     -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetAnalysisPage::Change] }

            # @!method initialize(tweet_id:, changes:)
            #   @param tweet_id [String]
            #   @param changes [Array<XTwitterScraper::Models::TweetAnalysisPage::Change>]
          end
        end
      end
    end
  end
end
