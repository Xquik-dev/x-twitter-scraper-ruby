# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ExtractionRunParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::ExtractionRunParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Identifier for the extraction tool used to run a job.
      sig { returns(XTwitterScraper::ExtractionRunParams::ToolType::OrSymbol) }
      attr_accessor :tool_type

      # Estimate cost without creating an extraction.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :dry_run

      sig { params(dry_run: T::Boolean).void }
      attr_writer :dry_run

      # Raw advanced search query appended as-is (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :advanced_query

      sig { params(advanced_query: String).void }
      attr_writer :advanced_query

      # Words or quoted phrases where any one can match. Separate with spaces, commas,
      # or lines. (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :any_words

      sig { params(any_words: String).void }
      attr_writer :any_words

      # Bio terms separated by commas or lines.
      sig { returns(T.nilable(String)) }
      attr_reader :bio_contains

      sig { params(bio_contains: String).void }
      attr_writer :bio_contains

      # Return only Blue-verified Tweet authors.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :blue_verified_only

      sig { params(blue_verified_only: T::Boolean).void }
      attr_writer :blue_verified_only

      # Geo bounding box, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :bounding_box

      sig { params(bounding_box: String).void }
      attr_writer :bounding_box

      # Match the Tweet card name.
      sig { returns(T.nilable(String)) }
      attr_reader :card_name

      sig { params(card_name: String).void }
      attr_writer :card_name

      # Cashtags separated by spaces, commas, or lines. (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :cashtags

      sig { params(cashtags: String).void }
      attr_writer :cashtags

      # Reply collection strategy.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::ExtractionRunParams::CollectionStrategy::OrSymbol
          )
        )
      end
      attr_reader :collection_strategy

      sig do
        params(
          collection_strategy:
            XTwitterScraper::ExtractionRunParams::CollectionStrategy::OrSymbol
        ).void
      end
      attr_writer :collection_strategy

      # Conversation ID filter (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :conversation_id

      sig { params(conversation_id: String).void }
      attr_writer :conversation_id

      # Merge duplicate results across collection targets.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :dedupe_across_targets

      sig { params(dedupe_across_targets: T::Boolean).void }
      attr_writer :dedupe_across_targets

      # Keep target duplicates, first rows, or merged overlap.
      sig do
        returns(
          T.nilable(XTwitterScraper::ExtractionRunParams::DedupeMode::OrSymbol)
        )
      end
      attr_reader :dedupe_mode

      sig do
        params(
          dedupe_mode:
            XTwitterScraper::ExtractionRunParams::DedupeMode::OrSymbol
        ).void
      end
      attr_writer :dedupe_mode

      # Exact phrase to match (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :exact_phrase

      sig { params(exact_phrase: String).void }
      attr_writer :exact_phrase

      # Exclude replies from the source author.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :exclude_original_author

      sig { params(exclude_original_author: T::Boolean).void }
      attr_writer :exclude_original_author

      # Exclude a source application.
      sig { returns(T.nilable(String)) }
      attr_reader :exclude_source

      sig { params(exclude_source: String).void }
      attr_writer :exclude_source

      # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
      # (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :exclude_words

      sig { params(exclude_words: String).void }
      attr_writer :exclude_words

      # Filter by author username (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :from_user

      sig { params(from_user: String).void }
      attr_writer :from_user

      # Match latitude, longitude, and radius.
      sig { returns(T.nilable(String)) }
      attr_reader :geocode

      sig { params(geocode: String).void }
      attr_writer :geocode

      # Hashtags separated by spaces, commas, or lines. (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :hashtags

      sig { params(hashtags: String).void }
      attr_writer :hashtags

      # Require a profile location.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_location

      sig { params(has_location: T::Boolean).void }
      attr_writer :has_location

      # Return only replies with media.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_media_only

      sig { params(has_media_only: T::Boolean).void }
      attr_writer :has_media_only

      # Require a profile website.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_website

      sig { params(has_website: T::Boolean).void }
      attr_writer :has_website

      # Include the source post in reply results.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_original_post

      sig { params(include_original_post: T::Boolean).void }
      attr_writer :include_original_post

      # Add matching search terms to collection metadata.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_search_terms

      sig { params(include_search_terms: T::Boolean).void }
      attr_writer :include_search_terms

      # Add source target metadata to each result.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_target_metadata

      sig { params(include_target_metadata: T::Boolean).void }
      attr_writer :include_target_metadata

      # Only replies to this tweet ID (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :in_reply_to_tweet_id

      sig { params(in_reply_to_tweet_id: String).void }
      attr_writer :in_reply_to_tweet_id

      # Language code filter (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :language

      sig { params(language: String).void }
      attr_writer :language

      # Search within a list ID (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :list_id

      sig { params(list_id: String).void }
      attr_writer :list_id

      # Required profile location text.
      sig { returns(T.nilable(String)) }
      attr_reader :location_contains

      sig { params(location_contains: String).void }
      attr_writer :location_contains

      # Maximum nested reply depth.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_depth

      sig { params(max_depth: Integer).void }
      attr_writer :max_depth

      # Maximum follower count for profile results.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_followers

      sig { params(max_followers: Integer).void }
      attr_writer :max_followers

      # Maximum following count for profile results.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_following

      sig { params(max_following: Integer).void }
      attr_writer :max_following

      # Return Tweets older than this Tweet ID.
      sig { returns(T.nilable(String)) }
      attr_reader :max_id

      sig { params(max_id: String).void }
      attr_writer :max_id

      # Maximum results collected for each target.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_items_per_target

      sig { params(max_items_per_target: Integer).void }
      attr_writer :max_items_per_target

      # Maximum Tweet like count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_likes

      sig { params(max_likes: Integer).void }
      attr_writer :max_likes

      # Reply pages collected for each target.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_pages_per_target

      sig { params(max_pages_per_target: Integer).void }
      attr_writer :max_pages_per_target

      # Maximum post count for profile results.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_posts

      sig { params(max_posts: Integer).void }
      attr_writer :max_posts

      # Maximum Tweet quote count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_quotes

      sig { params(max_quotes: Integer).void }
      attr_writer :max_quotes

      # Maximum Tweet reply count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_replies

      sig { params(max_replies: Integer).void }
      attr_writer :max_replies

      # Maximum Tweet repost count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_retweets

      sig { params(max_retweets: Integer).void }
      attr_writer :max_retweets

      # Media type filter (tweet_search_extractor)
      sig do
        returns(
          T.nilable(XTwitterScraper::ExtractionRunParams::MediaType::OrSymbol)
        )
      end
      attr_reader :media_type

      sig do
        params(
          media_type: XTwitterScraper::ExtractionRunParams::MediaType::OrSymbol
        ).void
      end
      attr_writer :media_type

      # Filter tweets mentioning a username (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :mentioning

      sig { params(mentioning: String).void }
      attr_writer :mentioning

      # Minimum profile age in days.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_account_age_days

      sig { params(min_account_age_days: Integer).void }
      attr_writer :min_account_age_days

      # Minimum Tweet bookmark count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_bookmarks

      sig { params(min_bookmarks: Integer).void }
      attr_writer :min_bookmarks

      # Minimum likes threshold (tweet_search_extractor)
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_faves

      sig { params(min_faves: Integer).void }
      attr_writer :min_faves

      # Minimum follower count for profile results.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_followers

      sig { params(min_followers: Integer).void }
      attr_writer :min_followers

      # Minimum following count for profile results.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_following

      sig { params(min_following: Integer).void }
      attr_writer :min_following

      # Minimum post count for profile results.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_posts

      sig { params(min_posts: Integer).void }
      attr_writer :min_posts

      # Minimum quote count threshold (tweet_search_extractor)
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_quotes

      sig { params(min_quotes: Integer).void }
      attr_writer :min_quotes

      # Minimum replies threshold (tweet_search_extractor)
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_replies

      sig { params(min_replies: Integer).void }
      attr_writer :min_replies

      # Minimum retweets threshold (tweet_search_extractor)
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_retweets

      sig { params(min_retweets: Integer).void }
      attr_writer :min_retweets

      # Minimum Tweet view count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_views

      sig { params(min_views: Integer).void }
      attr_writer :min_views

      # Only return native reposts.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :native_retweets

      sig { params(native_retweets: T::Boolean).void }
      attr_writer :native_retweets

      # Match a place name.
      sig { returns(T.nilable(String)) }
      attr_reader :near

      sig { params(near: String).void }
      attr_writer :near

      # Only return news results.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :news

      sig { params(news: T::Boolean).void }
      attr_writer :news

      # Shortcut for dedupeMode=merge.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :overlap_mode

      sig { params(overlap_mode: T::Boolean).void }
      attr_writer :overlap_mode

      # Search within a place ID (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :place

      sig { params(place: String).void }
      attr_writer :place

      # Search within a country code (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :place_country

      sig { params(place_country: String).void }
      attr_writer :place_country

      # Geo point radius, e.g. -73.99 40.73 25mi (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :point_radius

      sig { params(point_radius: String).void }
      attr_writer :point_radius

      # Search ranking applied to every query.
      sig do
        returns(
          T.nilable(XTwitterScraper::ExtractionRunParams::QueryType::OrSymbol)
        )
      end
      attr_reader :query_type

      sig do
        params(
          query_type: XTwitterScraper::ExtractionRunParams::QueryType::OrSymbol
        ).void
      end
      attr_writer :query_type

      # Quote mode (tweet_search_extractor)
      sig do
        returns(
          T.nilable(XTwitterScraper::ExtractionRunParams::Quotes::OrSymbol)
        )
      end
      attr_reader :quotes

      sig do
        params(
          quotes: XTwitterScraper::ExtractionRunParams::Quotes::OrSymbol
        ).void
      end
      attr_writer :quotes

      # Only quotes of this tweet ID (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :quotes_of_tweet_id

      sig { params(quotes_of_tweet_id: String).void }
      attr_writer :quotes_of_tweet_id

      # Profile relations processed within one job.
      sig do
        returns(
          T.nilable(
            T::Array[XTwitterScraper::ExtractionRunParams::RelationTarget]
          )
        )
      end
      attr_reader :relation_targets

      sig do
        params(
          relation_targets:
            T::Array[
              XTwitterScraper::ExtractionRunParams::RelationTarget::OrHash
            ]
        ).void
      end
      attr_writer :relation_targets

      # Reply mode (tweet_search_extractor)
      sig do
        returns(
          T.nilable(XTwitterScraper::ExtractionRunParams::Replies::OrSymbol)
        )
      end
      attr_reader :replies

      sig do
        params(
          replies: XTwitterScraper::ExtractionRunParams::Replies::OrSymbol
        ).void
      end
      attr_writer :replies

      # Maximum number of results to extract. When set, the extraction stops after
      # reaching this limit.
      sig { returns(T.nilable(Integer)) }
      attr_reader :results_limit

      sig { params(results_limit: Integer).void }
      attr_writer :results_limit

      # Retweet mode (tweet_search_extractor)
      sig do
        returns(
          T.nilable(XTwitterScraper::ExtractionRunParams::Retweets::OrSymbol)
        )
      end
      attr_reader :retweets

      sig do
        params(
          retweets: XTwitterScraper::ExtractionRunParams::Retweets::OrSymbol
        ).void
      end
      attr_writer :retweets

      # Only retweets of this tweet ID (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :retweets_of_tweet_id

      sig { params(retweets_of_tweet_id: String).void }
      attr_writer :retweets_of_tweet_id

      # Enable the safe-search filter.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :safe

      sig { params(safe: T::Boolean).void }
      attr_writer :safe

      # Reply depth scope.
      sig do
        returns(
          T.nilable(XTwitterScraper::ExtractionRunParams::Scope::OrSymbol)
        )
      end
      attr_reader :scope

      sig do
        params(
          scope: XTwitterScraper::ExtractionRunParams::Scope::OrSymbol
        ).void
      end
      attr_writer :scope

      # Search queries processed as one collection job.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :search_queries

      sig { params(search_queries: T::Array[String]).void }
      attr_writer :search_queries

      # Required for tweet_search_extractor & community_search.
      sig { returns(T.nilable(String)) }
      attr_reader :search_query

      sig { params(search_query: String).void }
      attr_writer :search_query

      # Start date YYYY-MM-DD (tweet_search_extractor)
      sig { returns(T.nilable(Date)) }
      attr_reader :since_date

      sig { params(since_date: Date).void }
      attr_writer :since_date

      # Return Tweets newer than this Tweet ID.
      sig { returns(T.nilable(String)) }
      attr_reader :since_id

      sig { params(since_id: String).void }
      attr_writer :since_id

      # Reply start time as ISO 8601 or Unix seconds.
      sig do
        returns(
          T.nilable(XTwitterScraper::ExtractionRunParams::SinceTime::Variants)
        )
      end
      attr_reader :since_time

      sig do
        params(
          since_time: XTwitterScraper::ExtractionRunParams::SinceTime::Variants
        ).void
      end
      attr_writer :since_time

      # Reply result order.
      sig do
        returns(T.nilable(XTwitterScraper::ExtractionRunParams::Sort::OrSymbol))
      end
      attr_reader :sort

      sig do
        params(sort: XTwitterScraper::ExtractionRunParams::Sort::OrSymbol).void
      end
      attr_writer :sort

      # Match the source application.
      sig { returns(T.nilable(String)) }
      attr_reader :source

      sig { params(source: String).void }
      attr_writer :source

      # Resume one reply target from this cursor.
      sig { returns(T.nilable(String)) }
      attr_reader :start_cursor

      sig { params(start_cursor: String).void }
      attr_writer :start_cursor

      # Required for community_post_extractor & community_search.
      sig { returns(T.nilable(String)) }
      attr_reader :target_community_id

      sig { params(target_community_id: String).void }
      attr_writer :target_community_id

      # Community IDs processed as one collection job.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :target_community_ids

      sig { params(target_community_ids: T::Array[String]).void }
      attr_writer :target_community_ids

      # Required for list_follower_explorer, list_member_extractor &
      # list_post_extractor.
      sig { returns(T.nilable(String)) }
      attr_reader :target_list_id

      sig { params(target_list_id: String).void }
      attr_writer :target_list_id

      # List IDs processed as one collection job.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :target_list_ids

      sig { params(target_list_ids: T::Array[String]).void }
      attr_writer :target_list_ids

      # Mixed targets auto-routed within one job.
      sig do
        returns(
          T.nilable(
            T::Array[
              T.any(
                String,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1
              )
            ]
          )
        )
      end
      attr_reader :targets

      sig do
        params(
          targets:
            T::Array[
              T.any(
                String,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::OrHash
              )
            ]
        ).void
      end
      attr_writer :targets

      # Required for space_explorer.
      sig { returns(T.nilable(String)) }
      attr_reader :target_space_id

      sig { params(target_space_id: String).void }
      attr_writer :target_space_id

      sig { returns(T.nilable(String)) }
      attr_reader :target_tweet_id

      sig { params(target_tweet_id: String).void }
      attr_writer :target_tweet_id

      # Tweet IDs processed as one collection job.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :target_tweet_ids

      sig { params(target_tweet_ids: T::Array[String]).void }
      attr_writer :target_tweet_ids

      sig { returns(T.nilable(String)) }
      attr_reader :target_username

      sig { params(target_username: String).void }
      attr_writer :target_username

      # Usernames processed as one collection job.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :target_usernames

      sig { params(target_usernames: T::Array[String]).void }
      attr_writer :target_usernames

      # Filter replies sent to a username (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :to_user

      sig { params(to_user: String).void }
      attr_writer :to_user

      # End date YYYY-MM-DD (tweet_search_extractor)
      sig { returns(T.nilable(Date)) }
      attr_reader :until_date

      sig { params(until_date: Date).void }
      attr_writer :until_date

      # Reply end time as ISO 8601 or Unix seconds.
      sig do
        returns(
          T.nilable(XTwitterScraper::ExtractionRunParams::UntilTime::Variants)
        )
      end
      attr_reader :until_time

      sig do
        params(
          until_time: XTwitterScraper::ExtractionRunParams::UntilTime::Variants
        ).void
      end
      attr_writer :until_time

      # URL substring or domain filter (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # Required username text.
      sig { returns(T.nilable(String)) }
      attr_reader :username_contains

      sig { params(username_contains: String).void }
      attr_writer :username_contains

      # Only verified authors (tweet_search_extractor)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :verified_only

      sig { params(verified_only: T::Boolean).void }
      attr_writer :verified_only

      # Exact profile verification type.
      sig { returns(T.nilable(String)) }
      attr_reader :verified_type

      sig { params(verified_type: String).void }
      attr_writer :verified_type

      # Set the radius for the near filter.
      sig { returns(T.nilable(String)) }
      attr_reader :within

      sig { params(within: String).void }
      attr_writer :within

      # Match Tweets inside a recent time window.
      sig { returns(T.nilable(String)) }
      attr_reader :within_time

      sig { params(within_time: String).void }
      attr_writer :within_time

      sig do
        params(
          tool_type: XTwitterScraper::ExtractionRunParams::ToolType::OrSymbol,
          dry_run: T::Boolean,
          advanced_query: String,
          any_words: String,
          bio_contains: String,
          blue_verified_only: T::Boolean,
          bounding_box: String,
          card_name: String,
          cashtags: String,
          collection_strategy:
            XTwitterScraper::ExtractionRunParams::CollectionStrategy::OrSymbol,
          conversation_id: String,
          dedupe_across_targets: T::Boolean,
          dedupe_mode:
            XTwitterScraper::ExtractionRunParams::DedupeMode::OrSymbol,
          exact_phrase: String,
          exclude_original_author: T::Boolean,
          exclude_source: String,
          exclude_words: String,
          from_user: String,
          geocode: String,
          hashtags: String,
          has_location: T::Boolean,
          has_media_only: T::Boolean,
          has_website: T::Boolean,
          include_original_post: T::Boolean,
          include_search_terms: T::Boolean,
          include_target_metadata: T::Boolean,
          in_reply_to_tweet_id: String,
          language: String,
          list_id: String,
          location_contains: String,
          max_depth: Integer,
          max_followers: Integer,
          max_following: Integer,
          max_id: String,
          max_items_per_target: Integer,
          max_likes: Integer,
          max_pages_per_target: Integer,
          max_posts: Integer,
          max_quotes: Integer,
          max_replies: Integer,
          max_retweets: Integer,
          media_type: XTwitterScraper::ExtractionRunParams::MediaType::OrSymbol,
          mentioning: String,
          min_account_age_days: Integer,
          min_bookmarks: Integer,
          min_faves: Integer,
          min_followers: Integer,
          min_following: Integer,
          min_posts: Integer,
          min_quotes: Integer,
          min_replies: Integer,
          min_retweets: Integer,
          min_views: Integer,
          native_retweets: T::Boolean,
          near: String,
          news: T::Boolean,
          overlap_mode: T::Boolean,
          place: String,
          place_country: String,
          point_radius: String,
          query_type: XTwitterScraper::ExtractionRunParams::QueryType::OrSymbol,
          quotes: XTwitterScraper::ExtractionRunParams::Quotes::OrSymbol,
          quotes_of_tweet_id: String,
          relation_targets:
            T::Array[
              XTwitterScraper::ExtractionRunParams::RelationTarget::OrHash
            ],
          replies: XTwitterScraper::ExtractionRunParams::Replies::OrSymbol,
          results_limit: Integer,
          retweets: XTwitterScraper::ExtractionRunParams::Retweets::OrSymbol,
          retweets_of_tweet_id: String,
          safe: T::Boolean,
          scope: XTwitterScraper::ExtractionRunParams::Scope::OrSymbol,
          search_queries: T::Array[String],
          search_query: String,
          since_date: Date,
          since_id: String,
          since_time: XTwitterScraper::ExtractionRunParams::SinceTime::Variants,
          sort: XTwitterScraper::ExtractionRunParams::Sort::OrSymbol,
          source: String,
          start_cursor: String,
          target_community_id: String,
          target_community_ids: T::Array[String],
          target_list_id: String,
          target_list_ids: T::Array[String],
          targets:
            T::Array[
              T.any(
                String,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::OrHash
              )
            ],
          target_space_id: String,
          target_tweet_id: String,
          target_tweet_ids: T::Array[String],
          target_username: String,
          target_usernames: T::Array[String],
          to_user: String,
          until_date: Date,
          until_time: XTwitterScraper::ExtractionRunParams::UntilTime::Variants,
          url: String,
          username_contains: String,
          verified_only: T::Boolean,
          verified_type: String,
          within: String,
          within_time: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Identifier for the extraction tool used to run a job.
        tool_type:,
        # Estimate cost without creating an extraction.
        dry_run: nil,
        # Raw advanced search query appended as-is (tweet_search_extractor)
        advanced_query: nil,
        # Words or quoted phrases where any one can match. Separate with spaces, commas,
        # or lines. (tweet_search_extractor)
        any_words: nil,
        # Bio terms separated by commas or lines.
        bio_contains: nil,
        # Return only Blue-verified Tweet authors.
        blue_verified_only: nil,
        # Geo bounding box, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_extractor)
        bounding_box: nil,
        # Match the Tweet card name.
        card_name: nil,
        # Cashtags separated by spaces, commas, or lines. (tweet_search_extractor)
        cashtags: nil,
        # Reply collection strategy.
        collection_strategy: nil,
        # Conversation ID filter (tweet_search_extractor)
        conversation_id: nil,
        # Merge duplicate results across collection targets.
        dedupe_across_targets: nil,
        # Keep target duplicates, first rows, or merged overlap.
        dedupe_mode: nil,
        # Exact phrase to match (tweet_search_extractor)
        exact_phrase: nil,
        # Exclude replies from the source author.
        exclude_original_author: nil,
        # Exclude a source application.
        exclude_source: nil,
        # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        # (tweet_search_extractor)
        exclude_words: nil,
        # Filter by author username (tweet_search_extractor)
        from_user: nil,
        # Match latitude, longitude, and radius.
        geocode: nil,
        # Hashtags separated by spaces, commas, or lines. (tweet_search_extractor)
        hashtags: nil,
        # Require a profile location.
        has_location: nil,
        # Return only replies with media.
        has_media_only: nil,
        # Require a profile website.
        has_website: nil,
        # Include the source post in reply results.
        include_original_post: nil,
        # Add matching search terms to collection metadata.
        include_search_terms: nil,
        # Add source target metadata to each result.
        include_target_metadata: nil,
        # Only replies to this tweet ID (tweet_search_extractor)
        in_reply_to_tweet_id: nil,
        # Language code filter (tweet_search_extractor)
        language: nil,
        # Search within a list ID (tweet_search_extractor)
        list_id: nil,
        # Required profile location text.
        location_contains: nil,
        # Maximum nested reply depth.
        max_depth: nil,
        # Maximum follower count for profile results.
        max_followers: nil,
        # Maximum following count for profile results.
        max_following: nil,
        # Return Tweets older than this Tweet ID.
        max_id: nil,
        # Maximum results collected for each target.
        max_items_per_target: nil,
        # Maximum Tweet like count.
        max_likes: nil,
        # Reply pages collected for each target.
        max_pages_per_target: nil,
        # Maximum post count for profile results.
        max_posts: nil,
        # Maximum Tweet quote count.
        max_quotes: nil,
        # Maximum Tweet reply count.
        max_replies: nil,
        # Maximum Tweet repost count.
        max_retweets: nil,
        # Media type filter (tweet_search_extractor)
        media_type: nil,
        # Filter tweets mentioning a username (tweet_search_extractor)
        mentioning: nil,
        # Minimum profile age in days.
        min_account_age_days: nil,
        # Minimum Tweet bookmark count.
        min_bookmarks: nil,
        # Minimum likes threshold (tweet_search_extractor)
        min_faves: nil,
        # Minimum follower count for profile results.
        min_followers: nil,
        # Minimum following count for profile results.
        min_following: nil,
        # Minimum post count for profile results.
        min_posts: nil,
        # Minimum quote count threshold (tweet_search_extractor)
        min_quotes: nil,
        # Minimum replies threshold (tweet_search_extractor)
        min_replies: nil,
        # Minimum retweets threshold (tweet_search_extractor)
        min_retweets: nil,
        # Minimum Tweet view count.
        min_views: nil,
        # Only return native reposts.
        native_retweets: nil,
        # Match a place name.
        near: nil,
        # Only return news results.
        news: nil,
        # Shortcut for dedupeMode=merge.
        overlap_mode: nil,
        # Search within a place ID (tweet_search_extractor)
        place: nil,
        # Search within a country code (tweet_search_extractor)
        place_country: nil,
        # Geo point radius, e.g. -73.99 40.73 25mi (tweet_search_extractor)
        point_radius: nil,
        # Search ranking applied to every query.
        query_type: nil,
        # Quote mode (tweet_search_extractor)
        quotes: nil,
        # Only quotes of this tweet ID (tweet_search_extractor)
        quotes_of_tweet_id: nil,
        # Profile relations processed within one job.
        relation_targets: nil,
        # Reply mode (tweet_search_extractor)
        replies: nil,
        # Maximum number of results to extract. When set, the extraction stops after
        # reaching this limit.
        results_limit: nil,
        # Retweet mode (tweet_search_extractor)
        retweets: nil,
        # Only retweets of this tweet ID (tweet_search_extractor)
        retweets_of_tweet_id: nil,
        # Enable the safe-search filter.
        safe: nil,
        # Reply depth scope.
        scope: nil,
        # Search queries processed as one collection job.
        search_queries: nil,
        # Required for tweet_search_extractor & community_search.
        search_query: nil,
        # Start date YYYY-MM-DD (tweet_search_extractor)
        since_date: nil,
        # Return Tweets newer than this Tweet ID.
        since_id: nil,
        # Reply start time as ISO 8601 or Unix seconds.
        since_time: nil,
        # Reply result order.
        sort: nil,
        # Match the source application.
        source: nil,
        # Resume one reply target from this cursor.
        start_cursor: nil,
        # Required for community_post_extractor & community_search.
        target_community_id: nil,
        # Community IDs processed as one collection job.
        target_community_ids: nil,
        # Required for list_follower_explorer, list_member_extractor &
        # list_post_extractor.
        target_list_id: nil,
        # List IDs processed as one collection job.
        target_list_ids: nil,
        # Mixed targets auto-routed within one job.
        targets: nil,
        # Required for space_explorer.
        target_space_id: nil,
        target_tweet_id: nil,
        # Tweet IDs processed as one collection job.
        target_tweet_ids: nil,
        target_username: nil,
        # Usernames processed as one collection job.
        target_usernames: nil,
        # Filter replies sent to a username (tweet_search_extractor)
        to_user: nil,
        # End date YYYY-MM-DD (tweet_search_extractor)
        until_date: nil,
        # Reply end time as ISO 8601 or Unix seconds.
        until_time: nil,
        # URL substring or domain filter (tweet_search_extractor)
        url: nil,
        # Required username text.
        username_contains: nil,
        # Only verified authors (tweet_search_extractor)
        verified_only: nil,
        # Exact profile verification type.
        verified_type: nil,
        # Set the radius for the near filter.
        within: nil,
        # Match Tweets inside a recent time window.
        within_time: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            tool_type: XTwitterScraper::ExtractionRunParams::ToolType::OrSymbol,
            dry_run: T::Boolean,
            advanced_query: String,
            any_words: String,
            bio_contains: String,
            blue_verified_only: T::Boolean,
            bounding_box: String,
            card_name: String,
            cashtags: String,
            collection_strategy:
              XTwitterScraper::ExtractionRunParams::CollectionStrategy::OrSymbol,
            conversation_id: String,
            dedupe_across_targets: T::Boolean,
            dedupe_mode:
              XTwitterScraper::ExtractionRunParams::DedupeMode::OrSymbol,
            exact_phrase: String,
            exclude_original_author: T::Boolean,
            exclude_source: String,
            exclude_words: String,
            from_user: String,
            geocode: String,
            hashtags: String,
            has_location: T::Boolean,
            has_media_only: T::Boolean,
            has_website: T::Boolean,
            include_original_post: T::Boolean,
            include_search_terms: T::Boolean,
            include_target_metadata: T::Boolean,
            in_reply_to_tweet_id: String,
            language: String,
            list_id: String,
            location_contains: String,
            max_depth: Integer,
            max_followers: Integer,
            max_following: Integer,
            max_id: String,
            max_items_per_target: Integer,
            max_likes: Integer,
            max_pages_per_target: Integer,
            max_posts: Integer,
            max_quotes: Integer,
            max_replies: Integer,
            max_retweets: Integer,
            media_type:
              XTwitterScraper::ExtractionRunParams::MediaType::OrSymbol,
            mentioning: String,
            min_account_age_days: Integer,
            min_bookmarks: Integer,
            min_faves: Integer,
            min_followers: Integer,
            min_following: Integer,
            min_posts: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            min_views: Integer,
            native_retweets: T::Boolean,
            near: String,
            news: T::Boolean,
            overlap_mode: T::Boolean,
            place: String,
            place_country: String,
            point_radius: String,
            query_type:
              XTwitterScraper::ExtractionRunParams::QueryType::OrSymbol,
            quotes: XTwitterScraper::ExtractionRunParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            relation_targets:
              T::Array[XTwitterScraper::ExtractionRunParams::RelationTarget],
            replies: XTwitterScraper::ExtractionRunParams::Replies::OrSymbol,
            results_limit: Integer,
            retweets: XTwitterScraper::ExtractionRunParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            safe: T::Boolean,
            scope: XTwitterScraper::ExtractionRunParams::Scope::OrSymbol,
            search_queries: T::Array[String],
            search_query: String,
            since_date: Date,
            since_id: String,
            since_time:
              XTwitterScraper::ExtractionRunParams::SinceTime::Variants,
            sort: XTwitterScraper::ExtractionRunParams::Sort::OrSymbol,
            source: String,
            start_cursor: String,
            target_community_id: String,
            target_community_ids: T::Array[String],
            target_list_id: String,
            target_list_ids: T::Array[String],
            targets:
              T::Array[
                T.any(
                  String,
                  XTwitterScraper::ExtractionRunParams::Target::UnionMember1
                )
              ],
            target_space_id: String,
            target_tweet_id: String,
            target_tweet_ids: T::Array[String],
            target_username: String,
            target_usernames: T::Array[String],
            to_user: String,
            until_date: Date,
            until_time:
              XTwitterScraper::ExtractionRunParams::UntilTime::Variants,
            url: String,
            username_contains: String,
            verified_only: T::Boolean,
            verified_type: String,
            within: String,
            within_time: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Identifier for the extraction tool used to run a job.
      module ToolType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionRunParams::ToolType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ARTICLE_EXTRACTOR =
          T.let(
            :article_extractor,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        COMMUNITY_EXTRACTOR =
          T.let(
            :community_extractor,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        COMMUNITY_MODERATOR_EXPLORER =
          T.let(
            :community_moderator_explorer,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        COMMUNITY_POST_EXTRACTOR =
          T.let(
            :community_post_extractor,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        COMMUNITY_SEARCH =
          T.let(
            :community_search,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        FAVORITERS =
          T.let(
            :favoriters,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        FOLLOWER_EXPLORER =
          T.let(
            :follower_explorer,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        FOLLOWING_EXPLORER =
          T.let(
            :following_explorer,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        LIST_FOLLOWER_EXPLORER =
          T.let(
            :list_follower_explorer,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        LIST_MEMBER_EXTRACTOR =
          T.let(
            :list_member_extractor,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        LIST_POST_EXTRACTOR =
          T.let(
            :list_post_extractor,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        MENTION_EXTRACTOR =
          T.let(
            :mention_extractor,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        PEOPLE_SEARCH =
          T.let(
            :people_search,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        POST_EXTRACTOR =
          T.let(
            :post_extractor,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        QUOTE_EXTRACTOR =
          T.let(
            :quote_extractor,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        REPLY_EXTRACTOR =
          T.let(
            :reply_extractor,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        REPOST_EXTRACTOR =
          T.let(
            :repost_extractor,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        SPACE_EXPLORER =
          T.let(
            :space_explorer,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        THREAD_EXTRACTOR =
          T.let(
            :thread_extractor,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        TWEET_SEARCH_EXTRACTOR =
          T.let(
            :tweet_search_extractor,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        USER_LIKES =
          T.let(
            :user_likes,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        USER_MEDIA =
          T.let(
            :user_media,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )
        VERIFIED_FOLLOWER_EXPLORER =
          T.let(
            :verified_follower_explorer,
            XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionRunParams::ToolType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Reply collection strategy.
      module CollectionStrategy
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::ExtractionRunParams::CollectionStrategy
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO =
          T.let(
            :auto,
            XTwitterScraper::ExtractionRunParams::CollectionStrategy::TaggedSymbol
          )
        COMPLETE =
          T.let(
            :complete,
            XTwitterScraper::ExtractionRunParams::CollectionStrategy::TaggedSymbol
          )
        DIRECT =
          T.let(
            :direct,
            XTwitterScraper::ExtractionRunParams::CollectionStrategy::TaggedSymbol
          )
        SEARCH =
          T.let(
            :search,
            XTwitterScraper::ExtractionRunParams::CollectionStrategy::TaggedSymbol
          )
        THREAD =
          T.let(
            :thread,
            XTwitterScraper::ExtractionRunParams::CollectionStrategy::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionRunParams::CollectionStrategy::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Keep target duplicates, first rows, or merged overlap.
      module DedupeMode
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionRunParams::DedupeMode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NONE =
          T.let(
            :none,
            XTwitterScraper::ExtractionRunParams::DedupeMode::TaggedSymbol
          )
        FIRST =
          T.let(
            :first,
            XTwitterScraper::ExtractionRunParams::DedupeMode::TaggedSymbol
          )
        MERGE =
          T.let(
            :merge,
            XTwitterScraper::ExtractionRunParams::DedupeMode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionRunParams::DedupeMode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Media type filter (tweet_search_extractor)
      module MediaType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionRunParams::MediaType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        IMAGES =
          T.let(
            :images,
            XTwitterScraper::ExtractionRunParams::MediaType::TaggedSymbol
          )
        VIDEOS =
          T.let(
            :videos,
            XTwitterScraper::ExtractionRunParams::MediaType::TaggedSymbol
          )
        GIFS =
          T.let(
            :gifs,
            XTwitterScraper::ExtractionRunParams::MediaType::TaggedSymbol
          )
        MEDIA =
          T.let(
            :media,
            XTwitterScraper::ExtractionRunParams::MediaType::TaggedSymbol
          )
        LINKS =
          T.let(
            :links,
            XTwitterScraper::ExtractionRunParams::MediaType::TaggedSymbol
          )
        NONE =
          T.let(
            :none,
            XTwitterScraper::ExtractionRunParams::MediaType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionRunParams::MediaType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Search ranking applied to every query.
      module QueryType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionRunParams::QueryType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LATEST =
          T.let(
            :Latest,
            XTwitterScraper::ExtractionRunParams::QueryType::TaggedSymbol
          )
        TOP =
          T.let(
            :Top,
            XTwitterScraper::ExtractionRunParams::QueryType::TaggedSymbol
          )
        BOTH =
          T.let(
            :Both,
            XTwitterScraper::ExtractionRunParams::QueryType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionRunParams::QueryType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Quote mode (tweet_search_extractor)
      module Quotes
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionRunParams::Quotes)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INCLUDE =
          T.let(
            :include,
            XTwitterScraper::ExtractionRunParams::Quotes::TaggedSymbol
          )
        EXCLUDE =
          T.let(
            :exclude,
            XTwitterScraper::ExtractionRunParams::Quotes::TaggedSymbol
          )
        ONLY =
          T.let(
            :only,
            XTwitterScraper::ExtractionRunParams::Quotes::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::ExtractionRunParams::Quotes::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class RelationTarget < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::ExtractionRunParams::RelationTarget,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(
            XTwitterScraper::ExtractionRunParams::RelationTarget::Relation::OrSymbol
          )
        end
        attr_accessor :relation

        sig { returns(String) }
        attr_accessor :value

        # One target and relation in a mixed profile collection.
        sig do
          params(
            relation:
              XTwitterScraper::ExtractionRunParams::RelationTarget::Relation::OrSymbol,
            value: String
          ).returns(T.attached_class)
        end
        def self.new(relation:, value:)
        end

        sig do
          override.returns(
            {
              relation:
                XTwitterScraper::ExtractionRunParams::RelationTarget::Relation::OrSymbol,
              value: String
            }
          )
        end
        def to_hash
        end

        module Relation
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::ExtractionRunParams::RelationTarget::Relation
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COMMUNITY_MEMBERS =
            T.let(
              :community_members,
              XTwitterScraper::ExtractionRunParams::RelationTarget::Relation::TaggedSymbol
            )
          FOLLOWERS =
            T.let(
              :followers,
              XTwitterScraper::ExtractionRunParams::RelationTarget::Relation::TaggedSymbol
            )
          FOLLOWING =
            T.let(
              :following,
              XTwitterScraper::ExtractionRunParams::RelationTarget::Relation::TaggedSymbol
            )
          LIST_FOLLOWERS =
            T.let(
              :list_followers,
              XTwitterScraper::ExtractionRunParams::RelationTarget::Relation::TaggedSymbol
            )
          LIST_MEMBERS =
            T.let(
              :list_members,
              XTwitterScraper::ExtractionRunParams::RelationTarget::Relation::TaggedSymbol
            )
          VERIFIED_FOLLOWERS =
            T.let(
              :verified_followers,
              XTwitterScraper::ExtractionRunParams::RelationTarget::Relation::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::ExtractionRunParams::RelationTarget::Relation::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Reply mode (tweet_search_extractor)
      module Replies
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionRunParams::Replies)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INCLUDE =
          T.let(
            :include,
            XTwitterScraper::ExtractionRunParams::Replies::TaggedSymbol
          )
        EXCLUDE =
          T.let(
            :exclude,
            XTwitterScraper::ExtractionRunParams::Replies::TaggedSymbol
          )
        ONLY =
          T.let(
            :only,
            XTwitterScraper::ExtractionRunParams::Replies::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionRunParams::Replies::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Retweet mode (tweet_search_extractor)
      module Retweets
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionRunParams::Retweets)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INCLUDE =
          T.let(
            :include,
            XTwitterScraper::ExtractionRunParams::Retweets::TaggedSymbol
          )
        EXCLUDE =
          T.let(
            :exclude,
            XTwitterScraper::ExtractionRunParams::Retweets::TaggedSymbol
          )
        ONLY =
          T.let(
            :only,
            XTwitterScraper::ExtractionRunParams::Retweets::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionRunParams::Retweets::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Reply depth scope.
      module Scope
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionRunParams::Scope)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ALL =
          T.let(:all, XTwitterScraper::ExtractionRunParams::Scope::TaggedSymbol)
        DIRECT =
          T.let(
            :direct,
            XTwitterScraper::ExtractionRunParams::Scope::TaggedSymbol
          )
        NESTED =
          T.let(
            :nested,
            XTwitterScraper::ExtractionRunParams::Scope::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::ExtractionRunParams::Scope::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Reply start time as ISO 8601 or Unix seconds.
      module SinceTime
        extend XTwitterScraper::Internal::Type::Union

        Variants = T.type_alias { T.any(Time, Integer) }

        sig do
          override.returns(
            T::Array[XTwitterScraper::ExtractionRunParams::SinceTime::Variants]
          )
        end
        def self.variants
        end
      end

      # Reply result order.
      module Sort
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionRunParams::Sort)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RELEVANCE =
          T.let(
            :relevance,
            XTwitterScraper::ExtractionRunParams::Sort::TaggedSymbol
          )
        LATEST =
          T.let(
            :latest,
            XTwitterScraper::ExtractionRunParams::Sort::TaggedSymbol
          )
        OLDEST =
          T.let(
            :oldest,
            XTwitterScraper::ExtractionRunParams::Sort::TaggedSymbol
          )
        LIKES =
          T.let(
            :likes,
            XTwitterScraper::ExtractionRunParams::Sort::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::ExtractionRunParams::Sort::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # One auto-routed target in a mixed Tweet collection.
      module Target
        extend XTwitterScraper::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              String,
              XTwitterScraper::ExtractionRunParams::Target::UnionMember1
            )
          end

        class UnionMember1 < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig do
            returns(
              XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::OrSymbol
            )
          end
          attr_accessor :kind

          sig { returns(String) }
          attr_accessor :value

          sig do
            params(
              kind:
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::OrSymbol,
              value: String
            ).returns(T.attached_class)
          end
          def self.new(kind:, value:)
          end

          sig do
            override.returns(
              {
                kind:
                  XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::OrSymbol,
                value: String
              }
            )
          end
          def to_hash
          end

          module Kind
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FAVORITERS =
              T.let(
                :favoriters,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
              )
            LIST =
              T.let(
                :list,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
              )
            PROFILE =
              T.let(
                :profile,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
              )
            PROFILE_LIKES =
              T.let(
                :profile_likes,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
              )
            PROFILE_MEDIA =
              T.let(
                :profile_media,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
              )
            PROFILE_REPLIES =
              T.let(
                :profile_replies,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
              )
            QUOTES =
              T.let(
                :quotes,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
              )
            REPLIES =
              T.let(
                :replies,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
              )
            RETWEETERS =
              T.let(
                :retweeters,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
              )
            SEARCH =
              T.let(
                :search,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
              )
            THREAD =
              T.let(
                :thread,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
              )
            TWEET =
              T.let(
                :tweet,
                XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::ExtractionRunParams::Target::UnionMember1::Kind::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[XTwitterScraper::ExtractionRunParams::Target::Variants]
          )
        end
        def self.variants
        end
      end

      # Reply end time as ISO 8601 or Unix seconds.
      module UntilTime
        extend XTwitterScraper::Internal::Type::Union

        Variants = T.type_alias { T.any(Time, Integer) }

        sig do
          override.returns(
            T::Array[XTwitterScraper::ExtractionRunParams::UntilTime::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
