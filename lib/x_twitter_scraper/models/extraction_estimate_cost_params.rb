# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#estimate_cost
    class ExtractionEstimateCostParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute tool_type
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::ToolType]
      required :tool_type,
               enum: -> { XTwitterScraper::ExtractionEstimateCostParams::ToolType },
               api_name: :toolType

      # @!attribute advanced_query
      #   Raw advanced search query appended as-is (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :advanced_query, String, api_name: :advancedQuery

      # @!attribute exact_phrase
      #   Exact phrase to match (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :exact_phrase, String, api_name: :exactPhrase

      # @!attribute exclude_words
      #   Words to exclude from results (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :exclude_words, String, api_name: :excludeWords

      # @!attribute search_query
      #
      #   @return [String, nil]
      optional :search_query, String, api_name: :searchQuery

      # @!attribute target_community_id
      #
      #   @return [String, nil]
      optional :target_community_id, String, api_name: :targetCommunityId

      # @!attribute target_list_id
      #
      #   @return [String, nil]
      optional :target_list_id, String, api_name: :targetListId

      # @!attribute target_space_id
      #
      #   @return [String, nil]
      optional :target_space_id, String, api_name: :targetSpaceId

      # @!attribute target_tweet_id
      #
      #   @return [String, nil]
      optional :target_tweet_id, String, api_name: :targetTweetId

      # @!attribute target_username
      #
      #   @return [String, nil]
      optional :target_username, String, api_name: :targetUsername

      # @!method initialize(tool_type:, advanced_query: nil, exact_phrase: nil, exclude_words: nil, search_query: nil, target_community_id: nil, target_list_id: nil, target_space_id: nil, target_tweet_id: nil, target_username: nil, request_options: {})
      #   @param tool_type [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::ToolType]
      #
      #   @param advanced_query [String] Raw advanced search query appended as-is (tweet_search_extractor)
      #
      #   @param exact_phrase [String] Exact phrase to match (tweet_search_extractor)
      #
      #   @param exclude_words [String] Words to exclude from results (tweet_search_extractor)
      #
      #   @param search_query [String]
      #
      #   @param target_community_id [String]
      #
      #   @param target_list_id [String]
      #
      #   @param target_space_id [String]
      #
      #   @param target_tweet_id [String]
      #
      #   @param target_username [String]
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

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
