# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

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

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :allowed

      sig { params(allowed: T::Boolean).void }
      attr_writer :allowed

      sig { returns(T.nilable(String)) }
      attr_reader :credits_available

      sig { params(credits_available: String).void }
      attr_writer :credits_available

      sig { returns(T.nilable(String)) }
      attr_reader :credits_required

      sig { params(credits_required: String).void }
      attr_writer :credits_required

      sig { returns(T.nilable(Integer)) }
      attr_reader :estimated_results

      sig { params(estimated_results: Integer).void }
      attr_writer :estimated_results

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig { returns(T.nilable(Integer)) }
      attr_reader :poll_after_ms

      sig { params(poll_after_ms: Integer).void }
      attr_writer :poll_after_ms

      sig { returns(T.nilable(String)) }
      attr_reader :source

      sig { params(source: String).void }
      attr_writer :source

      sig { returns(T.nilable(String)) }
      attr_reader :resolved_x_user_id

      sig { params(resolved_x_user_id: String).void }
      attr_writer :resolved_x_user_id

      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::ExtractionRunResponse::Status::TaggedSymbol
          )
        )
      end
      attr_reader :status

      sig do
        params(
          status:
            XTwitterScraper::Models::ExtractionRunResponse::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig { returns(T.nilable(String)) }
      attr_reader :status_url

      sig { params(status_url: String).void }
      attr_writer :status_url

      # Identifier for the extraction tool used to run a job.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        )
      end
      attr_reader :tool_type

      sig do
        params(
          tool_type:
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::OrSymbol
        ).void
      end
      attr_writer :tool_type

      # Dashboard page of the job. A signed-in user follows its progress there and
      # downloads every row as CSV, XLSX, JSON, Markdown, PDF or text, so give this link
      # to a person who wants the whole list as a file.
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig { returns(T.nilable(String)) }
      attr_reader :wait_url

      sig { params(wait_url: String).void }
      attr_writer :wait_url

      sig do
        params(
          allowed: T::Boolean,
          credits_available: String,
          credits_required: String,
          estimated_results: Integer,
          id: String,
          poll_after_ms: Integer,
          source: String,
          resolved_x_user_id: String,
          status:
            XTwitterScraper::Models::ExtractionRunResponse::Status::OrSymbol,
          status_url: String,
          tool_type:
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::OrSymbol,
          url: String,
          wait_url: String
        ).returns(T.attached_class)
      end
      def self.new(
        allowed: nil,
        credits_available: nil,
        credits_required: nil,
        estimated_results: nil,
        id: nil,
        poll_after_ms: nil,
        source: nil,
        resolved_x_user_id: nil,
        status: nil,
        status_url: nil,
        # Identifier for the extraction tool used to run a job.
        tool_type: nil,
        # Dashboard page of the job. A signed-in user follows its progress there and
        # downloads every row as CSV, XLSX, JSON, Markdown, PDF or text, so give this link
        # to a person who wants the whole list as a file.
        url: nil,
        wait_url: nil
      )
      end

      sig do
        override.returns(
          {
            allowed: T::Boolean,
            credits_available: String,
            credits_required: String,
            estimated_results: Integer,
            id: String,
            poll_after_ms: Integer,
            source: String,
            resolved_x_user_id: String,
            status:
              XTwitterScraper::Models::ExtractionRunResponse::Status::TaggedSymbol,
            status_url: String,
            tool_type:
              XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol,
            url: String,
            wait_url: String
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

        PENDING =
          T.let(
            :pending,
            XTwitterScraper::Models::ExtractionRunResponse::Status::TaggedSymbol
          )
        RUNNING =
          T.let(
            :running,
            XTwitterScraper::Models::ExtractionRunResponse::Status::TaggedSymbol
          )
        CANCELED =
          T.let(
            :canceled,
            XTwitterScraper::Models::ExtractionRunResponse::Status::TaggedSymbol
          )
        COMPLETED =
          T.let(
            :completed,
            XTwitterScraper::Models::ExtractionRunResponse::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
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
        FAVORITERS =
          T.let(
            :favoriters,
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
        USER_AFFILIATES =
          T.let(
            :user_affiliates,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        USER_LIKES =
          T.let(
            :user_likes,
            XTwitterScraper::Models::ExtractionRunResponse::ToolType::TaggedSymbol
          )
        USER_MEDIA =
          T.let(
            :user_media,
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
