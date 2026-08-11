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
      #   Raw advanced search query appended as-is (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :advanced_query, String, api_name: :advancedQuery

      # @!attribute any_words
      #   Words or quoted phrases where any one can match. Separate with spaces, commas,
      #   or lines. (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :any_words, String, api_name: :anyWords

      # @!attribute bio_contains
      #   Bio terms separated by commas or lines.
      #
      #   @return [String, nil]
      optional :bio_contains, String, api_name: :bioContains

      # @!attribute blue_verified_only
      #   Return only Blue-verified Tweet authors.
      #
      #   @return [Boolean, nil]
      optional :blue_verified_only, XTwitterScraper::Internal::Type::Boolean, api_name: :blueVerifiedOnly

      # @!attribute bounding_box
      #   Geo bounding box, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :bounding_box, String, api_name: :boundingBox

      # @!attribute card_name
      #   Match the Tweet card name.
      #
      #   @return [String, nil]
      optional :card_name, String, api_name: :cardName

      # @!attribute cashtags
      #   Cashtags separated by spaces, commas, or lines. (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :cashtags, String

      # @!attribute collection_strategy
      #   Reply collection strategy.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::CollectionStrategy, nil]
      optional :collection_strategy,
               enum: -> { XTwitterScraper::ExtractionEstimateCostParams::CollectionStrategy },
               api_name: :collectionStrategy

      # @!attribute conversation_id
      #   Conversation ID filter (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :conversation_id, String, api_name: :conversationId

      # @!attribute dedupe_across_targets
      #   Merge duplicate results across collection targets.
      #
      #   @return [Boolean, nil]
      optional :dedupe_across_targets,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :dedupeAcrossTargets

      # @!attribute dedupe_mode
      #   Keep target duplicates, first rows, or merged overlap.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::DedupeMode, nil]
      optional :dedupe_mode,
               enum: -> { XTwitterScraper::ExtractionEstimateCostParams::DedupeMode },
               api_name: :dedupeMode

      # @!attribute exact_phrase
      #   Exact phrase to match (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :exact_phrase, String, api_name: :exactPhrase

      # @!attribute exclude_original_author
      #   Exclude replies from the source author.
      #
      #   @return [Boolean, nil]
      optional :exclude_original_author,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :excludeOriginalAuthor

      # @!attribute exclude_source
      #   Exclude a source application.
      #
      #   @return [String, nil]
      optional :exclude_source, String, api_name: :excludeSource

      # @!attribute exclude_words
      #   Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
      #   (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :exclude_words, String, api_name: :excludeWords

      # @!attribute from_user
      #   Filter by author username (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :from_user, String, api_name: :fromUser

      # @!attribute geocode
      #   Match latitude, longitude, and radius.
      #
      #   @return [String, nil]
      optional :geocode, String

      # @!attribute hashtags
      #   Hashtags separated by spaces, commas, or lines. (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :hashtags, String

      # @!attribute has_location
      #   Require a profile location.
      #
      #   @return [Boolean, nil]
      optional :has_location, XTwitterScraper::Internal::Type::Boolean, api_name: :hasLocation

      # @!attribute has_media_only
      #   Return only replies with media.
      #
      #   @return [Boolean, nil]
      optional :has_media_only, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMediaOnly

      # @!attribute has_website
      #   Require a profile website.
      #
      #   @return [Boolean, nil]
      optional :has_website, XTwitterScraper::Internal::Type::Boolean, api_name: :hasWebsite

      # @!attribute include_original_post
      #   Include the source post in reply results.
      #
      #   @return [Boolean, nil]
      optional :include_original_post,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :includeOriginalPost

      # @!attribute include_search_terms
      #   Add matching search terms to collection metadata.
      #
      #   @return [Boolean, nil]
      optional :include_search_terms, XTwitterScraper::Internal::Type::Boolean, api_name: :includeSearchTerms

      # @!attribute include_target_metadata
      #   Add source target metadata to each result.
      #
      #   @return [Boolean, nil]
      optional :include_target_metadata,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :includeTargetMetadata

      # @!attribute in_reply_to_tweet_id
      #   Only replies to this tweet ID (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :in_reply_to_tweet_id, String, api_name: :inReplyToTweetId

      # @!attribute language
      #   Language code filter (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :language, String

      # @!attribute list_id
      #   Search within a list ID (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :list_id, String, api_name: :listId

      # @!attribute location_contains
      #   Required profile location text.
      #
      #   @return [String, nil]
      optional :location_contains, String, api_name: :locationContains

      # @!attribute max_depth
      #   Maximum nested reply depth.
      #
      #   @return [Integer, nil]
      optional :max_depth, Integer, api_name: :maxDepth

      # @!attribute max_followers
      #   Maximum follower count for profile results.
      #
      #   @return [Integer, nil]
      optional :max_followers, Integer, api_name: :maxFollowers

      # @!attribute max_following
      #   Maximum following count for profile results.
      #
      #   @return [Integer, nil]
      optional :max_following, Integer, api_name: :maxFollowing

      # @!attribute max_id
      #   Return Tweets older than this Tweet ID.
      #
      #   @return [String, nil]
      optional :max_id, String, api_name: :maxId

      # @!attribute max_items_per_target
      #   Maximum results collected for each target.
      #
      #   @return [Integer, nil]
      optional :max_items_per_target, Integer, api_name: :maxItemsPerTarget

      # @!attribute max_likes
      #   Maximum Tweet like count.
      #
      #   @return [Integer, nil]
      optional :max_likes, Integer, api_name: :maxLikes

      # @!attribute max_pages_per_target
      #   Reply pages collected for each target.
      #
      #   @return [Integer, nil]
      optional :max_pages_per_target, Integer, api_name: :maxPagesPerTarget

      # @!attribute max_posts
      #   Maximum post count for profile results.
      #
      #   @return [Integer, nil]
      optional :max_posts, Integer, api_name: :maxPosts

      # @!attribute max_quotes
      #   Maximum Tweet quote count.
      #
      #   @return [Integer, nil]
      optional :max_quotes, Integer, api_name: :maxQuotes

      # @!attribute max_replies
      #   Maximum Tweet reply count.
      #
      #   @return [Integer, nil]
      optional :max_replies, Integer, api_name: :maxReplies

      # @!attribute max_retweets
      #   Maximum Tweet repost count.
      #
      #   @return [Integer, nil]
      optional :max_retweets, Integer, api_name: :maxRetweets

      # @!attribute media_type
      #   Media type filter (tweet_search_extractor)
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::MediaType, nil]
      optional :media_type,
               enum: -> { XTwitterScraper::ExtractionEstimateCostParams::MediaType },
               api_name: :mediaType

      # @!attribute mentioning
      #   Filter tweets mentioning a username (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :mentioning, String

      # @!attribute min_account_age_days
      #   Minimum profile age in days.
      #
      #   @return [Integer, nil]
      optional :min_account_age_days, Integer, api_name: :minAccountAgeDays

      # @!attribute min_bookmarks
      #   Minimum Tweet bookmark count.
      #
      #   @return [Integer, nil]
      optional :min_bookmarks, Integer, api_name: :minBookmarks

      # @!attribute min_faves
      #   Minimum likes threshold (tweet_search_extractor)
      #
      #   @return [Integer, nil]
      optional :min_faves, Integer, api_name: :minFaves

      # @!attribute min_followers
      #   Minimum follower count for profile results.
      #
      #   @return [Integer, nil]
      optional :min_followers, Integer, api_name: :minFollowers

      # @!attribute min_following
      #   Minimum following count for profile results.
      #
      #   @return [Integer, nil]
      optional :min_following, Integer, api_name: :minFollowing

      # @!attribute min_posts
      #   Minimum post count for profile results.
      #
      #   @return [Integer, nil]
      optional :min_posts, Integer, api_name: :minPosts

      # @!attribute min_quotes
      #   Minimum quote count threshold (tweet_search_extractor)
      #
      #   @return [Integer, nil]
      optional :min_quotes, Integer, api_name: :minQuotes

      # @!attribute min_replies
      #   Minimum replies threshold (tweet_search_extractor)
      #
      #   @return [Integer, nil]
      optional :min_replies, Integer, api_name: :minReplies

      # @!attribute min_retweets
      #   Minimum retweets threshold (tweet_search_extractor)
      #
      #   @return [Integer, nil]
      optional :min_retweets, Integer, api_name: :minRetweets

      # @!attribute min_views
      #   Minimum Tweet view count.
      #
      #   @return [Integer, nil]
      optional :min_views, Integer, api_name: :minViews

      # @!attribute native_retweets
      #   Only return native reposts.
      #
      #   @return [Boolean, nil]
      optional :native_retweets, XTwitterScraper::Internal::Type::Boolean, api_name: :nativeRetweets

      # @!attribute near
      #   Match a place name.
      #
      #   @return [String, nil]
      optional :near, String

      # @!attribute news
      #   Only return news results.
      #
      #   @return [Boolean, nil]
      optional :news, XTwitterScraper::Internal::Type::Boolean

      # @!attribute overlap_mode
      #   Shortcut for dedupeMode=merge.
      #
      #   @return [Boolean, nil]
      optional :overlap_mode, XTwitterScraper::Internal::Type::Boolean, api_name: :overlapMode

      # @!attribute place
      #   Search within a place ID (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :place, String

      # @!attribute place_country
      #   Search within a country code (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :place_country, String, api_name: :placeCountry

      # @!attribute point_radius
      #   Geo point radius, e.g. -73.99 40.73 25mi (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :point_radius, String, api_name: :pointRadius

      # @!attribute query_type
      #   Search ranking applied to every query.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::QueryType, nil]
      optional :query_type,
               enum: -> { XTwitterScraper::ExtractionEstimateCostParams::QueryType },
               api_name: :queryType

      # @!attribute quotes
      #   Quote mode (tweet_search_extractor)
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Quotes, nil]
      optional :quotes, enum: -> { XTwitterScraper::ExtractionEstimateCostParams::Quotes }

      # @!attribute quotes_of_tweet_id
      #   Only quotes of this tweet ID (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :quotes_of_tweet_id, String, api_name: :quotesOfTweetId

      # @!attribute relation_targets
      #   Profile relations processed within one job.
      #
      #   @return [Array<XTwitterScraper::Models::ExtractionEstimateCostParams::RelationTarget>, nil]
      optional :relation_targets,
               -> {
                 XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::ExtractionEstimateCostParams::RelationTarget]
               },
               api_name: :relationTargets

      # @!attribute replies
      #   Reply mode (tweet_search_extractor)
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Replies, nil]
      optional :replies, enum: -> { XTwitterScraper::ExtractionEstimateCostParams::Replies }

      # @!attribute results_limit
      #   Maximum number of results to extract. When set, the extraction stops after
      #   reaching this limit.
      #
      #   @return [Integer, nil]
      optional :results_limit, Integer, api_name: :resultsLimit

      # @!attribute retweets
      #   Retweet mode (tweet_search_extractor)
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Retweets, nil]
      optional :retweets, enum: -> { XTwitterScraper::ExtractionEstimateCostParams::Retweets }

      # @!attribute retweets_of_tweet_id
      #   Only retweets of this tweet ID (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :retweets_of_tweet_id, String, api_name: :retweetsOfTweetId

      # @!attribute safe
      #   Enable the safe-search filter.
      #
      #   @return [Boolean, nil]
      optional :safe, XTwitterScraper::Internal::Type::Boolean

      # @!attribute scope
      #   Reply depth scope.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Scope, nil]
      optional :scope, enum: -> { XTwitterScraper::ExtractionEstimateCostParams::Scope }

      # @!attribute search_queries
      #   Search queries processed as one collection job.
      #
      #   @return [Array<String>, nil]
      optional :search_queries, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :searchQueries

      # @!attribute search_query
      #   Required for tweet_search_extractor & community_search.
      #
      #   @return [String, nil]
      optional :search_query, String, api_name: :searchQuery

      # @!attribute since_date
      #   Start date YYYY-MM-DD (tweet_search_extractor)
      #
      #   @return [Date, nil]
      optional :since_date, Date, api_name: :sinceDate

      # @!attribute since_id
      #   Return Tweets newer than this Tweet ID.
      #
      #   @return [String, nil]
      optional :since_id, String, api_name: :sinceId

      # @!attribute since_time
      #   Reply start time as ISO 8601 or Unix seconds.
      #
      #   @return [Time, Integer, nil]
      optional :since_time,
               union: -> { XTwitterScraper::ExtractionEstimateCostParams::SinceTime },
               api_name: :sinceTime

      # @!attribute sort
      #   Reply result order.
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Sort, nil]
      optional :sort, enum: -> { XTwitterScraper::ExtractionEstimateCostParams::Sort }

      # @!attribute source
      #   Match the source application.
      #
      #   @return [String, nil]
      optional :source, String

      # @!attribute start_cursor
      #   Resume one reply target from this cursor.
      #
      #   @return [String, nil]
      optional :start_cursor, String, api_name: :startCursor

      # @!attribute target_community_id
      #   Required for community_post_extractor & community_search.
      #
      #   @return [String, nil]
      optional :target_community_id, String, api_name: :targetCommunityId

      # @!attribute target_community_ids
      #   Community IDs processed as one collection job.
      #
      #   @return [Array<String>, nil]
      optional :target_community_ids,
               XTwitterScraper::Internal::Type::ArrayOf[String],
               api_name: :targetCommunityIds

      # @!attribute target_list_id
      #   Required for list_follower_explorer, list_member_extractor &
      #   list_post_extractor.
      #
      #   @return [String, nil]
      optional :target_list_id, String, api_name: :targetListId

      # @!attribute target_list_ids
      #   List IDs processed as one collection job.
      #
      #   @return [Array<String>, nil]
      optional :target_list_ids, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :targetListIds

      # @!attribute targets
      #   Mixed targets auto-routed within one job.
      #
      #   @return [Array<String, XTwitterScraper::Models::ExtractionEstimateCostParams::Target::UnionMember1>, nil]
      optional :targets,
               -> { XTwitterScraper::Internal::Type::ArrayOf[union: XTwitterScraper::ExtractionEstimateCostParams::Target] }

      # @!attribute target_space_id
      #   Required for space_explorer.
      #
      #   @return [String, nil]
      optional :target_space_id, String, api_name: :targetSpaceId

      # @!attribute target_tweet_id
      #
      #   @return [String, nil]
      optional :target_tweet_id, String, api_name: :targetTweetId

      # @!attribute target_tweet_ids
      #   Tweet IDs processed as one collection job.
      #
      #   @return [Array<String>, nil]
      optional :target_tweet_ids, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :targetTweetIds

      # @!attribute target_username
      #
      #   @return [String, nil]
      optional :target_username, String, api_name: :targetUsername

      # @!attribute target_usernames
      #   Usernames processed as one collection job.
      #
      #   @return [Array<String>, nil]
      optional :target_usernames, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :targetUsernames

      # @!attribute to_user
      #   Filter replies sent to a username (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :to_user, String, api_name: :toUser

      # @!attribute until_date
      #   End date YYYY-MM-DD (tweet_search_extractor)
      #
      #   @return [Date, nil]
      optional :until_date, Date, api_name: :untilDate

      # @!attribute until_time
      #   Reply end time as ISO 8601 or Unix seconds.
      #
      #   @return [Time, Integer, nil]
      optional :until_time,
               union: -> { XTwitterScraper::ExtractionEstimateCostParams::UntilTime },
               api_name: :untilTime

      # @!attribute url
      #   URL substring or domain filter (tweet_search_extractor)
      #
      #   @return [String, nil]
      optional :url, String

      # @!attribute username_contains
      #   Required username text.
      #
      #   @return [String, nil]
      optional :username_contains, String, api_name: :usernameContains

      # @!attribute verified_only
      #   Only verified authors (tweet_search_extractor)
      #
      #   @return [Boolean, nil]
      optional :verified_only, XTwitterScraper::Internal::Type::Boolean, api_name: :verifiedOnly

      # @!attribute verified_type
      #   Exact profile verification type.
      #
      #   @return [String, nil]
      optional :verified_type, String, api_name: :verifiedType

      # @!attribute within
      #   Set the radius for the near filter.
      #
      #   @return [String, nil]
      optional :within, String

      # @!attribute within_time
      #   Match Tweets inside a recent time window.
      #
      #   @return [String, nil]
      optional :within_time, String, api_name: :withinTime

      # @!method initialize(tool_type:, advanced_query: nil, any_words: nil, bio_contains: nil, blue_verified_only: nil, bounding_box: nil, card_name: nil, cashtags: nil, collection_strategy: nil, conversation_id: nil, dedupe_across_targets: nil, dedupe_mode: nil, exact_phrase: nil, exclude_original_author: nil, exclude_source: nil, exclude_words: nil, from_user: nil, geocode: nil, hashtags: nil, has_location: nil, has_media_only: nil, has_website: nil, include_original_post: nil, include_search_terms: nil, include_target_metadata: nil, in_reply_to_tweet_id: nil, language: nil, list_id: nil, location_contains: nil, max_depth: nil, max_followers: nil, max_following: nil, max_id: nil, max_items_per_target: nil, max_likes: nil, max_pages_per_target: nil, max_posts: nil, max_quotes: nil, max_replies: nil, max_retweets: nil, media_type: nil, mentioning: nil, min_account_age_days: nil, min_bookmarks: nil, min_faves: nil, min_followers: nil, min_following: nil, min_posts: nil, min_quotes: nil, min_replies: nil, min_retweets: nil, min_views: nil, native_retweets: nil, near: nil, news: nil, overlap_mode: nil, place: nil, place_country: nil, point_radius: nil, query_type: nil, quotes: nil, quotes_of_tweet_id: nil, relation_targets: nil, replies: nil, results_limit: nil, retweets: nil, retweets_of_tweet_id: nil, safe: nil, scope: nil, search_queries: nil, search_query: nil, since_date: nil, since_id: nil, since_time: nil, sort: nil, source: nil, start_cursor: nil, target_community_id: nil, target_community_ids: nil, target_list_id: nil, target_list_ids: nil, targets: nil, target_space_id: nil, target_tweet_id: nil, target_tweet_ids: nil, target_username: nil, target_usernames: nil, to_user: nil, until_date: nil, until_time: nil, url: nil, username_contains: nil, verified_only: nil, verified_type: nil, within: nil, within_time: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::ExtractionEstimateCostParams} for more details.
      #
      #   @param tool_type [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::ToolType] Identifier for the extraction tool used to run a job.
      #
      #   @param advanced_query [String] Raw advanced search query appended as-is (tweet_search_extractor)
      #
      #   @param any_words [String] Words or quoted phrases where any one can match. Separate with spaces, commas, o
      #
      #   @param bio_contains [String] Bio terms separated by commas or lines.
      #
      #   @param blue_verified_only [Boolean] Return only Blue-verified Tweet authors.
      #
      #   @param bounding_box [String] Geo bounding box, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_extractor)
      #
      #   @param card_name [String] Match the Tweet card name.
      #
      #   @param cashtags [String] Cashtags separated by spaces, commas, or lines. (tweet_search_extractor)
      #
      #   @param collection_strategy [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::CollectionStrategy] Reply collection strategy.
      #
      #   @param conversation_id [String] Conversation ID filter (tweet_search_extractor)
      #
      #   @param dedupe_across_targets [Boolean] Merge duplicate results across collection targets.
      #
      #   @param dedupe_mode [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::DedupeMode] Keep target duplicates, first rows, or merged overlap.
      #
      #   @param exact_phrase [String] Exact phrase to match (tweet_search_extractor)
      #
      #   @param exclude_original_author [Boolean] Exclude replies from the source author.
      #
      #   @param exclude_source [String] Exclude a source application.
      #
      #   @param exclude_words [String] Words or quoted phrases to exclude. Separate with spaces, commas, or lines. (twe
      #
      #   @param from_user [String] Filter by author username (tweet_search_extractor)
      #
      #   @param geocode [String] Match latitude, longitude, and radius.
      #
      #   @param hashtags [String] Hashtags separated by spaces, commas, or lines. (tweet_search_extractor)
      #
      #   @param has_location [Boolean] Require a profile location.
      #
      #   @param has_media_only [Boolean] Return only replies with media.
      #
      #   @param has_website [Boolean] Require a profile website.
      #
      #   @param include_original_post [Boolean] Include the source post in reply results.
      #
      #   @param include_search_terms [Boolean] Add matching search terms to collection metadata.
      #
      #   @param include_target_metadata [Boolean] Add source target metadata to each result.
      #
      #   @param in_reply_to_tweet_id [String] Only replies to this tweet ID (tweet_search_extractor)
      #
      #   @param language [String] Language code filter (tweet_search_extractor)
      #
      #   @param list_id [String] Search within a list ID (tweet_search_extractor)
      #
      #   @param location_contains [String] Required profile location text.
      #
      #   @param max_depth [Integer] Maximum nested reply depth.
      #
      #   @param max_followers [Integer] Maximum follower count for profile results.
      #
      #   @param max_following [Integer] Maximum following count for profile results.
      #
      #   @param max_id [String] Return Tweets older than this Tweet ID.
      #
      #   @param max_items_per_target [Integer] Maximum results collected for each target.
      #
      #   @param max_likes [Integer] Maximum Tweet like count.
      #
      #   @param max_pages_per_target [Integer] Reply pages collected for each target.
      #
      #   @param max_posts [Integer] Maximum post count for profile results.
      #
      #   @param max_quotes [Integer] Maximum Tweet quote count.
      #
      #   @param max_replies [Integer] Maximum Tweet reply count.
      #
      #   @param max_retweets [Integer] Maximum Tweet repost count.
      #
      #   @param media_type [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::MediaType] Media type filter (tweet_search_extractor)
      #
      #   @param mentioning [String] Filter tweets mentioning a username (tweet_search_extractor)
      #
      #   @param min_account_age_days [Integer] Minimum profile age in days.
      #
      #   @param min_bookmarks [Integer] Minimum Tweet bookmark count.
      #
      #   @param min_faves [Integer] Minimum likes threshold (tweet_search_extractor)
      #
      #   @param min_followers [Integer] Minimum follower count for profile results.
      #
      #   @param min_following [Integer] Minimum following count for profile results.
      #
      #   @param min_posts [Integer] Minimum post count for profile results.
      #
      #   @param min_quotes [Integer] Minimum quote count threshold (tweet_search_extractor)
      #
      #   @param min_replies [Integer] Minimum replies threshold (tweet_search_extractor)
      #
      #   @param min_retweets [Integer] Minimum retweets threshold (tweet_search_extractor)
      #
      #   @param min_views [Integer] Minimum Tweet view count.
      #
      #   @param native_retweets [Boolean] Only return native reposts.
      #
      #   @param near [String] Match a place name.
      #
      #   @param news [Boolean] Only return news results.
      #
      #   @param overlap_mode [Boolean] Shortcut for dedupeMode=merge.
      #
      #   @param place [String] Search within a place ID (tweet_search_extractor)
      #
      #   @param place_country [String] Search within a country code (tweet_search_extractor)
      #
      #   @param point_radius [String] Geo point radius, e.g. -73.99 40.73 25mi (tweet_search_extractor)
      #
      #   @param query_type [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::QueryType] Search ranking applied to every query.
      #
      #   @param quotes [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Quotes] Quote mode (tweet_search_extractor)
      #
      #   @param quotes_of_tweet_id [String] Only quotes of this tweet ID (tweet_search_extractor)
      #
      #   @param relation_targets [Array<XTwitterScraper::Models::ExtractionEstimateCostParams::RelationTarget>] Profile relations processed within one job.
      #
      #   @param replies [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Replies] Reply mode (tweet_search_extractor)
      #
      #   @param results_limit [Integer] Maximum number of results to extract. When set, the extraction stops after reach
      #
      #   @param retweets [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Retweets] Retweet mode (tweet_search_extractor)
      #
      #   @param retweets_of_tweet_id [String] Only retweets of this tweet ID (tweet_search_extractor)
      #
      #   @param safe [Boolean] Enable the safe-search filter.
      #
      #   @param scope [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Scope] Reply depth scope.
      #
      #   @param search_queries [Array<String>] Search queries processed as one collection job.
      #
      #   @param search_query [String] Required for tweet_search_extractor & community_search.
      #
      #   @param since_date [Date] Start date YYYY-MM-DD (tweet_search_extractor)
      #
      #   @param since_id [String] Return Tweets newer than this Tweet ID.
      #
      #   @param since_time [Time, Integer] Reply start time as ISO 8601 or Unix seconds.
      #
      #   @param sort [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Sort] Reply result order.
      #
      #   @param source [String] Match the source application.
      #
      #   @param start_cursor [String] Resume one reply target from this cursor.
      #
      #   @param target_community_id [String] Required for community_post_extractor & community_search.
      #
      #   @param target_community_ids [Array<String>] Community IDs processed as one collection job.
      #
      #   @param target_list_id [String] Required for list_follower_explorer, list_member_extractor & list_post_extractor
      #
      #   @param target_list_ids [Array<String>] List IDs processed as one collection job.
      #
      #   @param targets [Array<String, XTwitterScraper::Models::ExtractionEstimateCostParams::Target::UnionMember1>] Mixed targets auto-routed within one job.
      #
      #   @param target_space_id [String] Required for space_explorer.
      #
      #   @param target_tweet_id [String]
      #
      #   @param target_tweet_ids [Array<String>] Tweet IDs processed as one collection job.
      #
      #   @param target_username [String]
      #
      #   @param target_usernames [Array<String>] Usernames processed as one collection job.
      #
      #   @param to_user [String] Filter replies sent to a username (tweet_search_extractor)
      #
      #   @param until_date [Date] End date YYYY-MM-DD (tweet_search_extractor)
      #
      #   @param until_time [Time, Integer] Reply end time as ISO 8601 or Unix seconds.
      #
      #   @param url [String] URL substring or domain filter (tweet_search_extractor)
      #
      #   @param username_contains [String] Required username text.
      #
      #   @param verified_only [Boolean] Only verified authors (tweet_search_extractor)
      #
      #   @param verified_type [String] Exact profile verification type.
      #
      #   @param within [String] Set the radius for the near filter.
      #
      #   @param within_time [String] Match Tweets inside a recent time window.
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

      # Reply collection strategy.
      module CollectionStrategy
        extend XTwitterScraper::Internal::Type::Enum

        AUTO = :auto
        COMPLETE = :complete
        DIRECT = :direct
        SEARCH = :search
        THREAD = :thread

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Keep target duplicates, first rows, or merged overlap.
      module DedupeMode
        extend XTwitterScraper::Internal::Type::Enum

        NONE = :none
        FIRST = :first
        MERGE = :merge

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Media type filter (tweet_search_extractor)
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

      # Search ranking applied to every query.
      module QueryType
        extend XTwitterScraper::Internal::Type::Enum

        LATEST = :Latest
        TOP = :Top
        BOTH = :Both

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Quote mode (tweet_search_extractor)
      module Quotes
        extend XTwitterScraper::Internal::Type::Enum

        INCLUDE = :include
        EXCLUDE = :exclude
        ONLY = :only

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class RelationTarget < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute relation
        #
        #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::RelationTarget::Relation]
        required :relation, enum: -> { XTwitterScraper::ExtractionEstimateCostParams::RelationTarget::Relation }

        # @!attribute value
        #
        #   @return [String]
        required :value, String

        # @!method initialize(relation:, value:)
        #   One target and relation in a mixed profile collection.
        #
        #   @param relation [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::RelationTarget::Relation]
        #   @param value [String]

        # @see XTwitterScraper::Models::ExtractionEstimateCostParams::RelationTarget#relation
        module Relation
          extend XTwitterScraper::Internal::Type::Enum

          COMMUNITY_MEMBERS = :community_members
          FOLLOWERS = :followers
          FOLLOWING = :following
          LIST_FOLLOWERS = :list_followers
          LIST_MEMBERS = :list_members
          VERIFIED_FOLLOWERS = :verified_followers

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Reply mode (tweet_search_extractor)
      module Replies
        extend XTwitterScraper::Internal::Type::Enum

        INCLUDE = :include
        EXCLUDE = :exclude
        ONLY = :only

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Retweet mode (tweet_search_extractor)
      module Retweets
        extend XTwitterScraper::Internal::Type::Enum

        INCLUDE = :include
        EXCLUDE = :exclude
        ONLY = :only

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Reply depth scope.
      module Scope
        extend XTwitterScraper::Internal::Type::Enum

        ALL = :all
        DIRECT = :direct
        NESTED = :nested

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Reply start time as ISO 8601 or Unix seconds.
      module SinceTime
        extend XTwitterScraper::Internal::Type::Union

        variant Time

        variant Integer

        # @!method self.variants
        #   @return [Array(Time, Integer)]
      end

      # Reply result order.
      module Sort
        extend XTwitterScraper::Internal::Type::Enum

        RELEVANCE = :relevance
        LATEST = :latest
        OLDEST = :oldest
        LIKES = :likes

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # One auto-routed target in a mixed Tweet collection.
      module Target
        extend XTwitterScraper::Internal::Type::Union

        # X URL, numeric Tweet ID, @username, kind:value target, or search.
        variant String

        variant -> { XTwitterScraper::ExtractionEstimateCostParams::Target::UnionMember1 }

        class UnionMember1 < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute kind
          #
          #   @return [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Target::UnionMember1::Kind]
          required :kind, enum: -> { XTwitterScraper::ExtractionEstimateCostParams::Target::UnionMember1::Kind }

          # @!attribute value
          #
          #   @return [String]
          required :value, String

          # @!method initialize(kind:, value:)
          #   @param kind [Symbol, XTwitterScraper::Models::ExtractionEstimateCostParams::Target::UnionMember1::Kind]
          #   @param value [String]

          # @see XTwitterScraper::Models::ExtractionEstimateCostParams::Target::UnionMember1#kind
          module Kind
            extend XTwitterScraper::Internal::Type::Enum

            FAVORITERS = :favoriters
            LIST = :list
            PROFILE = :profile
            PROFILE_LIKES = :profile_likes
            PROFILE_MEDIA = :profile_media
            PROFILE_REPLIES = :profile_replies
            QUOTES = :quotes
            REPLIES = :replies
            RETWEETERS = :retweeters
            SEARCH = :search
            THREAD = :thread
            TWEET = :tweet

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(String, XTwitterScraper::Models::ExtractionEstimateCostParams::Target::UnionMember1)]
      end

      # Reply end time as ISO 8601 or Unix seconds.
      module UntilTime
        extend XTwitterScraper::Internal::Type::Union

        variant Time

        variant Integer

        # @!method self.variants
        #   @return [Array(Time, Integer)]
      end
    end
  end
end
