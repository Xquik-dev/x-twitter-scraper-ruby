# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetAnalysisPage < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::TweetAnalysisPage,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Each analyzed post with its answers.
      sig { returns(T::Array[XTwitterScraper::TweetAnalysisPage::Result]) }
      attr_accessor :results

      # Each post without an analysis, by ID & reason. These cost nothing.
      sig { returns(T::Array[XTwitterScraper::TweetAnalysisPage::Unanalyzed]) }
      attr_accessor :unanalyzed

      # Totals of the answers across the analyzed posts.
      sig { returns(XTwitterScraper::TweetAnalysisPage::AnalysisSummary) }
      attr_accessor :analysis_summary

      # Whether the search has more posts. Send next_cursor as cursor.
      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      # Cursor of the search's next page, else empty.
      sig { returns(String) }
      attr_accessor :next_cursor

      # What the topic filter asked & how many posts it kept. Present when you
      # send topic.
      sig { returns(T.nilable(XTwitterScraper::TopicFilterSummary)) }
      attr_reader :topic_filter

      sig do
        params(topic_filter: XTwitterScraper::TopicFilterSummary::OrHash).void
      end
      attr_writer :topic_filter

      # What the image filter asked & how many posts it kept. Present when you
      # send imageShows.
      sig { returns(T.nilable(XTwitterScraper::ImageFilterSummary)) }
      attr_reader :image_filter

      sig do
        params(image_filter: XTwitterScraper::ImageFilterSummary::OrHash).void
      end
      attr_writer :image_filter

      # Analyzed posts, the posts without an analysis & the totals of the answers.
      # Each row in results costs 2 credits.
      sig do
        params(
          results: T::Array[XTwitterScraper::TweetAnalysisPage::Result::OrHash],
          unanalyzed:
            T::Array[XTwitterScraper::TweetAnalysisPage::Unanalyzed::OrHash],
          analysis_summary:
            XTwitterScraper::TweetAnalysisPage::AnalysisSummary::OrHash,
          has_next_page: T::Boolean,
          next_cursor: String,
          topic_filter: XTwitterScraper::TopicFilterSummary::OrHash,
          image_filter: XTwitterScraper::ImageFilterSummary::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Each analyzed post with its answers.
        results:,
        # Each post without an analysis, by ID & reason. These cost nothing.
        unanalyzed:,
        # Totals of the answers across the analyzed posts.
        analysis_summary:,
        # Whether the search has more posts. Send next_cursor as cursor.
        has_next_page:,
        # Cursor of the search's next page, else empty.
        next_cursor:,
        # What the topic filter asked & how many posts it kept. Present when you
        # send topic.
        topic_filter: nil,
        # What the image filter asked & how many posts it kept. Present when you
        # send imageShows.
        image_filter: nil
      )
      end

      sig do
        override.returns(
          {
            results: T::Array[XTwitterScraper::TweetAnalysisPage::Result],
            unanalyzed:
              T::Array[XTwitterScraper::TweetAnalysisPage::Unanalyzed],
            analysis_summary:
              XTwitterScraper::TweetAnalysisPage::AnalysisSummary,
            has_next_page: T::Boolean,
            next_cursor: String,
            topic_filter: XTwitterScraper::TopicFilterSummary,
            image_filter: XTwitterScraper::ImageFilterSummary
          }
        )
      end
      def to_hash
      end

      module AnswerValue
        extend XTwitterScraper::Internal::Type::Union

        Variants = T.type_alias { T.any(String, Float) }

        sig do
          override.returns(
            T::Array[XTwitterScraper::TweetAnalysisPage::AnswerValue::Variants]
          )
        end
        def self.variants
        end
      end

      class Change < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TweetAnalysisPage::Change,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :question_id

        sig { returns(String) }
        attr_accessor :previous

        sig { returns(String) }
        attr_accessor :current

        # 1 changed decision, earlier & now.
        sig do
          params(
            question_id: String,
            previous: String,
            current: String
          ).returns(T.attached_class)
        end
        def self.new(question_id:, previous:, current:)
        end

        sig do
          override.returns(
            { question_id: String, previous: String, current: String }
          )
        end
        def to_hash
        end
      end

      class Result < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TweetAnalysisPage::Result,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The post, as /x/tweets/search returns it. Your own texts have the IDs
        # text:1, text:2 & so on.
        sig { returns(XTwitterScraper::SearchTweet) }
        attr_accessor :tweet

        # The answers in full, with their probabilities.
        sig { returns(XTwitterScraper::TweetAnalysisPage::Result::Analysis) }
        attr_accessor :analysis

        # Each question's decision by question ID. A choice gives its category, a
        # score its level from 0, which can have decimals, & a probability its
        # value from 0 to 1.
        sig do
          returns(
            T::Hash[
              Symbol,
              XTwitterScraper::TweetAnalysisPage::AnswerValue::Variants
            ]
          )
        end
        attr_accessor :answers

        # Hostnames the post links to, without t.co.
        sig { returns(T::Array[String]) }
        attr_accessor :source_domains

        # Cashtags in the post's text, in upper case.
        sig { returns(T::Array[String]) }
        attr_accessor :cashtags

        # Only from /x/analysis/viral-score. How viral the wording reads, or null
        # when a trait has no answer.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :viral_score

        # Only from /x/analysis/viral-score. send_it from 70, edit_first from 40,
        # else sleep_on_it.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::TweetAnalysisPage::Result::ViralVerdict::TaggedSymbol
            )
          )
        end
        attr_accessor :viral_verdict

        # Only from /x/analysis/viral-score. The post's public counts under X's
        # published ranking weights, per 1,000 views or followers.
        sig { returns(T.nilable(Float)) }
        attr_accessor :viral_algorithm_score

        # Only from /x/analysis/viral-score. log10 of 1 plus the weighted
        # engagement per 1,000 followers. Null without a follower count.
        sig { returns(T.nilable(Float)) }
        attr_accessor :viral_actual_engagement_rate

        # Only from /x/analysis/viral-score. The score with its weights version,
        # the caps that applied & the engagement comparison.
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :viral

        sig { params(viral: T::Hash[Symbol, T.anything]).void }
        attr_writer :viral

        # How the post's answers compare with its row in baseline, as the AI
        # Actors compare a run with an earlier dataset.
        sig { returns(XTwitterScraper::TweetAnalysisPage::Result::Monitor) }
        attr_accessor :monitor

        # 1 analyzed post with its answers.
        sig do
          params(
            tweet: XTwitterScraper::SearchTweet::OrHash,
            analysis:
              XTwitterScraper::TweetAnalysisPage::Result::Analysis::OrHash,
            answers:
              T::Hash[
                Symbol,
                XTwitterScraper::TweetAnalysisPage::AnswerValue::Variants
              ],
            source_domains: T::Array[String],
            cashtags: T::Array[String],
            monitor:
              XTwitterScraper::TweetAnalysisPage::Result::Monitor::OrHash,
            viral_score: T.nilable(Integer),
            viral_verdict:
              T.nilable(
                XTwitterScraper::TweetAnalysisPage::Result::ViralVerdict::OrSymbol
              ),
            viral_algorithm_score: T.nilable(Float),
            viral_actual_engagement_rate: T.nilable(Float),
            viral: T::Hash[Symbol, T.anything]
          ).returns(T.attached_class)
        end
        def self.new(
          # The post, as /x/tweets/search returns it. Your own texts have the IDs
          # text:1, text:2 & so on.
          tweet:,
          # The answers in full, with their probabilities.
          analysis:,
          # Each question's decision by question ID. A choice gives its category,
          # a score its level from 0, which can have decimals, & a probability its
          # value from 0 to 1.
          answers:,
          # Hostnames the post links to, without t.co.
          source_domains:,
          # Cashtags in the post's text, in upper case.
          cashtags:,
          # How the post's answers compare with its row in baseline, as the AI
          # Actors compare a run with an earlier dataset.
          monitor:,
          # Only from /x/analysis/viral-score. How viral the wording reads, or
          # null when a trait has no answer.
          viral_score: nil,
          # Only from /x/analysis/viral-score. send_it from 70, edit_first from
          # 40, else sleep_on_it.
          viral_verdict: nil,
          # Only from /x/analysis/viral-score. The post's public counts under X's
          # published ranking weights, per 1,000 views or followers.
          viral_algorithm_score: nil,
          # Only from /x/analysis/viral-score. log10 of 1 plus the weighted
          # engagement per 1,000 followers. Null without a follower count.
          viral_actual_engagement_rate: nil,
          # Only from /x/analysis/viral-score. The score with its weights version,
          # the caps that applied & the engagement comparison.
          viral: nil
        )
        end

        sig do
          override.returns(
            {
              tweet: XTwitterScraper::SearchTweet,
              analysis: XTwitterScraper::TweetAnalysisPage::Result::Analysis,
              answers:
                T::Hash[
                  Symbol,
                  XTwitterScraper::TweetAnalysisPage::AnswerValue::Variants
                ],
              source_domains: T::Array[String],
              cashtags: T::Array[String],
              viral_score: T.nilable(Integer),
              viral_verdict:
                T.nilable(
                  XTwitterScraper::TweetAnalysisPage::Result::ViralVerdict::TaggedSymbol
                ),
              viral_algorithm_score: T.nilable(Float),
              viral_actual_engagement_rate: T.nilable(Float),
              viral: T::Hash[Symbol, T.anything],
              monitor: XTwitterScraper::TweetAnalysisPage::Result::Monitor
            }
          )
        end
        def to_hash
        end

        class Analysis < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::TweetAnalysisPage::Result::Analysis,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :status

          # 1 answer per question, in question order.
          sig do
            returns(
              T::Array[
                XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer
              ]
            )
          end
          attr_accessor :answers

          # The ID & version of each question asked.
          sig do
            returns(
              T::Array[
                XTwitterScraper::TweetAnalysisPage::Result::Analysis::Question
              ]
            )
          end
          attr_accessor :questions

          # Bytes of post & settings the AI read.
          sig { returns(Integer) }
          attr_accessor :context_bytes

          # What the AI read beside the post's text.
          sig do
            returns(
              XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability
            )
          end
          attr_accessor :context_availability

          # The answers in full, with their probabilities.
          sig do
            params(
              answers:
                T::Array[
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer::OrHash
                ],
              questions:
                T::Array[
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::Question::OrHash
                ],
              context_bytes: Integer,
              context_availability:
                XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::OrHash,
              status: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # 1 answer per question, in question order.
            answers:,
            # The ID & version of each question asked.
            questions:,
            # Bytes of post & settings the AI read.
            context_bytes:,
            # What the AI read beside the post's text.
            context_availability:,
            status: :succeeded
          )
          end

          sig do
            override.returns(
              {
                status: Symbol,
                answers:
                  T::Array[
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer
                  ],
                questions:
                  T::Array[
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::Question
                  ],
                context_bytes: Integer,
                context_availability:
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability
              }
            )
          end
          def to_hash
          end

          class Answer < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :question_id

            sig { returns(String) }
            attr_accessor :question_version

            sig do
              returns(
                XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            # The chosen category, or the level from 0, which can have decimals,
            # such as 1.4 between levels 1 & 2.
            sig do
              returns(
                T.nilable(
                  XTwitterScraper::TweetAnalysisPage::AnswerValue::Variants
                )
              )
            end
            attr_reader :value

            sig do
              params(
                value: XTwitterScraper::TweetAnalysisPage::AnswerValue::Variants
              ).void
            end
            attr_writer :value

            sig { returns(T.nilable(Float)) }
            attr_reader :confidence

            sig { params(confidence: Float).void }
            attr_writer :confidence

            # Probability of each category, or of each level by index.
            sig { returns(T.nilable(T::Hash[Symbol, Float])) }
            attr_reader :probabilities

            sig { params(probabilities: T::Hash[Symbol, Float]).void }
            attr_writer :probabilities

            # For a score. The levels the question named, from 0.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :levels

            sig { params(levels: T::Array[String]).void }
            attr_writer :levels

            # For a probability. The chance the answer is yes.
            sig { returns(T.nilable(Float)) }
            attr_reader :probability

            sig { params(probability: Float).void }
            attr_writer :probability

            # 1 question's answer. A probability has probability. A choice or
            # score has value, confidence & the probability of each category or
            # level.
            sig do
              params(
                question_id: String,
                question_version: String,
                type:
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer::Type::OrSymbol,
                value:
                  XTwitterScraper::TweetAnalysisPage::AnswerValue::Variants,
                confidence: Float,
                probabilities: T::Hash[Symbol, Float],
                levels: T::Array[String],
                probability: Float
              ).returns(T.attached_class)
            end
            def self.new(
              question_id:,
              question_version:,
              type:,
              # The chosen category, or the level from 0, which can have decimals,
              # such as 1.4 between levels 1 & 2.
              value: nil,
              confidence: nil,
              # Probability of each category, or of each level by index.
              probabilities: nil,
              # For a score. The levels the question named, from 0.
              levels: nil,
              # For a probability. The chance the answer is yes.
              probability: nil
            )
            end

            sig do
              override.returns(
                {
                  question_id: String,
                  question_version: String,
                  type:
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer::Type::TaggedSymbol,
                  value:
                    XTwitterScraper::TweetAnalysisPage::AnswerValue::Variants,
                  confidence: Float,
                  probabilities: T::Hash[Symbol, Float],
                  levels: T::Array[String],
                  probability: Float
                }
              )
            end
            def to_hash
            end

            module Type
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              CHOICE =
                T.let(
                  :choice,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer::Type::TaggedSymbol
                )
              SCORE =
                T.let(
                  :score,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer::Type::TaggedSymbol
                )
              PROBABILITY =
                T.let(
                  :probability,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::Answer::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Question < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::Question,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :id

            sig { returns(String) }
            attr_accessor :version

            sig do
              params(id: String, version: String).returns(T.attached_class)
            end
            def self.new(id:, version:)
            end

            sig { override.returns({ id: String, version: String }) }
            def to_hash
            end
          end

          class ContextAvailability < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig do
              returns(
                XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Quote::TaggedSymbol
              )
            end
            attr_accessor :quote

            sig do
              returns(
                XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Reply::TaggedSymbol
              )
            end
            attr_accessor :reply

            sig do
              returns(
                XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Author::TaggedSymbol
              )
            end
            attr_accessor :author

            # images when the AI read the post's images. text_descriptions_only
            # when it read only their alt text.
            sig do
              returns(
                XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Media::TaggedSymbol
              )
            end
            attr_accessor :media

            sig do
              returns(
                XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Article::TaggedSymbol
              )
            end
            attr_accessor :article

            # truncated when the post was cut to fit.
            sig do
              returns(
                XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::PostText::TaggedSymbol
              )
            end
            attr_accessor :post_text

            # What the AI read beside the post's text.
            sig do
              params(
                quote:
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Quote::OrSymbol,
                reply:
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Reply::OrSymbol,
                author:
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Author::OrSymbol,
                media:
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Media::OrSymbol,
                article:
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Article::OrSymbol,
                post_text:
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::PostText::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              quote:,
              reply:,
              author:,
              # images when the AI read the post's images. text_descriptions_only
              # when it read only their alt text.
              media:,
              article:,
              # truncated when the post was cut to fit.
              post_text:
            )
            end

            sig do
              override.returns(
                {
                  quote:
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Quote::TaggedSymbol,
                  reply:
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Reply::TaggedSymbol,
                  author:
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Author::TaggedSymbol,
                  media:
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Media::TaggedSymbol,
                  article:
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Article::TaggedSymbol,
                  post_text:
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::PostText::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            module Quote
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Quote
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AVAILABLE =
                T.let(
                  :available,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Quote::TaggedSymbol
                )
              MISSING =
                T.let(
                  :missing,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Quote::TaggedSymbol
                )
              NOT_APPLICABLE =
                T.let(
                  :not_applicable,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Quote::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Quote::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module Reply
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Reply
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AVAILABLE =
                T.let(
                  :available,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Reply::TaggedSymbol
                )
              MISSING =
                T.let(
                  :missing,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Reply::TaggedSymbol
                )
              NOT_APPLICABLE =
                T.let(
                  :not_applicable,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Reply::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Reply::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module Author
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Author
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AVAILABLE =
                T.let(
                  :available,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Author::TaggedSymbol
                )
              MISSING =
                T.let(
                  :missing,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Author::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Author::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module Media
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Media
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              TEXT_DESCRIPTIONS_ONLY =
                T.let(
                  :text_descriptions_only,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Media::TaggedSymbol
                )
              NOT_SUPPLIED =
                T.let(
                  :not_supplied,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Media::TaggedSymbol
                )
              IMAGES =
                T.let(
                  :images,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Media::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Media::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module Article
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Article
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              NOT_SUPPLIED =
                T.let(
                  :not_supplied,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Article::TaggedSymbol
                )
              TEXT_BLOCKS =
                T.let(
                  :text_blocks,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Article::TaggedSymbol
                )
              SUMMARY =
                T.let(
                  :summary,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Article::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::Article::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module PostText
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::PostText
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FULL =
                T.let(
                  :full,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::PostText::TaggedSymbol
                )
              TRUNCATED =
                T.let(
                  :truncated,
                  XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::PostText::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::TweetAnalysisPage::Result::Analysis::ContextAvailability::PostText::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        module ViralVerdict
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::TweetAnalysisPage::Result::ViralVerdict
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SEND_IT =
            T.let(
              :send_it,
              XTwitterScraper::TweetAnalysisPage::Result::ViralVerdict::TaggedSymbol
            )
          EDIT_FIRST =
            T.let(
              :edit_first,
              XTwitterScraper::TweetAnalysisPage::Result::ViralVerdict::TaggedSymbol
            )
          SLEEP_ON_IT =
            T.let(
              :sleep_on_it,
              XTwitterScraper::TweetAnalysisPage::Result::ViralVerdict::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::TweetAnalysisPage::Result::ViralVerdict::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Monitor < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::TweetAnalysisPage::Result::Monitor,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Hash of the questions, targets & context. Rows with another hash are
          # not_comparable.
          sig { returns(String) }
          attr_accessor :configuration_fingerprint

          # Always null. The baseline is the rows you sent.
          sig { returns(NilClass) }
          attr_accessor :baseline_dataset_id

          # first_run without baseline. new_to_baseline for a post baseline lacks.
          # changed when an answer clearly left its earlier decision.
          # not_comparable when other settings made the earlier row or it answers
          # none of these questions.
          sig do
            returns(
              XTwitterScraper::TweetAnalysisPage::Result::Monitor::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          # IDs of the questions whose decision changed.
          sig { returns(T::Array[String]) }
          attr_accessor :changed_question_ids

          # Each changed decision, earlier & now.
          sig { returns(T::Array[XTwitterScraper::TweetAnalysisPage::Change]) }
          attr_accessor :changes

          # How the post's answers compare with its row in baseline, as the AI
          # Actors compare a run with an earlier dataset.
          sig do
            params(
              configuration_fingerprint: String,
              baseline_dataset_id: NilClass,
              status:
                XTwitterScraper::TweetAnalysisPage::Result::Monitor::Status::OrSymbol,
              changed_question_ids: T::Array[String],
              changes:
                T::Array[XTwitterScraper::TweetAnalysisPage::Change::OrHash]
            ).returns(T.attached_class)
          end
          def self.new(
            # Hash of the questions, targets & context. Rows with another hash are
            # not_comparable.
            configuration_fingerprint:,
            # Always null. The baseline is the rows you sent.
            baseline_dataset_id:,
            # first_run without baseline. new_to_baseline for a post baseline
            # lacks. changed when an answer clearly left its earlier decision.
            # not_comparable when other settings made the earlier row or it
            # answers none of these questions.
            status:,
            # IDs of the questions whose decision changed.
            changed_question_ids:,
            # Each changed decision, earlier & now.
            changes:
          )
          end

          sig do
            override.returns(
              {
                configuration_fingerprint: String,
                baseline_dataset_id: NilClass,
                status:
                  XTwitterScraper::TweetAnalysisPage::Result::Monitor::Status::TaggedSymbol,
                changed_question_ids: T::Array[String],
                changes: T::Array[XTwitterScraper::TweetAnalysisPage::Change]
              }
            )
          end
          def to_hash
          end

          module Status
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::TweetAnalysisPage::Result::Monitor::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            NOT_COMPARABLE =
              T.let(
                :not_comparable,
                XTwitterScraper::TweetAnalysisPage::Result::Monitor::Status::TaggedSymbol
              )
            ANALYSIS_UNAVAILABLE =
              T.let(
                :analysis_unavailable,
                XTwitterScraper::TweetAnalysisPage::Result::Monitor::Status::TaggedSymbol
              )
            FIRST_RUN =
              T.let(
                :first_run,
                XTwitterScraper::TweetAnalysisPage::Result::Monitor::Status::TaggedSymbol
              )
            NEW_TO_BASELINE =
              T.let(
                :new_to_baseline,
                XTwitterScraper::TweetAnalysisPage::Result::Monitor::Status::TaggedSymbol
              )
            UNCHANGED =
              T.let(
                :unchanged,
                XTwitterScraper::TweetAnalysisPage::Result::Monitor::Status::TaggedSymbol
              )
            CHANGED =
              T.let(
                :changed,
                XTwitterScraper::TweetAnalysisPage::Result::Monitor::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::TweetAnalysisPage::Result::Monitor::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class Unanalyzed < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TweetAnalysisPage::Unanalyzed,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Post ID. Your own texts have the IDs text:1, text:2 & so on.
        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            XTwitterScraper::TweetAnalysisPage::Unanalyzed::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # post_unavailable when X returns no such post. missing_text for a post
        # without text. insufficient_credits when credits ran out. context_limit
        # when the settings leave the post no room. The other reasons mean the
        # analysis failed. Send the post again.
        sig { returns(String) }
        attr_accessor :reason

        # A post without an analysis. It costs nothing.
        sig do
          params(
            id: String,
            status:
              XTwitterScraper::TweetAnalysisPage::Unanalyzed::Status::OrSymbol,
            reason: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Post ID. Your own texts have the IDs text:1, text:2 & so on.
          id:,
          status:,
          # post_unavailable when X returns no such post. missing_text for a post
          # without text. insufficient_credits when credits ran out. context_limit
          # when the settings leave the post no room. The other reasons mean the
          # analysis failed. Send the post again.
          reason:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              status:
                XTwitterScraper::TweetAnalysisPage::Unanalyzed::Status::TaggedSymbol,
              reason: String
            }
          )
        end
        def to_hash
        end

        module Status
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::TweetAnalysisPage::Unanalyzed::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAILED =
            T.let(
              :failed,
              XTwitterScraper::TweetAnalysisPage::Unanalyzed::Status::TaggedSymbol
            )
          SKIPPED =
            T.let(
              :skipped,
              XTwitterScraper::TweetAnalysisPage::Unanalyzed::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::TweetAnalysisPage::Unanalyzed::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class AnalysisSummary < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TweetAnalysisPage::AnalysisSummary,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :schema_version

        # Posts by analysis outcome.
        sig do
          returns(XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Rows)
        end
        attr_accessor :rows

        # Likes, reposts, replies & quotes of the analyzed posts.
        sig { returns(Integer) }
        attr_accessor :engagement

        # Totals by question ID. A choice has counts, shares, engagementShares &
        # top posts per category. A score has mean, engagementWeightedMean &
        # levels. A probability has mean, yes & no.
        sig { returns(T::Hash[Symbol, T::Hash[Symbol, T.anything]]) }
        attr_accessor :questions

        # Mentions & answers per target in analysis.targets.
        sig do
          returns(
            T::Array[
              XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Target
            ]
          )
        end
        attr_accessor :targets

        # Posts & answers per cashtag, most posts first, up to 20. signal is
        # present for the market questions.
        sig do
          returns(
            T::Array[
              XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Cashtag
            ]
          )
        end
        attr_accessor :cashtags

        # Posts per linked hostname, most posts first, up to 20.
        sig do
          returns(
            T::Array[
              XTwitterScraper::TweetAnalysisPage::AnalysisSummary::SourceDomain
            ]
          )
        end
        attr_accessor :source_domains

        # Only from /x/analysis/viral-score. Scored posts, the average score,
        # verdict counts, the scores against actual engagement, a report per
        # author & the leaderboards.
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :viral

        sig { params(viral: T::Hash[Symbol, T.anything]).void }
        attr_writer :viral

        # Posts per comparison status, & up to 50 changed posts with their
        # changes. Null when the answer holds no post.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Monitor
            )
          )
        end
        attr_accessor :monitor

        # Totals of the answers across the analyzed posts.
        sig do
          params(
            schema_version: Integer,
            rows:
              XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Rows::OrHash,
            engagement: Integer,
            questions: T::Hash[Symbol, T::Hash[Symbol, T.anything]],
            targets:
              T::Array[
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Target::OrHash
              ],
            cashtags:
              T::Array[
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Cashtag::OrHash
              ],
            source_domains:
              T::Array[
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::SourceDomain::OrHash
              ],
            monitor:
              T.nilable(
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Monitor::OrHash
              ),
            viral: T::Hash[Symbol, T.anything]
          ).returns(T.attached_class)
        end
        def self.new(
          schema_version:,
          # Posts by analysis outcome.
          rows:,
          # Likes, reposts, replies & quotes of the analyzed posts.
          engagement:,
          # Totals by question ID. A choice has counts, shares, engagementShares &
          # top posts per category. A score has mean, engagementWeightedMean &
          # levels. A probability has mean, yes & no.
          questions:,
          # Mentions & answers per target in analysis.targets.
          targets:,
          # Posts & answers per cashtag, most posts first, up to 20. signal is
          # present for the market questions.
          cashtags:,
          # Posts per linked hostname, most posts first, up to 20.
          source_domains:,
          # Posts per comparison status, & up to 50 changed posts with their
          # changes. Null when the answer holds no post.
          monitor:,
          # Only from /x/analysis/viral-score. Scored posts, the average score,
          # verdict counts, the scores against actual engagement, a report per
          # author & the leaderboards.
          viral: nil
        )
        end

        sig do
          override.returns(
            {
              schema_version: Integer,
              rows: XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Rows,
              engagement: Integer,
              questions: T::Hash[Symbol, T::Hash[Symbol, T.anything]],
              targets:
                T::Array[
                  XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Target
                ],
              cashtags:
                T::Array[
                  XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Cashtag
                ],
              source_domains:
                T::Array[
                  XTwitterScraper::TweetAnalysisPage::AnalysisSummary::SourceDomain
                ],
              viral: T::Hash[Symbol, T.anything],
              monitor:
                T.nilable(
                  XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Monitor
                )
            }
          )
        end
        def to_hash
        end

        class Rows < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Rows,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(Integer) }
          attr_accessor :analyzed

          sig { returns(Integer) }
          attr_accessor :failed

          sig { returns(Integer) }
          attr_accessor :skipped

          # Posts by analysis outcome.
          sig do
            params(
              analyzed: Integer,
              failed: Integer,
              skipped: Integer
            ).returns(T.attached_class)
          end
          def self.new(analyzed:, failed:, skipped:)
          end

          sig do
            override.returns(
              { analyzed: Integer, failed: Integer, skipped: Integer }
            )
          end
          def to_hash
          end
        end

        class Target < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Target,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :name

          sig { returns(Integer) }
          attr_accessor :mentions

          sig { returns(Float) }
          attr_accessor :share

          sig { returns(Integer) }
          attr_accessor :engagement

          # Category counts by question ID.
          sig { returns(T::Hash[Symbol, T.anything]) }
          attr_accessor :choices

          # The most engaged posts per question ID & category.
          sig { returns(T::Hash[Symbol, T.anything]) }
          attr_accessor :top

          sig do
            params(
              name: String,
              mentions: Integer,
              share: Float,
              engagement: Integer,
              choices: T::Hash[Symbol, T.anything],
              top: T::Hash[Symbol, T.anything]
            ).returns(T.attached_class)
          end
          def self.new(
            name:,
            mentions:,
            share:,
            engagement:,
            # Category counts by question ID.
            choices:,
            # The most engaged posts per question ID & category.
            top:
          )
          end

          sig do
            override.returns(
              {
                name: String,
                mentions: Integer,
                share: Float,
                engagement: Integer,
                choices: T::Hash[Symbol, T.anything],
                top: T::Hash[Symbol, T.anything]
              }
            )
          end
          def to_hash
          end
        end

        class Cashtag < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Cashtag,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :cashtag

          sig { returns(Integer) }
          attr_accessor :rows

          # Category counts of the cashtag's posts by question ID.
          sig { returns(T::Hash[Symbol, T.anything]) }
          attr_accessor :choices

          sig do
            returns(
              T.nilable(
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Cashtag::Signal
              )
            )
          end
          attr_reader :signal

          sig do
            params(
              signal:
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Cashtag::Signal::OrHash
            ).void
          end
          attr_writer :signal

          sig do
            params(
              cashtag: String,
              rows: Integer,
              choices: T::Hash[Symbol, T.anything],
              signal:
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Cashtag::Signal::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            cashtag:,
            rows:,
            # Category counts of the cashtag's posts by question ID.
            choices:,
            signal: nil
          )
          end

          sig do
            override.returns(
              {
                cashtag: String,
                rows: Integer,
                choices: T::Hash[Symbol, T.anything],
                signal:
                  XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Cashtag::Signal
              }
            )
          end
          def to_hash
          end

          class Signal < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Cashtag::Signal,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(Integer) }
            attr_accessor :bullish

            sig { returns(Integer) }
            attr_accessor :bearish

            # Bullish minus bearish posts, over all posts.
            sig { returns(Float) }
            attr_accessor :score

            sig do
              params(bullish: Integer, bearish: Integer, score: Float).returns(
                T.attached_class
              )
            end
            def self.new(
              bullish:,
              bearish:,
              # Bullish minus bearish posts, over all posts.
              score:
            )
            end

            sig do
              override.returns(
                { bullish: Integer, bearish: Integer, score: Float }
              )
            end
            def to_hash
            end
          end
        end

        class SourceDomain < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::SourceDomain,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :domain

          sig { returns(Integer) }
          attr_accessor :posts

          sig do
            params(domain: String, posts: Integer).returns(T.attached_class)
          end
          def self.new(domain:, posts:)
          end

          sig { override.returns({ domain: String, posts: Integer }) }
          def to_hash
          end
        end

        class Monitor < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Monitor,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Posts per monitor status.
          sig { returns(T::Hash[Symbol, Integer]) }
          attr_accessor :statuses

          sig do
            returns(
              T::Array[
                XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Monitor::ChangedRow
              ]
            )
          end
          attr_accessor :changed_rows

          # Posts per comparison status, & up to 50 changed posts with their
          # changes. Null when the answer holds no post.
          sig do
            params(
              statuses: T::Hash[Symbol, Integer],
              changed_rows:
                T::Array[
                  XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Monitor::ChangedRow::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Posts per monitor status.
            statuses:,
            changed_rows:
          )
          end

          sig do
            override.returns(
              {
                statuses: T::Hash[Symbol, Integer],
                changed_rows:
                  T::Array[
                    XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Monitor::ChangedRow
                  ]
              }
            )
          end
          def to_hash
          end

          class ChangedRow < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::TweetAnalysisPage::AnalysisSummary::Monitor::ChangedRow,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :tweet_id

            sig do
              returns(T::Array[XTwitterScraper::TweetAnalysisPage::Change])
            end
            attr_accessor :changes

            sig do
              params(
                tweet_id: String,
                changes:
                  T::Array[XTwitterScraper::TweetAnalysisPage::Change::OrHash]
              ).returns(T.attached_class)
            end
            def self.new(tweet_id:, changes:)
            end

            sig do
              override.returns(
                {
                  tweet_id: String,
                  changes: T::Array[XTwitterScraper::TweetAnalysisPage::Change]
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
