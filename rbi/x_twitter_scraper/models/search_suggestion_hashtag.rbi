# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SearchSuggestionHashtag < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SearchSuggestionHashtag,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Suggested hashtag, with its leading #.
      sig { returns(String) }
      attr_accessor :hashtag

      # X's rounded relevance score for the hashtag.
      sig { returns(T.nilable(Float)) }
      attr_reader :score

      sig { params(score: Float).void }
      attr_writer :score

      # Normalized text tokens X matches the hashtag by.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tokens

      sig { params(tokens: T::Array[String]).void }
      attr_writer :tokens

      # X's inline flag for the hashtag.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :inline

      sig { params(inline: T::Boolean).void }
      attr_writer :inline

      sig do
        params(
          hashtag: String,
          score: Float,
          tokens: T::Array[String],
          inline: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Suggested hashtag, with its leading #.
        hashtag:,
        # X's rounded relevance score for the hashtag.
        score: nil,
        # Normalized text tokens X matches the hashtag by.
        tokens: nil,
        # X's inline flag for the hashtag.
        inline: nil
      )
      end

      sig do
        override.returns(
          {
            hashtag: String,
            score: Float,
            tokens: T::Array[String],
            inline: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
