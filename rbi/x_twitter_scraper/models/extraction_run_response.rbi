# typed: strong

module XTwitterScraper
  module Models
    class ExtractionRunResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ExtractionRunResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig do
        returns(
          XTwitterScraper::Models::ExtractionRunResponse::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      # Identifier for the extraction tool used to run a job.
      sig do
        returns(
          XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
        )
      end
      attr_accessor :tool_type

      sig do
        params(
          id: String,
          status:
            XTwitterScraper::Models::ExtractionRunResponse::Status::OrSymbol,
          tool_type:
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        status:,
        # Identifier for the extraction tool used to run a job.
        tool_type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            status:
              XTwitterScraper::Models::ExtractionRunResponse::Status::TaggedSymbol,
            tool_type:
              XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Status
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::ExtractionRunResponse::Status
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RUNNING =
          T.let(
            :running,
            XTwitterScraper::Models::ExtractionRunResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::ExtractionRunResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Identifier for the extraction tool used to run a job.
      module ToolType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::ExtractionRunResponse::ToolType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ARTICLE_EXTRACTOR =
          T.let(
            :article_extractor,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        COMMUNITY_EXTRACTOR =
          T.let(
            :community_extractor,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        COMMUNITY_MODERATOR_EXPLORER =
          T.let(
            :community_moderator_explorer,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        COMMUNITY_POST_EXTRACTOR =
          T.let(
            :community_post_extractor,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        COMMUNITY_SEARCH =
          T.let(
            :community_search,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        FOLLOWER_EXPLORER =
          T.let(
            :follower_explorer,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        FOLLOWING_EXPLORER =
          T.let(
            :following_explorer,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        LIST_FOLLOWER_EXPLORER =
          T.let(
            :list_follower_explorer,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        LIST_MEMBER_EXTRACTOR =
          T.let(
            :list_member_extractor,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        LIST_POST_EXTRACTOR =
          T.let(
            :list_post_extractor,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        MENTION_EXTRACTOR =
          T.let(
            :mention_extractor,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        PEOPLE_SEARCH =
          T.let(
            :people_search,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        POST_EXTRACTOR =
          T.let(
            :post_extractor,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        QUOTE_EXTRACTOR =
          T.let(
            :quote_extractor,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        REPLY_EXTRACTOR =
          T.let(
            :reply_extractor,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        REPOST_EXTRACTOR =
          T.let(
            :repost_extractor,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        SPACE_EXPLORER =
          T.let(
            :space_explorer,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        THREAD_EXTRACTOR =
          T.let(
            :thread_extractor,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        TWEET_SEARCH_EXTRACTOR =
          T.let(
            :tweet_search_extractor,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        VERIFIED_FOLLOWER_EXPLORER =
          T.let(
            :verified_follower_explorer,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
