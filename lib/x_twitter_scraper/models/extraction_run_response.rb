# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#run
    class ExtractionRunResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute allowed
      #
      #   @return [Boolean, nil]
      optional :allowed, XTwitterScraper::Internal::Type::Boolean

      # @!attribute credits_available
      #
      #   @return [String, nil]
      optional :credits_available, String, api_name: :creditsAvailable

      # @!attribute credits_required
      #
      #   @return [String, nil]
      optional :credits_required, String, api_name: :creditsRequired

      # @!attribute estimated_results
      #
      #   @return [Integer, nil]
      optional :estimated_results, Integer, api_name: :estimatedResults

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute poll_after_ms
      #
      #   @return [Integer, nil]
      optional :poll_after_ms, Integer, api_name: :pollAfterMs

      # @!attribute source
      #
      #   @return [String, nil]
      optional :source, String

      # @!attribute resolved_x_user_id
      #
      #   @return [String, nil]
      optional :resolved_x_user_id, String, api_name: :resolvedXUserId

      # @!attribute status
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionRunResponse::Status, nil]
      optional :status, enum: -> { XTwitterScraper::Models::ExtractionRunResponse::Status }

      # @!attribute status_url
      #
      #   @return [String, nil]
      optional :status_url, String, api_name: :statusUrl

      # @!attribute tool_type
      #   Identifier for the extraction tool used to run a job.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionRunResponse::ToolType, nil]
      optional :tool_type,
               enum: -> { XTwitterScraper::Models::ExtractionRunResponse::ToolType },
               api_name: :toolType

      # @!attribute url
      #   Dashboard page of the job. A signed-in user follows its progress there and
      #   downloads every row as CSV, XLSX, JSON, Markdown, PDF or text, so give this link
      #   to a person who wants the whole list as a file.
      #
      #   @return [String, nil]
      optional :url, String

      # @!attribute wait_url
      #
      #   @return [String, nil]
      optional :wait_url, String, api_name: :waitUrl

      # @!method initialize(allowed: nil, credits_available: nil, credits_required: nil, estimated_results: nil, id: nil, poll_after_ms: nil, source: nil, resolved_x_user_id: nil, status: nil, status_url: nil, tool_type: nil, url: nil, wait_url: nil)
      #   @param allowed [Boolean]
      #   @param credits_available [String]
      #   @param credits_required [String]
      #   @param estimated_results [Integer]
      #   @param id [String]
      #   @param poll_after_ms [Integer]
      #   @param source [String]
      #   @param resolved_x_user_id [String]
      #   @param status [Symbol, XTwitterScraper::Models::ExtractionRunResponse::Status]
      #   @param status_url [String]
      #   @param tool_type [Symbol, XTwitterScraper::Models::ExtractionRunResponse::ToolType] Identifier for the extraction tool used to run a job.
      #   @param url [String] Dashboard page of the job. A signed-in user follows its progress there and downl
      #   @param wait_url [String]

      # @see XTwitterScraper::Models::ExtractionRunResponse#status
      module Status
        extend XTwitterScraper::Internal::Type::Enum

        PENDING = :pending
        RUNNING = :running
        CANCELED = :canceled
        COMPLETED = :completed
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Identifier for the extraction tool used to run a job.
      #
      # @see XTwitterScraper::Models::ExtractionRunResponse#tool_type
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
    end
  end
end
