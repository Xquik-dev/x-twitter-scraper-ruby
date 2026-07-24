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

      # Geo bounding box, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :bounding_box

      sig { params(bounding_box: String).void }
      attr_writer :bounding_box

      # Cashtags separated by spaces, commas, or lines. (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :cashtags

      sig { params(cashtags: String).void }
      attr_writer :cashtags

      # Conversation ID filter (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :conversation_id

      sig { params(conversation_id: String).void }
      attr_writer :conversation_id

      # Exact phrase to match (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :exact_phrase

      sig { params(exact_phrase: String).void }
      attr_writer :exact_phrase

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

      # Hashtags separated by spaces, commas, or lines. (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :hashtags

      sig { params(hashtags: String).void }
      attr_writer :hashtags

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

      # Minimum likes threshold (tweet_search_extractor)
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_faves

      sig { params(min_faves: Integer).void }
      attr_writer :min_faves

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

      # Required for community_post_extractor & community_search.
      sig { returns(T.nilable(String)) }
      attr_reader :target_community_id

      sig { params(target_community_id: String).void }
      attr_writer :target_community_id

      # Required for list_follower_explorer, list_member_extractor &
      # list_post_extractor.
      sig { returns(T.nilable(String)) }
      attr_reader :target_list_id

      sig { params(target_list_id: String).void }
      attr_writer :target_list_id

      # Required for space_explorer.
      sig { returns(T.nilable(String)) }
      attr_reader :target_space_id

      sig { params(target_space_id: String).void }
      attr_writer :target_space_id

      sig { returns(T.nilable(String)) }
      attr_reader :target_tweet_id

      sig { params(target_tweet_id: String).void }
      attr_writer :target_tweet_id

      sig { returns(T.nilable(String)) }
      attr_reader :target_username

      sig { params(target_username: String).void }
      attr_writer :target_username

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

      # URL substring or domain filter (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # Only verified authors (tweet_search_extractor)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :verified_only

      sig { params(verified_only: T::Boolean).void }
      attr_writer :verified_only

      sig do
        params(
          tool_type: XTwitterScraper::ExtractionRunParams::ToolType::OrSymbol,
          advanced_query: String,
          any_words: String,
          bounding_box: String,
          cashtags: String,
          conversation_id: String,
          exact_phrase: String,
          exclude_words: String,
          from_user: String,
          hashtags: String,
          in_reply_to_tweet_id: String,
          language: String,
          list_id: String,
          media_type: XTwitterScraper::ExtractionRunParams::MediaType::OrSymbol,
          mentioning: String,
          min_faves: Integer,
          min_quotes: Integer,
          min_replies: Integer,
          min_retweets: Integer,
          place: String,
          place_country: String,
          point_radius: String,
          quotes: XTwitterScraper::ExtractionRunParams::Quotes::OrSymbol,
          quotes_of_tweet_id: String,
          replies: XTwitterScraper::ExtractionRunParams::Replies::OrSymbol,
          results_limit: Integer,
          retweets: XTwitterScraper::ExtractionRunParams::Retweets::OrSymbol,
          retweets_of_tweet_id: String,
          search_query: String,
          since_date: Date,
          target_community_id: String,
          target_list_id: String,
          target_space_id: String,
          target_tweet_id: String,
          target_username: String,
          to_user: String,
          until_date: Date,
          url: String,
          verified_only: T::Boolean,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Identifier for the extraction tool used to run a job.
        tool_type:,
        # Raw advanced search query appended as-is (tweet_search_extractor)
        advanced_query: nil,
        # Words or quoted phrases where any one can match. Separate with spaces, commas,
        # or lines. (tweet_search_extractor)
        any_words: nil,
        # Geo bounding box, e.g. -74.1 40.6 -73.9 40.8 (tweet_search_extractor)
        bounding_box: nil,
        # Cashtags separated by spaces, commas, or lines. (tweet_search_extractor)
        cashtags: nil,
        # Conversation ID filter (tweet_search_extractor)
        conversation_id: nil,
        # Exact phrase to match (tweet_search_extractor)
        exact_phrase: nil,
        # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
        # (tweet_search_extractor)
        exclude_words: nil,
        # Filter by author username (tweet_search_extractor)
        from_user: nil,
        # Hashtags separated by spaces, commas, or lines. (tweet_search_extractor)
        hashtags: nil,
        # Only replies to this tweet ID (tweet_search_extractor)
        in_reply_to_tweet_id: nil,
        # Language code filter (tweet_search_extractor)
        language: nil,
        # Search within a list ID (tweet_search_extractor)
        list_id: nil,
        # Media type filter (tweet_search_extractor)
        media_type: nil,
        # Filter tweets mentioning a username (tweet_search_extractor)
        mentioning: nil,
        # Minimum likes threshold (tweet_search_extractor)
        min_faves: nil,
        # Minimum quote count threshold (tweet_search_extractor)
        min_quotes: nil,
        # Minimum replies threshold (tweet_search_extractor)
        min_replies: nil,
        # Minimum retweets threshold (tweet_search_extractor)
        min_retweets: nil,
        # Search within a place ID (tweet_search_extractor)
        place: nil,
        # Search within a country code (tweet_search_extractor)
        place_country: nil,
        # Geo point radius, e.g. -73.99 40.73 25mi (tweet_search_extractor)
        point_radius: nil,
        # Quote mode (tweet_search_extractor)
        quotes: nil,
        # Only quotes of this tweet ID (tweet_search_extractor)
        quotes_of_tweet_id: nil,
        # Reply mode (tweet_search_extractor)
        replies: nil,
        # Maximum number of results to extract. When set, the extraction stops after
        # reaching this limit.
        results_limit: nil,
        # Retweet mode (tweet_search_extractor)
        retweets: nil,
        # Only retweets of this tweet ID (tweet_search_extractor)
        retweets_of_tweet_id: nil,
        # Required for tweet_search_extractor & community_search.
        search_query: nil,
        # Start date YYYY-MM-DD (tweet_search_extractor)
        since_date: nil,
        # Required for community_post_extractor & community_search.
        target_community_id: nil,
        # Required for list_follower_explorer, list_member_extractor &
        # list_post_extractor.
        target_list_id: nil,
        # Required for space_explorer.
        target_space_id: nil,
        target_tweet_id: nil,
        target_username: nil,
        # Filter replies sent to a username (tweet_search_extractor)
        to_user: nil,
        # End date YYYY-MM-DD (tweet_search_extractor)
        until_date: nil,
        # URL substring or domain filter (tweet_search_extractor)
        url: nil,
        # Only verified authors (tweet_search_extractor)
        verified_only: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            tool_type: XTwitterScraper::ExtractionRunParams::ToolType::OrSymbol,
            advanced_query: String,
            any_words: String,
            bounding_box: String,
            cashtags: String,
            conversation_id: String,
            exact_phrase: String,
            exclude_words: String,
            from_user: String,
            hashtags: String,
            in_reply_to_tweet_id: String,
            language: String,
            list_id: String,
            media_type:
              XTwitterScraper::ExtractionRunParams::MediaType::OrSymbol,
            mentioning: String,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            place: String,
            place_country: String,
            point_radius: String,
            quotes: XTwitterScraper::ExtractionRunParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies: XTwitterScraper::ExtractionRunParams::Replies::OrSymbol,
            results_limit: Integer,
            retweets: XTwitterScraper::ExtractionRunParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            search_query: String,
            since_date: Date,
            target_community_id: String,
            target_list_id: String,
            target_space_id: String,
            target_tweet_id: String,
            target_username: String,
            to_user: String,
            until_date: Date,
            url: String,
            verified_only: T::Boolean,
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
    end
  end
end
