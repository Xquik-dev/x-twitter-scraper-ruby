# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#list
    class ExtractionListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute extractions
      #
      #   @return [Array<XTwitterScraper::Models::ExtractionListResponse::Extraction>]
      required :extractions,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::ExtractionListResponse::Extraction] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(extractions:, has_more:, next_cursor: nil)
      #   @param extractions [Array<XTwitterScraper::Models::ExtractionListResponse::Extraction>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String]

      class Extraction < XTwitterScraper::Internal::Type::BaseModel
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
        #   @return [Symbol, XTwitterScraper::Models::ExtractionListResponse::Extraction::Status]
        required :status, enum: -> { XTwitterScraper::Models::ExtractionListResponse::Extraction::Status }

        # @!attribute tool_type
        #
        #   @return [Symbol, XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType]
        required :tool_type,
                 enum: -> { XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType },
                 api_name: :toolType

        # @!attribute total_results
        #
        #   @return [Integer]
        required :total_results, Integer, api_name: :totalResults

        # @!attribute completed_at
        #
        #   @return [Time, nil]
        optional :completed_at, Time, api_name: :completedAt

        # @!method initialize(id:, created_at:, status:, tool_type:, total_results:, completed_at: nil)
        #   @param id [String]
        #   @param created_at [Time]
        #   @param status [Symbol, XTwitterScraper::Models::ExtractionListResponse::Extraction::Status]
        #   @param tool_type [Symbol, XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType]
        #   @param total_results [Integer]
        #   @param completed_at [Time]

        # @see XTwitterScraper::Models::ExtractionListResponse::Extraction#status
        module Status
          extend XTwitterScraper::Internal::Type::Enum

          RUNNING = :running
          COMPLETED = :completed
          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see XTwitterScraper::Models::ExtractionListResponse::Extraction#tool_type
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
end
