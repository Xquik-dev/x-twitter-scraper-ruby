# typed: strong

module XTwitterScraper
  module Models
    class ExtractionJob < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::ExtractionJob,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(XTwitterScraper::ExtractionJob::Status::OrSymbol) }
      attr_accessor :status

      # Identifier for the extraction tool used to run a job.
      sig { returns(XTwitterScraper::ExtractionJob::ToolType::OrSymbol) }
      attr_accessor :tool_type

      sig { returns(Integer) }
      attr_accessor :total_results

      sig { returns(T.nilable(Time)) }
      attr_reader :completed_at

      sig { params(completed_at: Time).void }
      attr_writer :completed_at

      # Extraction job tracking status, tool type, and result count.
      sig do
        params(
          id: String,
          created_at: Time,
          status: XTwitterScraper::ExtractionJob::Status::OrSymbol,
          tool_type: XTwitterScraper::ExtractionJob::ToolType::OrSymbol,
          total_results: Integer,
          completed_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        status:,
        # Identifier for the extraction tool used to run a job.
        tool_type:,
        total_results:,
        completed_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            status: XTwitterScraper::ExtractionJob::Status::OrSymbol,
            tool_type: XTwitterScraper::ExtractionJob::ToolType::OrSymbol,
            total_results: Integer,
            completed_at: Time
          }
        )
      end
      def to_hash
      end

      module Status
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::ExtractionJob::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RUNNING =
          T.let(:running, XTwitterScraper::ExtractionJob::Status::TaggedSymbol)
        COMPLETED =
          T.let(
            :completed,
            XTwitterScraper::ExtractionJob::Status::TaggedSymbol
          )
        FAILED =
          T.let(:failed, XTwitterScraper::ExtractionJob::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[XTwitterScraper::ExtractionJob::Status::TaggedSymbol]
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
            T.all(Symbol, XTwitterScraper::ExtractionJob::ToolType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ARTICLE_EXTRACTOR =
          T.let(
            :article_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        COMMUNITY_EXTRACTOR =
          T.let(
            :community_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        COMMUNITY_MODERATOR_EXPLORER =
          T.let(
            :community_moderator_explorer,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        COMMUNITY_POST_EXTRACTOR =
          T.let(
            :community_post_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        COMMUNITY_SEARCH =
          T.let(
            :community_search,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        FOLLOWER_EXPLORER =
          T.let(
            :follower_explorer,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        FOLLOWING_EXPLORER =
          T.let(
            :following_explorer,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        LIST_FOLLOWER_EXPLORER =
          T.let(
            :list_follower_explorer,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        LIST_MEMBER_EXTRACTOR =
          T.let(
            :list_member_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        LIST_POST_EXTRACTOR =
          T.let(
            :list_post_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        MENTION_EXTRACTOR =
          T.let(
            :mention_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        PEOPLE_SEARCH =
          T.let(
            :people_search,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        POST_EXTRACTOR =
          T.let(
            :post_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        QUOTE_EXTRACTOR =
          T.let(
            :quote_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        REPLY_EXTRACTOR =
          T.let(
            :reply_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        REPOST_EXTRACTOR =
          T.let(
            :repost_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        SPACE_EXPLORER =
          T.let(
            :space_explorer,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        THREAD_EXTRACTOR =
          T.let(
            :thread_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        TWEET_SEARCH_EXTRACTOR =
          T.let(
            :tweet_search_extractor,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )
        VERIFIED_FOLLOWER_EXPLORER =
          T.let(
            :verified_follower_explorer,
            XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::ExtractionJob::ToolType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
