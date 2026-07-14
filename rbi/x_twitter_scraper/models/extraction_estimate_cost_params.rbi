# typed: strong

module XTwitterScraper
  module Models
    class ExtractionEstimateCostParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::ExtractionEstimateCostParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Identifier for the extraction tool used to run a job.
      sig do
        returns(
          XTwitterScraper::ExtractionEstimateCostParams::ToolType::OrSymbol
        )
      end
      attr_accessor :tool_type

      # Raw advanced query string appended to the estimate (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :advanced_query

      sig { params(advanced_query: String).void }
      attr_writer :advanced_query

      # Alternative words or quoted phrases for estimated results. Separate with spaces,
      # commas, or lines.
      sig { returns(T.nilable(String)) }
      attr_reader :any_words

      sig { params(any_words: String).void }
      attr_writer :any_words

      # Geo bounding box used for estimation, e.g. -74.1 40.6 -73.9 40.8
      # (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :bounding_box

      sig { params(bounding_box: String).void }
      attr_writer :bounding_box

      # Cashtags applied to the estimate, separated by spaces, commas, or lines.
      sig { returns(T.nilable(String)) }
      attr_reader :cashtags

      sig { params(cashtags: String).void }
      attr_writer :cashtags

      # Conversation ID filter used for estimation (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :conversation_id

      sig { params(conversation_id: String).void }
      attr_writer :conversation_id

      # Exact phrase filter for search estimation
      sig { returns(T.nilable(String)) }
      attr_reader :exact_phrase

      sig { params(exact_phrase: String).void }
      attr_writer :exact_phrase

      # Words or quoted phrases excluded from estimated results. Separate with spaces,
      # commas, or lines.
      sig { returns(T.nilable(String)) }
      attr_reader :exclude_words

      sig { params(exclude_words: String).void }
      attr_writer :exclude_words

      # Estimate only tweets from this author username (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :from_user

      sig { params(from_user: String).void }
      attr_writer :from_user

      # Hashtags applied to the estimate, separated by spaces, commas, or lines.
      sig { returns(T.nilable(String)) }
      attr_reader :hashtags

      sig { params(hashtags: String).void }
      attr_writer :hashtags

      # Estimate only replies to this tweet ID (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :in_reply_to_tweet_id

      sig { params(in_reply_to_tweet_id: String).void }
      attr_writer :in_reply_to_tweet_id

      # Language code used for estimate filtering (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :language

      sig { params(language: String).void }
      attr_writer :language

      # Estimate search results within this list ID (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :list_id

      sig { params(list_id: String).void }
      attr_writer :list_id

      # Media type used for estimate filtering (tweet_search_extractor)
      sig do
        returns(
          T.nilable(
            XTwitterScraper::ExtractionEstimateCostParams::MediaType::OrSymbol
          )
        )
      end
      attr_reader :media_type

      sig do
        params(
          media_type:
            XTwitterScraper::ExtractionEstimateCostParams::MediaType::OrSymbol
        ).void
      end
      attr_writer :media_type

      # Estimate tweets mentioning this username (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :mentioning

      sig { params(mentioning: String).void }
      attr_writer :mentioning

      # Minimum likes threshold for estimated results (tweet_search_extractor)
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_faves

      sig { params(min_faves: Integer).void }
      attr_writer :min_faves

      # Minimum quote count threshold for estimated results (tweet_search_extractor)
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_quotes

      sig { params(min_quotes: Integer).void }
      attr_writer :min_quotes

      # Minimum replies threshold for estimated results (tweet_search_extractor)
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_replies

      sig { params(min_replies: Integer).void }
      attr_writer :min_replies

      # Minimum retweets threshold for estimated results (tweet_search_extractor)
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_retweets

      sig { params(min_retweets: Integer).void }
      attr_writer :min_retweets

      # Estimate search results within this place ID (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :place

      sig { params(place: String).void }
      attr_writer :place

      # Estimate search results within this country code (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :place_country

      sig { params(place_country: String).void }
      attr_writer :place_country

      # Geo point radius used for estimation, e.g. -73.99 40.73 25mi
      # (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :point_radius

      sig { params(point_radius: String).void }
      attr_writer :point_radius

      # Quote mode used for estimation (tweet_search_extractor)
      sig do
        returns(
          T.nilable(
            XTwitterScraper::ExtractionEstimateCostParams::Quotes::OrSymbol
          )
        )
      end
      attr_reader :quotes

      sig do
        params(
          quotes:
            XTwitterScraper::ExtractionEstimateCostParams::Quotes::OrSymbol
        ).void
      end
      attr_writer :quotes

      # Estimate only quotes of this tweet ID (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :quotes_of_tweet_id

      sig { params(quotes_of_tweet_id: String).void }
      attr_writer :quotes_of_tweet_id

      # Reply mode used for estimation (tweet_search_extractor)
      sig do
        returns(
          T.nilable(
            XTwitterScraper::ExtractionEstimateCostParams::Replies::OrSymbol
          )
        )
      end
      attr_reader :replies

      sig do
        params(
          replies:
            XTwitterScraper::ExtractionEstimateCostParams::Replies::OrSymbol
        ).void
      end
      attr_writer :replies

      # Maximum number of results to estimate. When set, the estimate caps projected
      # results to this value.
      sig { returns(T.nilable(Integer)) }
      attr_reader :results_limit

      sig { params(results_limit: Integer).void }
      attr_writer :results_limit

      # Retweet mode used for estimation (tweet_search_extractor)
      sig do
        returns(
          T.nilable(
            XTwitterScraper::ExtractionEstimateCostParams::Retweets::OrSymbol
          )
        )
      end
      attr_reader :retweets

      sig do
        params(
          retweets:
            XTwitterScraper::ExtractionEstimateCostParams::Retweets::OrSymbol
        ).void
      end
      attr_writer :retweets

      # Estimate only retweets of this tweet ID (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :retweets_of_tweet_id

      sig { params(retweets_of_tweet_id: String).void }
      attr_writer :retweets_of_tweet_id

      # Required for tweet_search_extractor & community_search.
      sig { returns(T.nilable(String)) }
      attr_reader :search_query

      sig { params(search_query: String).void }
      attr_writer :search_query

      # Estimate start date in YYYY-MM-DD format (tweet_search_extractor)
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

      # Estimate replies sent to this username (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :to_user

      sig { params(to_user: String).void }
      attr_writer :to_user

      # Estimate end date in YYYY-MM-DD format (tweet_search_extractor)
      sig { returns(T.nilable(Date)) }
      attr_reader :until_date

      sig { params(until_date: Date).void }
      attr_writer :until_date

      # URL substring or domain filter used for estimation (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # Estimate only verified authors (tweet_search_extractor)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :verified_only

      sig { params(verified_only: T::Boolean).void }
      attr_writer :verified_only

      sig do
        params(
          tool_type:
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::OrSymbol,
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
            XTwitterScraper::ExtractionEstimateCostParams::MediaType::OrSymbol,
          mentioning: String,
          min_faves: Integer,
          min_quotes: Integer,
          min_replies: Integer,
          min_retweets: Integer,
          place: String,
          place_country: String,
          point_radius: String,
          quotes:
            XTwitterScraper::ExtractionEstimateCostParams::Quotes::OrSymbol,
          quotes_of_tweet_id: String,
          replies:
            XTwitterScraper::ExtractionEstimateCostParams::Replies::OrSymbol,
          results_limit: Integer,
          retweets:
            XTwitterScraper::ExtractionEstimateCostParams::Retweets::OrSymbol,
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
        # Raw advanced query string appended to the estimate (tweet_search_extractor)
        advanced_query: nil,
        # Alternative words or quoted phrases for estimated results. Separate with spaces,
        # commas, or lines.
        any_words: nil,
        # Geo bounding box used for estimation, e.g. -74.1 40.6 -73.9 40.8
        # (tweet_search_extractor)
        bounding_box: nil,
        # Cashtags applied to the estimate, separated by spaces, commas, or lines.
        cashtags: nil,
        # Conversation ID filter used for estimation (tweet_search_extractor)
        conversation_id: nil,
        # Exact phrase filter for search estimation
        exact_phrase: nil,
        # Words or quoted phrases excluded from estimated results. Separate with spaces,
        # commas, or lines.
        exclude_words: nil,
        # Estimate only tweets from this author username (tweet_search_extractor)
        from_user: nil,
        # Hashtags applied to the estimate, separated by spaces, commas, or lines.
        hashtags: nil,
        # Estimate only replies to this tweet ID (tweet_search_extractor)
        in_reply_to_tweet_id: nil,
        # Language code used for estimate filtering (tweet_search_extractor)
        language: nil,
        # Estimate search results within this list ID (tweet_search_extractor)
        list_id: nil,
        # Media type used for estimate filtering (tweet_search_extractor)
        media_type: nil,
        # Estimate tweets mentioning this username (tweet_search_extractor)
        mentioning: nil,
        # Minimum likes threshold for estimated results (tweet_search_extractor)
        min_faves: nil,
        # Minimum quote count threshold for estimated results (tweet_search_extractor)
        min_quotes: nil,
        # Minimum replies threshold for estimated results (tweet_search_extractor)
        min_replies: nil,
        # Minimum retweets threshold for estimated results (tweet_search_extractor)
        min_retweets: nil,
        # Estimate search results within this place ID (tweet_search_extractor)
        place: nil,
        # Estimate search results within this country code (tweet_search_extractor)
        place_country: nil,
        # Geo point radius used for estimation, e.g. -73.99 40.73 25mi
        # (tweet_search_extractor)
        point_radius: nil,
        # Quote mode used for estimation (tweet_search_extractor)
        quotes: nil,
        # Estimate only quotes of this tweet ID (tweet_search_extractor)
        quotes_of_tweet_id: nil,
        # Reply mode used for estimation (tweet_search_extractor)
        replies: nil,
        # Maximum number of results to estimate. When set, the estimate caps projected
        # results to this value.
        results_limit: nil,
        # Retweet mode used for estimation (tweet_search_extractor)
        retweets: nil,
        # Estimate only retweets of this tweet ID (tweet_search_extractor)
        retweets_of_tweet_id: nil,
        # Required for tweet_search_extractor & community_search.
        search_query: nil,
        # Estimate start date in YYYY-MM-DD format (tweet_search_extractor)
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
        # Estimate replies sent to this username (tweet_search_extractor)
        to_user: nil,
        # Estimate end date in YYYY-MM-DD format (tweet_search_extractor)
        until_date: nil,
        # URL substring or domain filter used for estimation (tweet_search_extractor)
        url: nil,
        # Estimate only verified authors (tweet_search_extractor)
        verified_only: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            tool_type:
              XTwitterScraper::ExtractionEstimateCostParams::ToolType::OrSymbol,
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
              XTwitterScraper::ExtractionEstimateCostParams::MediaType::OrSymbol,
            mentioning: String,
            min_faves: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            place: String,
            place_country: String,
            point_radius: String,
            quotes:
              XTwitterScraper::ExtractionEstimateCostParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::ExtractionEstimateCostParams::Replies::OrSymbol,
            results_limit: Integer,
            retweets:
              XTwitterScraper::ExtractionEstimateCostParams::Retweets::OrSymbol,
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
            T.all(
              Symbol,
              XTwitterScraper::ExtractionEstimateCostParams::ToolType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ARTICLE_EXTRACTOR =
          T.let(
            :article_extractor,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        COMMUNITY_EXTRACTOR =
          T.let(
            :community_extractor,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        COMMUNITY_MODERATOR_EXPLORER =
          T.let(
            :community_moderator_explorer,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        COMMUNITY_POST_EXTRACTOR =
          T.let(
            :community_post_extractor,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        COMMUNITY_SEARCH =
          T.let(
            :community_search,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        FAVORITERS =
          T.let(
            :favoriters,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        FOLLOWER_EXPLORER =
          T.let(
            :follower_explorer,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        FOLLOWING_EXPLORER =
          T.let(
            :following_explorer,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        LIST_FOLLOWER_EXPLORER =
          T.let(
            :list_follower_explorer,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        LIST_MEMBER_EXTRACTOR =
          T.let(
            :list_member_extractor,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        LIST_POST_EXTRACTOR =
          T.let(
            :list_post_extractor,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        MENTION_EXTRACTOR =
          T.let(
            :mention_extractor,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        PEOPLE_SEARCH =
          T.let(
            :people_search,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        POST_EXTRACTOR =
          T.let(
            :post_extractor,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        QUOTE_EXTRACTOR =
          T.let(
            :quote_extractor,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        REPLY_EXTRACTOR =
          T.let(
            :reply_extractor,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        REPOST_EXTRACTOR =
          T.let(
            :repost_extractor,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        SPACE_EXPLORER =
          T.let(
            :space_explorer,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        THREAD_EXTRACTOR =
          T.let(
            :thread_extractor,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        TWEET_SEARCH_EXTRACTOR =
          T.let(
            :tweet_search_extractor,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        USER_LIKES =
          T.let(
            :user_likes,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        USER_MEDIA =
          T.let(
            :user_media,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )
        VERIFIED_FOLLOWER_EXPLORER =
          T.let(
            :verified_follower_explorer,
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionEstimateCostParams::ToolType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Media type used for estimate filtering (tweet_search_extractor)
      module MediaType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::ExtractionEstimateCostParams::MediaType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        IMAGES =
          T.let(
            :images,
            XTwitterScraper::ExtractionEstimateCostParams::MediaType::TaggedSymbol
          )
        VIDEOS =
          T.let(
            :videos,
            XTwitterScraper::ExtractionEstimateCostParams::MediaType::TaggedSymbol
          )
        GIFS =
          T.let(
            :gifs,
            XTwitterScraper::ExtractionEstimateCostParams::MediaType::TaggedSymbol
          )
        MEDIA =
          T.let(
            :media,
            XTwitterScraper::ExtractionEstimateCostParams::MediaType::TaggedSymbol
          )
        LINKS =
          T.let(
            :links,
            XTwitterScraper::ExtractionEstimateCostParams::MediaType::TaggedSymbol
          )
        NONE =
          T.let(
            :none,
            XTwitterScraper::ExtractionEstimateCostParams::MediaType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionEstimateCostParams::MediaType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Quote mode used for estimation (tweet_search_extractor)
      module Quotes
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionEstimateCostParams::Quotes)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INCLUDE =
          T.let(
            :include,
            XTwitterScraper::ExtractionEstimateCostParams::Quotes::TaggedSymbol
          )
        EXCLUDE =
          T.let(
            :exclude,
            XTwitterScraper::ExtractionEstimateCostParams::Quotes::TaggedSymbol
          )
        ONLY =
          T.let(
            :only,
            XTwitterScraper::ExtractionEstimateCostParams::Quotes::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionEstimateCostParams::Quotes::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Reply mode used for estimation (tweet_search_extractor)
      module Replies
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::ExtractionEstimateCostParams::Replies
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INCLUDE =
          T.let(
            :include,
            XTwitterScraper::ExtractionEstimateCostParams::Replies::TaggedSymbol
          )
        EXCLUDE =
          T.let(
            :exclude,
            XTwitterScraper::ExtractionEstimateCostParams::Replies::TaggedSymbol
          )
        ONLY =
          T.let(
            :only,
            XTwitterScraper::ExtractionEstimateCostParams::Replies::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionEstimateCostParams::Replies::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Retweet mode used for estimation (tweet_search_extractor)
      module Retweets
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::ExtractionEstimateCostParams::Retweets
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INCLUDE =
          T.let(
            :include,
            XTwitterScraper::ExtractionEstimateCostParams::Retweets::TaggedSymbol
          )
        EXCLUDE =
          T.let(
            :exclude,
            XTwitterScraper::ExtractionEstimateCostParams::Retweets::TaggedSymbol
          )
        ONLY =
          T.let(
            :only,
            XTwitterScraper::ExtractionEstimateCostParams::Retweets::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionEstimateCostParams::Retweets::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
