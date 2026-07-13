# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#list
    class ExtractionListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Cursor for keyset pagination from prior response next_cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum number of items to return (1-100, default 50). For paid per-result
      #   endpoints, the returned count may be lower when remaining credits cannot cover
      #   the requested page. If zero paid results are affordable, the endpoint returns
      #   402 insufficient_credits.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #   Filter by job status
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionListParams::Status, nil]
      optional :status, enum: -> { XTwitterScraper::ExtractionListParams::Status }

      # @!attribute tool_type
      #   Filter by extraction tool type
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionListParams::ToolType, nil]
      optional :tool_type, enum: -> { XTwitterScraper::ExtractionListParams::ToolType }

      # @!method initialize(cursor: nil, limit: nil, status: nil, tool_type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::ExtractionListParams} for more details.
      #
      #   @param cursor [String] Cursor for keyset pagination from prior response next_cursor
      #
      #   @param limit [Integer] Maximum number of items to return (1-100, default 50). For paid per-result endpo
      #
      #   @param status [Symbol, XTwitterScraper::Models::ExtractionListParams::Status] Filter by job status
      #
      #   @param tool_type [Symbol, XTwitterScraper::Models::ExtractionListParams::ToolType] Filter by extraction tool type
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Filter by job status
      module Status
        extend XTwitterScraper::Internal::Type::Enum

        RUNNING = :running
        COMPLETED = :completed
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Filter by extraction tool type
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
