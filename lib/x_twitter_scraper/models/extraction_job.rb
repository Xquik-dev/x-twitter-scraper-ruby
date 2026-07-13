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

      # @!attribute completed_at
      #
      #   @return [Time, nil]
      optional :completed_at, Time, api_name: :completedAt

      # @!method initialize(id:, created_at:, status:, tool_type:, total_results:, completed_at: nil)
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
      #   @param completed_at [Time]

      # @see XTwitterScraper::Models::ExtractionJob#status
      module Status
        extend XTwitterScraper::Internal::Type::Enum

        RUNNING = :running
        COMPLETED = :completed
        FAILED = :failed

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
        USER_LIKES = :user_likes
        USER_MEDIA = :user_media
        VERIFIED_FOLLOWER_EXPLORER = :verified_follower_explorer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
