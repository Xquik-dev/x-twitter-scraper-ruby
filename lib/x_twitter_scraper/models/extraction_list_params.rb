# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#list
    class ExtractionListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute after
      #   Cursor for pagination
      #
      #   @return [String, nil]
      optional :after, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionListParams::Status, nil]
      optional :status, enum: -> { XTwitterScraper::ExtractionListParams::Status }

      # @!attribute tool_type
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionListParams::ToolType, nil]
      optional :tool_type, enum: -> { XTwitterScraper::ExtractionListParams::ToolType }

      # @!method initialize(after: nil, limit: nil, status: nil, tool_type: nil, request_options: {})
      #   @param after [String] Cursor for pagination
      #
      #   @param limit [Integer]
      #
      #   @param status [Symbol, XTwitterScraper::Models::ExtractionListParams::Status]
      #
      #   @param tool_type [Symbol, XTwitterScraper::Models::ExtractionListParams::ToolType]
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      module Status
        extend XTwitterScraper::Internal::Type::Enum

        RUNNING = :running
        COMPLETED = :completed
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

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
