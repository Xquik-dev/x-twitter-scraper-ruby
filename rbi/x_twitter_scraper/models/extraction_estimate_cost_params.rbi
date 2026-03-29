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

      sig do
        returns(
          XTwitterScraper::ExtractionEstimateCostParams::ToolType::OrSymbol
        )
      end
      attr_accessor :tool_type

      # Raw advanced search query appended as-is (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :advanced_query

      sig { params(advanced_query: String).void }
      attr_writer :advanced_query

      # Exact phrase to match (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :exact_phrase

      sig { params(exact_phrase: String).void }
      attr_writer :exact_phrase

      # Words to exclude from results (tweet_search_extractor)
      sig { returns(T.nilable(String)) }
      attr_reader :exclude_words

      sig { params(exclude_words: String).void }
      attr_writer :exclude_words

      sig { returns(T.nilable(String)) }
      attr_reader :search_query

      sig { params(search_query: String).void }
      attr_writer :search_query

      sig { returns(T.nilable(String)) }
      attr_reader :target_community_id

      sig { params(target_community_id: String).void }
      attr_writer :target_community_id

      sig { returns(T.nilable(String)) }
      attr_reader :target_list_id

      sig { params(target_list_id: String).void }
      attr_writer :target_list_id

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

      sig do
        params(
          tool_type:
            XTwitterScraper::ExtractionEstimateCostParams::ToolType::OrSymbol,
          advanced_query: String,
          exact_phrase: String,
          exclude_words: String,
          search_query: String,
          target_community_id: String,
          target_list_id: String,
          target_space_id: String,
          target_tweet_id: String,
          target_username: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        tool_type:,
        # Raw advanced search query appended as-is (tweet_search_extractor)
        advanced_query: nil,
        # Exact phrase to match (tweet_search_extractor)
        exact_phrase: nil,
        # Words to exclude from results (tweet_search_extractor)
        exclude_words: nil,
        search_query: nil,
        target_community_id: nil,
        target_list_id: nil,
        target_space_id: nil,
        target_tweet_id: nil,
        target_username: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            tool_type:
              XTwitterScraper::ExtractionEstimateCostParams::ToolType::OrSymbol,
            advanced_query: String,
            exact_phrase: String,
            exclude_words: String,
            search_query: String,
            target_community_id: String,
            target_list_id: String,
            target_space_id: String,
            target_tweet_id: String,
            target_username: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

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
    end
  end
end
