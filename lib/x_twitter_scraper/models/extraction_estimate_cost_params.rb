# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#estimate_cost
    class ExtractionEstimateCostParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute tool_type
      #   Identifier for the extraction tool used to run a job.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::ToolType]
      required :tool_type,
               enum: -> { XTwitterScraper::ExtractionEstimateCostParams::ToolType },
               api_name: :toolType

      # @!attribute advanced_query
      #   Raw advanced query string appended to the estimate (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :advanced_query, String, api_name: :advancedQuery

      # @!attribute any_words
      #   Alternative words or quoted phrases for estimated results. Separate with spaces,
      #   commas, or lines.
      #
      #   @return [String, nil]
      optional :any_words, String, api_name: :anyWords

      # @!attribute bounding_box
      #   Geo bounding box used for estimation, e.g. -74.1 40.6 -73.9 40.8
      #   (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :bounding_box, String, api_name: :boundingBox

      # @!attribute cashtags
      #   Cashtags applied to the estimate, separated by spaces, commas, or lines.
      #
      #   @return [String, nil]
      optional :cashtags, String

      # @!attribute conversation_id
      #   Conversation ID filter used for estimation (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :conversation_id, String, api_name: :conversationId

      # @!attribute exact_phrase
      #   Exact phrase filter for search estimation
      #
      #   @return [String, nil]
      optional :exact_phrase, String, api_name: :exactPhrase

      # @!attribute exclude_words
      #   Words or quoted phrases excluded from estimated results. Separate with spaces,
      #   commas, or lines.
      #
      #   @return [String, nil]
      optional :exclude_words, String, api_name: :excludeWords

      # @!attribute from_user
      #   Estimate only tweets from this author username (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :from_user, String, api_name: :fromUser

      # @!attribute hashtags
      #   Hashtags applied to the estimate, separated by spaces, commas, or lines.
      #
      #   @return [String, nil]
      optional :hashtags, String

      # @!attribute in_reply_to_tweet_id
      #   Estimate only replies to this tweet ID (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :in_reply_to_tweet_id, String, api_name: :inReplyToTweetId

      # @!attribute language
      #   Language code used for estimate filtering (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :language, String

      # @!attribute list_id
      #   Estimate search results within this list ID (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :list_id, String, api_name: :listId

      # @!attribute media_type
      #   Media type used for estimate filtering (tweet_search_extractor)
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::MediaType, nil]
      optional :media_type,
               enum: -> { XTwitterScraper::ExtractionEstimateCostParams::MediaType },
               api_name: :mediaType

      # @!attribute mentioning
      #   Estimate tweets mentioning this username (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :mentioning, String

      # @!attribute min_faves
      #   Minimum likes threshold for estimated results (tweet_search_extractor)
      #
      #   @return [Integer, nil]
      optional :min_faves, Integer, api_name: :minFaves

      # @!attribute min_quotes
      #   Minimum quote count threshold for estimated results (tweet_search_extractor)
      #
      #   @return [Integer, nil]
      optional :min_quotes, Integer, api_name: :minQuotes

      # @!attribute min_replies
      #   Minimum replies threshold for estimated results (tweet_search_extractor)
      #
      #   @return [Integer, nil]
      optional :min_replies, Integer, api_name: :minReplies

      # @!attribute min_retweets
      #   Minimum retweets threshold for estimated results (tweet_search_extractor)
      #
      #   @return [Integer, nil]
      optional :min_retweets, Integer, api_name: :minRetweets

      # @!attribute place
      #   Estimate search results within this place ID (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :place, String

      # @!attribute place_country
      #   Estimate search results within this country code (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :place_country, String, api_name: :placeCountry

      # @!attribute point_radius
      #   Geo point radius used for estimation, e.g. -73.99 40.73 25mi
      #   (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :point_radius, String, api_name: :pointRadius

      # @!attribute quotes
      #   Quote mode used for estimation (tweet_search_extractor)
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Quotes, nil]
      optional :quotes, enum: -> { XTwitterScraper::ExtractionEstimateCostParams::Quotes }

      # @!attribute quotes_of_tweet_id
      #   Estimate only quotes of this tweet ID (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :quotes_of_tweet_id, String, api_name: :quotesOfTweetId

      # @!attribute replies
      #   Reply mode used for estimation (tweet_search_extractor)
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Replies, nil]
      optional :replies, enum: -> { XTwitterScraper::ExtractionEstimateCostParams::Replies }

      # @!attribute results_limit
      #   Maximum number of results to estimate. When set, the estimate caps projected
      #   results to this value.
      #
      #   @return [Integer, nil]
      optional :results_limit, Integer, api_name: :resultsLimit

      # @!attribute retweets
      #   Retweet mode used for estimation (tweet_search_extractor)
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Retweets, nil]
      optional :retweets, enum: -> { XTwitterScraper::ExtractionEstimateCostParams::Retweets }

      # @!attribute retweets_of_tweet_id
      #   Estimate only retweets of this tweet ID (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :retweets_of_tweet_id, String, api_name: :retweetsOfTweetId

      # @!attribute search_query
      #   Query used to price tweet_search_extractor or community_search.
      #
      #   @return [String, nil]
      optional :search_query, String, api_name: :searchQuery

      # @!attribute since_date
      #   Estimate start date in YYYY-MM-DD format (tweet_search_extractor)
      #
      #   @return [Date, nil]
      optional :since_date, Date, api_name: :sinceDate

      # @!attribute target_community_id
      #   Community ID used to price community_post_extractor or community_search.
      #
      #   @return [String, nil]
      optional :target_community_id, String, api_name: :targetCommunityId

      # @!attribute target_list_id
      #   List ID used to price list_follower_explorer, list_member_extractor, or
      #   list_post_extractor.
      #
      #   @return [String, nil]
      optional :target_list_id, String, api_name: :targetListId

      # @!attribute target_space_id
      #   Space ID used to price space_explorer.
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

      # @!attribute to_user
      #   Estimate replies sent to this username (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :to_user, String, api_name: :toUser

      # @!attribute until_date
      #   Estimate end date in YYYY-MM-DD format (tweet_search_extractor)
      #
      #   @return [Date, nil]
      optional :until_date, Date, api_name: :untilDate

      # @!attribute url
      #   URL substring or domain filter used for estimation (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :url, String

      # @!attribute verified_only
      #   Estimate only verified authors (tweet_search_extractor)
      #
      #   @return [Boolean, nil]
      optional :verified_only, XTwitterScraper::Internal::Type::Boolean, api_name: :verifiedOnly

      # @!method initialize(tool_type:, advanced_query: nil, any_words: nil, bounding_box: nil, cashtags: nil, conversation_id: nil, exact_phrase: nil, exclude_words: nil, from_user: nil, hashtags: nil, in_reply_to_tweet_id: nil, language: nil, list_id: nil, media_type: nil, mentioning: nil, min_faves: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, place: nil, place_country: nil, point_radius: nil, quotes: nil, quotes_of_tweet_id: nil, replies: nil, results_limit: nil, retweets: nil, retweets_of_tweet_id: nil, search_query: nil, since_date: nil, target_community_id: nil, target_list_id: nil, target_space_id: nil, target_tweet_id: nil, target_username: nil, to_user: nil, until_date: nil, url: nil, verified_only: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::ExtractionEstimateCostParams} for more details.
      #
      #   @param tool_type [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::ToolType] Identifier for the extraction tool used to run a job.
      #
      #   @param advanced_query [String] Raw advanced query string appended to the estimate (tweet_search_extractor)
      #
      #   @param any_words [String] Alternative words or quoted phrases for estimated results. Separate with spaces,
      #
      #   @param bounding_box [String] Geo bounding box used for estimation, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_e
      #
      #   @param cashtags [String] Cashtags applied to the estimate, separated by spaces, commas, or lines.
      #
      #   @param conversation_id [String] Conversation ID filter used for estimation (tweet_search_extractor)
      #
      #   @param exact_phrase [String] Exact phrase filter for search estimation
      #
      #   @param exclude_words [String] Words or quoted phrases excluded from estimated results. Separate with spaces, c
      #
      #   @param from_user [String] Estimate only tweets from this author username (tweet_search_extractor)
      #
      #   @param hashtags [String] Hashtags applied to the estimate, separated by spaces, commas, or lines.
      #
      #   @param in_reply_to_tweet_id [String] Estimate only replies to this tweet ID (tweet_search_extractor)
      #
      #   @param language [String] Language code used for estimate filtering (tweet_search_extractor)
      #
      #   @param list_id [String] Estimate search results within this list ID (tweet_search_extractor)
      #
      #   @param media_type [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::MediaType] Media type used for estimate filtering (tweet_search_extractor)
      #
      #   @param mentioning [String] Estimate tweets mentioning this username (tweet_search_extractor)
      #
      #   @param min_faves [Integer] Minimum likes threshold for estimated results (tweet_search_extractor)
      #
      #   @param min_quotes [Integer] Minimum quote count threshold for estimated results (tweet_search_extractor)
      #
      #   @param min_replies [Integer] Minimum replies threshold for estimated results (tweet_search_extractor)
      #
      #   @param min_retweets [Integer] Minimum retweets threshold for estimated results (tweet_search_extractor)
      #
      #   @param place [String] Estimate search results within this place ID (tweet_search_extractor)
      #
      #   @param place_country [String] Estimate search results within this country code (tweet_search_extractor)
      #
      #   @param point_radius [String] Geo point radius used for estimation, e.g. -73.99 40.73 25mi (tweet_search_extra
      #
      #   @param quotes [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Quotes] Quote mode used for estimation (tweet_search_extractor)
      #
      #   @param quotes_of_tweet_id [String] Estimate only quotes of this tweet ID (tweet_search_extractor)
      #
      #   @param replies [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Replies] Reply mode used for estimation (tweet_search_extractor)
      #
      #   @param results_limit [Integer] Maximum number of results to estimate. When set, the estimate caps projected res
      #
      #   @param retweets [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Retweets] Retweet mode used for estimation (tweet_search_extractor)
      #
      #   @param retweets_of_tweet_id [String] Estimate only retweets of this tweet ID (tweet_search_extractor)
      #
      #   @param search_query [String] Query used to price tweet_search_extractor or community_search.
      #
      #   @param since_date [Date] Estimate start date in YYYY-MM-DD format (tweet_search_extractor)
      #
      #   @param target_community_id [String] Community ID used to price community_post_extractor or community_search.
      #
      #   @param target_list_id [String] List ID used to price list_follower_explorer, list_member_extractor, or list_pos
      #
      #   @param target_space_id [String] Space ID used to price space_explorer.
      #
      #   @param target_tweet_id [String]
      #
      #   @param target_username [String]
      #
      #   @param to_user [String] Estimate replies sent to this username (tweet_search_extractor)
      #
      #   @param until_date [Date] Estimate end date in YYYY-MM-DD format (tweet_search_extractor)
      #
      #   @param url [String] URL substring or domain filter used for estimation (tweet_search_extractor)
      #
      #   @param verified_only [Boolean] Estimate only verified authors (tweet_search_extractor)
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Identifier for the extraction tool used to run a job.
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

      # Media type used for estimate filtering (tweet_search_extractor)
      module MediaType
        extend XTwitterScraper::Internal::Type::Enum

        IMAGES = :images
        VIDEOS = :videos
        GIFS = :gifs
        MEDIA = :media
        LINKS = :links
        NONE = :none

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Quote mode used for estimation (tweet_search_extractor)
      module Quotes
        extend XTwitterScraper::Internal::Type::Enum

        INCLUDE = :include
        EXCLUDE = :exclude
        ONLY = :only

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Reply mode used for estimation (tweet_search_extractor)
      module Replies
        extend XTwitterScraper::Internal::Type::Enum

        INCLUDE = :include
        EXCLUDE = :exclude
        ONLY = :only

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Retweet mode used for estimation (tweet_search_extractor)
      module Retweets
        extend XTwitterScraper::Internal::Type::Enum

        INCLUDE = :include
        EXCLUDE = :exclude
        ONLY = :only

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
