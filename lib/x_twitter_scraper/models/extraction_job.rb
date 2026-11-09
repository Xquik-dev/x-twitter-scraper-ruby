# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class ExtractionJob < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute status
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionJob::Status]
      required :status, enum: -> { XTwitterScraper::ExtractionJob::Status }

      # @!attribute tool_type
      #   Identifier for the extraction tool used to run a job.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionJob::ToolType]
      required :tool_type, enum: -> { XTwitterScraper::ExtractionJob::ToolType }, api_name: :toolType

      # @!attribute total_results
      #
      #   @return [Integer]
      required :total_results, Integer, api_name: :totalResults

      # @!attribute url
      #   Dashboard page where a signed-in user follows this job & downloads its rows as
      #   CSV, XLSX, JSON, Markdown, PDF or text.
      #
      #   @return [String]
      required :url, String

      # @!attribute completed_at
      #
      #   @return [Time, nil]
      optional :completed_at, Time, api_name: :completedAt

      # @!attribute completion_reason
      #   Why a terminal job stopped. `requested_limit_reached` means the job returned the
      #   number of results you asked for. `source_exhausted` means the read reached its
      #   end before your limit. A search can reach its end with only part of its matches.
      #   Wide date windows return fewer posts than narrow ones over the same dates. For a
      #   fuller collection, run the same search in shorter windows.
      #   `pagination_safety_limit` means a paging safety rule ended the read early. The
      #   job keeps every result it found. `deadline_reached` means the job ran out of
      #   time. `partial_failure` means some reads failed, and the job keeps the results
      #   from the rest. `budget_limited` means your credits covered fewer results than
      #   the job found. `canceled` and `failed` match the job status.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionJob::CompletionReason, nil]
      optional :completion_reason,
               enum: -> { XTwitterScraper::ExtractionJob::CompletionReason },
               api_name: :completionReason

      # @!attribute effective_results_limit
      #   Result limit after affordability checks.
      #
      #   @return [Integer, nil]
      optional :effective_results_limit, Integer, api_name: :effectiveResultsLimit

      # @!attribute error_message
      #   Safe error code for a failed job.
      #
      #   @return [String, nil]
      optional :error_message, String, api_name: :errorMessage

      # @!attribute image_filter
      #
      #   @return [XTwitterScraper::Models::ImageFilterSummary, nil]
      optional :image_filter, -> { XTwitterScraper::ImageFilterSummary }, api_name: :imageFilter

      # @!attribute results_limit
      #   Requested result limit.
      #
      #   @return [Integer, nil]
      optional :results_limit, Integer, api_name: :resultsLimit

      # @!attribute topic_filter
      #
      #   @return [XTwitterScraper::Models::ExtractionJob::TopicFilter, nil]
      optional :topic_filter, -> { XTwitterScraper::ExtractionJob::TopicFilter }, api_name: :topicFilter

      # @!method initialize(id:, created_at:, status:, tool_type:, total_results:, url:, completed_at: nil, completion_reason: nil, effective_results_limit: nil, error_message: nil, image_filter: nil, results_limit: nil, topic_filter: nil)
      #   Extraction job tracking status, tool type, and result count.
      #
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param status [Symbol, XTwitterScraper::Models::ExtractionJob::Status]
      #
      #   @param tool_type [Symbol, XTwitterScraper::Models::ExtractionJob::ToolType] Identifier for the extraction tool used to run a job.
      #
      #   @param total_results [Integer]
      #
      #   @param url [String] Dashboard page where a signed-in user follows this job & downloads its rows as C
      #
      #   @param completed_at [Time]
      #
      #   @param completion_reason [Symbol, XTwitterScraper::Models::ExtractionJob::CompletionReason] Why a terminal job stopped. `requested_limit_reached` means the job returned the
      #
      #   @param effective_results_limit [Integer] Result limit after affordability checks.
      #
      #   @param error_message [String] Safe error code for a failed job.
      #
      #   @param image_filter [XTwitterScraper::Models::ImageFilterSummary]
      #
      #   @param results_limit [Integer] Requested result limit.
      #
      #   @param topic_filter [XTwitterScraper::Models::ExtractionJob::TopicFilter]

      # @see XTwitterScraper::Models::ExtractionJob#status
      module Status
        extend XTwitterScraper::Internal::Type::Enum

        RUNNING = :running
        COMPLETED = :completed
        FAILED = :failed
        PENDING = :pending
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Identifier for the extraction tool used to run a job.
      #
      # @see XTwitterScraper::Models::ExtractionJob#tool_type
      module ToolType
        extend XTwitterScraper::Internal::Type::Enum

        ARTICLE_EXTRACTOR = :article_extractor
        COMMUNITY_EXTRACTOR = :community_extractor
        COMMUNITY_MODERATOR_EXPLORER = :community_moderator_explorer
        COMMUNITY_POST_EXTRACTOR = :community_post_extractor
        COMMUNITY_SEARCH = :community_search
        FAVORITERS = :favoriters
        FOLLOWER_EXPLORER = :follower_explorer
        FOLLOWING_EXPLORER = :following_explorer
        LIST_FOLLOWER_EXPLORER = :list_follower_explorer
        LIST_MEMBER_EXTRACTOR = :list_member_extractor
        LIST_POST_EXTRACTOR = :list_post_extractor
        MENTION_EXTRACTOR = :mention_extractor
        PEOPLE_SEARCH = :people_search
        POST_EXTRACTOR = :post_extractor
        QUOTE_EXTRACTOR = :quote_extractor
        REPLY_EXTRACTOR = :reply_extractor
        REPOST_EXTRACTOR = :repost_extractor
        SPACE_EXPLORER = :space_explorer
        THREAD_EXTRACTOR = :thread_extractor
        TWEET_SEARCH_EXTRACTOR = :tweet_search_extractor
        USER_AFFILIATES = :user_affiliates
        USER_LIKES = :user_likes
        USER_MEDIA = :user_media
        VERIFIED_FOLLOWER_EXPLORER = :verified_follower_explorer

        # @!method self.values
        #   @return [Array<Symbol>]
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
      #
      # @see XTwitterScraper::Models::ExtractionJob#completion_reason
      module CompletionReason
        extend XTwitterScraper::Internal::Type::Enum

        BUDGET_LIMITED = :budget_limited
        CANCELED = :canceled
        DEADLINE_REACHED = :deadline_reached
        FAILED = :failed
        PAGINATION_SAFETY_LIMIT = :pagination_safety_limit
        PARTIAL_FAILURE = :partial_failure
        REQUESTED_LIMIT_REACHED = :requested_limit_reached
        SOURCE_EXHAUSTED = :source_exhausted

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see XTwitterScraper::Models::ExtractionJob#topic_filter
      class TopicFilter < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute topic
        #   The topic you sent.
        #
        #   @return [String]
        required :topic, String

        # @!attribute question
        #   The question asked of each post.
        #
        #   @return [String]
        required :question, String

        # @!attribute cutoff
        #   The lowest topicScore a kept post has.
        #
        #   @return [Float]
        required :cutoff, Float

        # @!attribute checked
        #   Posts checked. Only kept posts are billed.
        #
        #   @return [Integer]
        required :checked, Integer

        # @!attribute kept
        #   Posts about the topic, all returned & billed at 2 credits each.
        #
        #   @return [Integer]
        required :kept, Integer

        # @!attribute unchecked
        #   Posts the check couldn't answer. They aren't billed or returned.
        #
        #   @return [Array<XTwitterScraper::Models::ExtractionJob::TopicFilter::Unchecked>]
        required :unchecked,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::ExtractionJob::TopicFilter::Unchecked] }

        # @!method initialize(topic:, question:, cutoff:, checked:, kept:, unchecked:)
        #   What the topic filter asked & how many posts it kept.
        #
        #   @param topic [String] The topic you sent.
        #
        #   @param question [String] The question asked of each post.
        #
        #   @param cutoff [Float] The lowest topicScore a kept post has.
        #
        #   @param checked [Integer] Posts checked. Only kept posts are billed.
        #
        #   @param kept [Integer] Posts about the topic, all returned & billed at 2 credits each.
        #
        #   @param unchecked [Array<XTwitterScraper::Models::ExtractionJob::TopicFilter::Unchecked>] Posts the check couldn't answer. They aren't billed or returned.

        # @see XTwitterScraper::Models::ExtractionJob::TopicFilter#unchecked
        class Unchecked < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute reason
          #
          #   @return [String]
          required :reason, String

          # @!method initialize(id:, reason:)
          #   @param id [String]
          #   @param reason [String]
        end
      end
    end
  end
end
