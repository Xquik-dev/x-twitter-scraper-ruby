# typed: strong

module XTwitterScraper
  module Models
    class ExtractionListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::ExtractionListParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Cursor for pagination
      sig { returns(T.nilable(String)) }
      attr_reader :after

      sig { params(after: String).void }
      attr_writer :after

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        returns(
          T.nilable(XTwitterScraper::ExtractionListParams::Status::OrSymbol)
        )
      end
      attr_reader :status

      sig do
        params(
          status: XTwitterScraper::ExtractionListParams::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig do
        returns(
          T.nilable(XTwitterScraper::ExtractionListParams::ToolType::OrSymbol)
        )
      end
      attr_reader :tool_type

      sig do
        params(
          tool_type: XTwitterScraper::ExtractionListParams::ToolType::OrSymbol
        ).void
      end
      attr_writer :tool_type

      sig do
        params(
          after: String,
          limit: Integer,
          status: XTwitterScraper::ExtractionListParams::Status::OrSymbol,
          tool_type: XTwitterScraper::ExtractionListParams::ToolType::OrSymbol,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor for pagination
        after: nil,
        limit: nil,
        status: nil,
        tool_type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after: String,
            limit: Integer,
            status: XTwitterScraper::ExtractionListParams::Status::OrSymbol,
            tool_type:
              XTwitterScraper::ExtractionListParams::ToolType::OrSymbol,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Status
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionListParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RUNNING =
          T.let(
            :running,
            XTwitterScraper::ExtractionListParams::Status::TaggedSymbol
          )
        COMPLETED =
          T.let(
            :completed,
            XTwitterScraper::ExtractionListParams::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            XTwitterScraper::ExtractionListParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionListParams::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      module ToolType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::ExtractionListParams::ToolType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ARTICLE_EXTRACTOR =
          T.let(
            :article_extractor,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        COMMUNITY_EXTRACTOR =
          T.let(
            :community_extractor,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        COMMUNITY_MODERATOR_EXPLORER =
          T.let(
            :community_moderator_explorer,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        COMMUNITY_POST_EXTRACTOR =
          T.let(
            :community_post_extractor,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        COMMUNITY_SEARCH =
          T.let(
            :community_search,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        FOLLOWER_EXPLORER =
          T.let(
            :follower_explorer,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        FOLLOWING_EXPLORER =
          T.let(
            :following_explorer,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        LIST_FOLLOWER_EXPLORER =
          T.let(
            :list_follower_explorer,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        LIST_MEMBER_EXTRACTOR =
          T.let(
            :list_member_extractor,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        LIST_POST_EXTRACTOR =
          T.let(
            :list_post_extractor,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        MENTION_EXTRACTOR =
          T.let(
            :mention_extractor,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        PEOPLE_SEARCH =
          T.let(
            :people_search,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        POST_EXTRACTOR =
          T.let(
            :post_extractor,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        QUOTE_EXTRACTOR =
          T.let(
            :quote_extractor,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        REPLY_EXTRACTOR =
          T.let(
            :reply_extractor,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        REPOST_EXTRACTOR =
          T.let(
            :repost_extractor,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        SPACE_EXPLORER =
          T.let(
            :space_explorer,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        THREAD_EXTRACTOR =
          T.let(
            :thread_extractor,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        TWEET_SEARCH_EXTRACTOR =
          T.let(
            :tweet_search_extractor,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )
        VERIFIED_FOLLOWER_EXPLORER =
          T.let(
            :verified_follower_explorer,
            XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionListParams::ToolType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
