# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ExtractionJob < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::ExtractionJob,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(XTwitterScraper::ExtractionJob::Status::TaggedSymbol) }
      attr_accessor :status

      # Identifier for the extraction tool used to run a job.
      sig { returns(XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol) }
      attr_accessor :tool_type

      sig { returns(Integer) }
      attr_accessor :total_results

      # Dashboard page where a signed-in user follows this job & downloads its rows as
      # CSV, XLSX, JSON, Markdown, PDF or text.
      sig { returns(String) }
      attr_accessor :url

      sig { returns(T.nilable(Time)) }
      attr_reader :completed_at

      sig { params(completed_at: Time).void }
      attr_writer :completed_at

      # Why a terminal job stopped. `requested_limit_reached` means the job returned the
      # number of results you asked for. `source_exhausted` means the read reached its
      # end before your limit. A search can reach its end with only part of its matches.
      # Wide date windows return fewer posts than narrow ones over the same dates. For a
      # fuller collection, run the same search in shorter windows.
      # `pagination_safety_limit` means a paging safety rule ended the read early. The
      # job keeps every result it found. `deadline_reached` means the job ran out of
      # time. `partial_failure` means some reads failed, and the job keeps the results
      # from the rest. `budget_limited` means your credits covered fewer results than
      # the job found. `canceled` and `failed` match the job status.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::ExtractionJob::CompletionReason::TaggedSymbol
          )
        )
      end
      attr_reader :completion_reason

      sig do
        params(
          completion_reason:
            XTwitterScraper::ExtractionJob::CompletionReason::OrSymbol
        ).void
      end
      attr_writer :completion_reason

      # Result limit after affordability checks.
      sig { returns(T.nilable(Integer)) }
      attr_reader :effective_results_limit

      sig { params(effective_results_limit: Integer).void }
      attr_writer :effective_results_limit

      # Safe error code for a failed job.
      sig { returns(T.nilable(String)) }
      attr_reader :error_message

      sig { params(error_message: String).void }
      attr_writer :error_message

      sig { returns(T.nilable(XTwitterScraper::ImageFilterSummary)) }
      attr_reader :image_filter

      sig do
        params(image_filter: XTwitterScraper::ImageFilterSummary::OrHash).void
      end
      attr_writer :image_filter

      # Requested result limit.
      sig { returns(T.nilable(Integer)) }
      attr_reader :results_limit

      sig { params(results_limit: Integer).void }
      attr_writer :results_limit

      sig { returns(T.nilable(XTwitterScraper::ExtractionJob::TopicFilter)) }
      attr_reader :topic_filter

      sig do
        params(
          topic_filter: XTwitterScraper::ExtractionJob::TopicFilter::OrHash
        ).void
      end
      attr_writer :topic_filter

      # Extraction job tracking status, tool type, and result count.
      sig do
        params(
          id: String,
          created_at: Time,
          status: XTwitterScraper::ExtractionJob::Status::OrSymbol,
          tool_type: XTwitterScraper::ExtractionJob::ToolType::OrSymbol,
          total_results: Integer,
          url: String,
          completed_at: Time,
          completion_reason:
            XTwitterScraper::ExtractionJob::CompletionReason::OrSymbol,
          effective_results_limit: Integer,
          error_message: String,
          image_filter: XTwitterScraper::ImageFilterSummary::OrHash,
          results_limit: Integer,
          topic_filter: XTwitterScraper::ExtractionJob::TopicFilter::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        status:,
        # Identifier for the extraction tool used to run a job.
        tool_type:,
        total_results:,
        # Dashboard page where a signed-in user follows this job & downloads its rows as
        # CSV, XLSX, JSON, Markdown, PDF or text.
        url:,
        completed_at: nil,
        # Why a terminal job stopped. `requested_limit_reached` means the job returned the
        # number of results you asked for. `source_exhausted` means the read reached its
        # end before your limit. A search can reach its end with only part of its matches.
        # Wide date windows return fewer posts than narrow ones over the same dates. For a
        # fuller collection, run the same search in shorter windows.
        # `pagination_safety_limit` means a paging safety rule ended the read early. The
        # job keeps every result it found. `deadline_reached` means the job ran out of
        # time. `partial_failure` means some reads failed, and the job keeps the results
        # from the rest. `budget_limited` means your credits covered fewer results than
        # the job found. `canceled` and `failed` match the job status.
        completion_reason: nil,
        # Result limit after affordability checks.
        effective_results_limit: nil,
        # Safe error code for a failed job.
        error_message: nil,
        image_filter: nil,
        # Requested result limit.
        results_limit: nil,
        topic_filter: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            status: XTwitterScraper::ExtractionJob::Status::TaggedSymbol,
            tool_type: XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol,
            total_results: Integer,
            url: String,
            completed_at: Time,
            completion_reason:
              XTwitterScraper::ExtractionJob::CompletionReason::TaggedSymbol,
            effective_results_limit: Integer,
            error_message: String,
            image_filter: XTwitterScraper::ImageFilterSummary,
            results_limit: Integer,
            topic_filter: XTwitterScraper::ExtractionJob::TopicFilter
          }
        )
      end
      def to_hash
      end

      module Status
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::ExtractionJob::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RUNNING =
          T.let(:running, XTwitterScraper::ExtractionJob::Status::TaggedSymbol)
        COMPLETED =
          T.let(
            :completed,
            XTwitterScraper::ExtractionJob::Status::TaggedSymbol
          )
        FAILED =
          T.let(:failed, XTwitterScraper::ExtractionJob::Status::TaggedSymbol)
        PENDING =
          T.let(:pending, XTwitterScraper::ExtractionJob::Status::TaggedSymbol)
        CANCELED =
          T.let(:canceled, XTwitterScraper::ExtractionJob::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[XTwitterScraper::ExtractionJob::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Identifier for the extraction tool used to run a job.
      module ToolType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionJob::ToolType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ARTICLE_EXTRACTOR =
          T.let(
            :article_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        COMMUNITY_EXTRACTOR =
          T.let(
            :community_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        COMMUNITY_MODERATOR_EXPLORER =
          T.let(
            :community_moderator_explorer,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        COMMUNITY_POST_EXTRACTOR =
          T.let(
            :community_post_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        COMMUNITY_SEARCH =
          T.let(
            :community_search,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        FAVORITERS =
          T.let(
            :favoriters,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        FOLLOWER_EXPLORER =
          T.let(
            :follower_explorer,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        FOLLOWING_EXPLORER =
          T.let(
            :following_explorer,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        LIST_FOLLOWER_EXPLORER =
          T.let(
            :list_follower_explorer,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        LIST_MEMBER_EXTRACTOR =
          T.let(
            :list_member_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        LIST_POST_EXTRACTOR =
          T.let(
            :list_post_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        MENTION_EXTRACTOR =
          T.let(
            :mention_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        PEOPLE_SEARCH =
          T.let(
            :people_search,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        POST_EXTRACTOR =
          T.let(
            :post_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        QUOTE_EXTRACTOR =
          T.let(
            :quote_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        REPLY_EXTRACTOR =
          T.let(
            :reply_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        REPOST_EXTRACTOR =
          T.let(
            :repost_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        SPACE_EXPLORER =
          T.let(
            :space_explorer,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        THREAD_EXTRACTOR =
          T.let(
            :thread_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        TWEET_SEARCH_EXTRACTOR =
          T.let(
            :tweet_search_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        USER_AFFILIATES =
          T.let(
            :user_affiliates,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        USER_LIKES =
          T.let(
            :user_likes,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        USER_MEDIA =
          T.let(
            :user_media,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        VERIFIED_FOLLOWER_EXPLORER =
          T.let(
            :verified_follower_explorer,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Why a terminal job stopped. `requested_limit_reached` means the job returned the
      # number of results you asked for. `source_exhausted` means the read reached its
      # end before your limit. A search can reach its end with only part of its matches.
      # Wide date windows return fewer posts than narrow ones over the same dates. For a
      # fuller collection, run the same search in shorter windows.
      # `pagination_safety_limit` means a paging safety rule ended the read early. The
      # job keeps every result it found. `deadline_reached` means the job ran out of
      # time. `partial_failure` means some reads failed, and the job keeps the results
      # from the rest. `budget_limited` means your credits covered fewer results than
      # the job found. `canceled` and `failed` match the job status.
      module CompletionReason
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionJob::CompletionReason)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BUDGET_LIMITED =
          T.let(
            :budget_limited,
            XTwitterScraper::ExtractionJob::CompletionReason::TaggedSymbol
          )
        CANCELED =
          T.let(
            :canceled,
            XTwitterScraper::ExtractionJob::CompletionReason::TaggedSymbol
          )
        DEADLINE_REACHED =
          T.let(
            :deadline_reached,
            XTwitterScraper::ExtractionJob::CompletionReason::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            XTwitterScraper::ExtractionJob::CompletionReason::TaggedSymbol
          )
        PAGINATION_SAFETY_LIMIT =
          T.let(
            :pagination_safety_limit,
            XTwitterScraper::ExtractionJob::CompletionReason::TaggedSymbol
          )
        PARTIAL_FAILURE =
          T.let(
            :partial_failure,
            XTwitterScraper::ExtractionJob::CompletionReason::TaggedSymbol
          )
        REQUESTED_LIMIT_REACHED =
          T.let(
            :requested_limit_reached,
            XTwitterScraper::ExtractionJob::CompletionReason::TaggedSymbol
          )
        SOURCE_EXHAUSTED =
          T.let(
            :source_exhausted,
            XTwitterScraper::ExtractionJob::CompletionReason::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionJob::CompletionReason::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class TopicFilter < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::ExtractionJob::TopicFilter,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The topic you sent.
        sig { returns(String) }
        attr_accessor :topic

        # The question asked of each post.
        sig { returns(String) }
        attr_accessor :question

        # The lowest topicScore a kept post has.
        sig { returns(Float) }
        attr_accessor :cutoff

        # Posts checked. Only kept posts are billed.
        sig { returns(Integer) }
        attr_accessor :checked

        # Posts about the topic, all returned & billed at 2 credits each.
        sig { returns(Integer) }
        attr_accessor :kept

        # Posts the check couldn't answer. They aren't billed or returned.
        sig do
          returns(
            T::Array[XTwitterScraper::ExtractionJob::TopicFilter::Unchecked]
          )
        end
        attr_accessor :unchecked

        # What the topic filter asked & how many posts it kept.
        sig do
          params(
            topic: String,
            question: String,
            cutoff: Float,
            checked: Integer,
            kept: Integer,
            unchecked:
              T::Array[
                XTwitterScraper::ExtractionJob::TopicFilter::Unchecked::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # The topic you sent.
          topic:,
          # The question asked of each post.
          question:,
          # The lowest topicScore a kept post has.
          cutoff:,
          # Posts checked. Only kept posts are billed.
          checked:,
          # Posts about the topic, all returned & billed at 2 credits each.
          kept:,
          # Posts the check couldn't answer. They aren't billed or returned.
          unchecked:
        )
        end

        sig do
          override.returns(
            {
              topic: String,
              question: String,
              cutoff: Float,
              checked: Integer,
              kept: Integer,
              unchecked:
                T::Array[XTwitterScraper::ExtractionJob::TopicFilter::Unchecked]
            }
          )
        end
        def to_hash
        end

        class Unchecked < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::ExtractionJob::TopicFilter::Unchecked,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :reason

          sig { params(id: String, reason: String).returns(T.attached_class) }
          def self.new(id:, reason:)
          end

          sig { override.returns({ id: String, reason: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
