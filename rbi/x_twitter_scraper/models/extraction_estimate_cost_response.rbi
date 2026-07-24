# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ExtractionEstimateCostResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ExtractionEstimateCostResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :allowed

      sig { returns(String) }
      attr_accessor :credits_available

      sig { returns(String) }
      attr_accessor :credits_required

      sig { returns(Integer) }
      attr_accessor :estimated_results

      sig do
        returns(
          XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::TaggedSymbol
        )
      end
      attr_accessor :source

      sig { returns(T.nilable(String)) }
      attr_reader :resolved_x_user_id

      sig { params(resolved_x_user_id: String).void }
      attr_writer :resolved_x_user_id

      sig do
        params(
          allowed: T::Boolean,
          credits_available: String,
          credits_required: String,
          estimated_results: Integer,
          source:
            XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::OrSymbol,
          resolved_x_user_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        allowed:,
        credits_available:,
        credits_required:,
        estimated_results:,
        source:,
        resolved_x_user_id: nil
      )
      end

      sig do
        override.returns(
          {
            allowed: T::Boolean,
            credits_available: String,
            credits_required: String,
            estimated_results: Integer,
            source:
              XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::TaggedSymbol,
            resolved_x_user_id: String
          }
        )
      end
      def to_hash
      end

      module Source
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::Models::ExtractionEstimateCostResponse::Source
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FOLLOWERS =
          T.let(
            :followers,
            XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::TaggedSymbol
          )
        FOLLOWING =
          T.let(
            :following,
            XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::TaggedSymbol
          )
        PAGINATION_CAP =
          T.let(
            :paginationCap,
            XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::TaggedSymbol
          )
        POSTS =
          T.let(
            :posts,
            XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::TaggedSymbol
          )
        QUOTE_COUNT =
          T.let(
            :quoteCount,
            XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::TaggedSymbol
          )
        REPLY_COUNT =
          T.let(
            :replyCount,
            XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::TaggedSymbol
          )
        RESULTS_LIMIT =
          T.let(
            :resultsLimit,
            XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::TaggedSymbol
          )
        RETWEET_COUNT =
          T.let(
            :retweetCount,
            XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::TaggedSymbol
          )
        UNKNOWN =
          T.let(
            :unknown,
            XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::ExtractionEstimateCostResponse::Source::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
