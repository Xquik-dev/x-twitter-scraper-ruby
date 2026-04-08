# typed: strong

module XTwitterScraper
  module Models
    class ExtractionListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ExtractionListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig do
        returns(
          T::Array[XTwitterScraper::Models::ExtractionListResponse::Extraction]
        )
      end
      attr_accessor :extractions

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig do
        params(
          extractions:
            T::Array[
              XTwitterScraper::Models::ExtractionListResponse::Extraction::OrHash
            ],
          has_more: T::Boolean,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(extractions:, has_more:, next_cursor: nil)
      end

      sig do
        override.returns(
          {
            extractions:
              T::Array[
                XTwitterScraper::Models::ExtractionListResponse::Extraction
              ],
            has_more: T::Boolean,
            next_cursor: String
          }
        )
      end
      def to_hash
      end

      class Extraction < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::ExtractionListResponse::Extraction,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig do
          returns(
            XTwitterScraper::Models::ExtractionListResponse::Extraction::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Identifier for the extraction tool used to run a job.
        sig do
          returns(
            XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
          )
        end
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
            status:
              XTwitterScraper::Models::ExtractionListResponse::Extraction::Status::OrSymbol,
            tool_type:
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::OrSymbol,
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
              status:
                XTwitterScraper::Models::ExtractionListResponse::Extraction::Status::TaggedSymbol,
              tool_type:
                XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol,
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
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::ExtractionListResponse::Extraction::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RUNNING =
            T.let(
              :running,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::ExtractionListResponse::Extraction::Status::TaggedSymbol
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
                XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ARTICLE_EXTRACTOR =
            T.let(
              :article_extractor,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          COMMUNITY_EXTRACTOR =
            T.let(
              :community_extractor,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          COMMUNITY_MODERATOR_EXPLORER =
            T.let(
              :community_moderator_explorer,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          COMMUNITY_POST_EXTRACTOR =
            T.let(
              :community_post_extractor,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          COMMUNITY_SEARCH =
            T.let(
              :community_search,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          FOLLOWER_EXPLORER =
            T.let(
              :follower_explorer,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          FOLLOWING_EXPLORER =
            T.let(
              :following_explorer,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          LIST_FOLLOWER_EXPLORER =
            T.let(
              :list_follower_explorer,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          LIST_MEMBER_EXTRACTOR =
            T.let(
              :list_member_extractor,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          LIST_POST_EXTRACTOR =
            T.let(
              :list_post_extractor,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          MENTION_EXTRACTOR =
            T.let(
              :mention_extractor,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          PEOPLE_SEARCH =
            T.let(
              :people_search,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          POST_EXTRACTOR =
            T.let(
              :post_extractor,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          QUOTE_EXTRACTOR =
            T.let(
              :quote_extractor,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          REPLY_EXTRACTOR =
            T.let(
              :reply_extractor,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          REPOST_EXTRACTOR =
            T.let(
              :repost_extractor,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          SPACE_EXPLORER =
            T.let(
              :space_explorer,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          THREAD_EXTRACTOR =
            T.let(
              :thread_extractor,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          TWEET_SEARCH_EXTRACTOR =
            T.let(
              :tweet_search_extractor,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )
          VERIFIED_FOLLOWER_EXPLORER =
            T.let(
              :verified_follower_explorer,
              XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::ExtractionListResponse::Extraction::ToolType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
