# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#run
    class ExtractionRunResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute status
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionRunResponse::Status]
      required :status, enum: -> { XTwitterScraper::Models::ExtractionRunResponse::Status }

      # @!attribute tool_type
      #   Identifier for the extraction tool used to run a job.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionRunResponse::ToolType]
      required :tool_type,
               enum: -> { XTwitterScraper::Models::ExtractionRunResponse::ToolType },
               api_name: :toolType

      # @!method initialize(id:, status:, tool_type:)
      #   @param id [String]
      #
      #   @param status [Symbol, XTwitterScraper::Models::ExtractionRunResponse::Status]
      #
      #   @param tool_type [Symbol, XTwitterScraper::Models::ExtractionRunResponse::ToolType] Identifier for the extraction tool used to run a job.

      # @see XTwitterScraper::Models::ExtractionRunResponse#status
      module Status
        extend XTwitterScraper::Internal::Type::Enum

        RUNNING = :running

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
        VERIFIED_FOLLOWER_EXPLORER = :verified_follower_explorer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
