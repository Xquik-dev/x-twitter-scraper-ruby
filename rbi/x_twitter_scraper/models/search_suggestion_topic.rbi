# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SearchSuggestionTopic < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SearchSuggestionTopic,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Suggested search phrase.
      sig { returns(String) }
      attr_accessor :topic

      # X's rounded relevance score for the phrase.
      sig { returns(T.nilable(Float)) }
      attr_reader :score

      sig { params(score: Float).void }
      attr_writer :score

      # Normalized text tokens X matches the phrase by.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tokens

      sig { params(tokens: T::Array[String]).void }
      attr_writer :tokens

      # X's inline flag for the phrase.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :inline

      sig { params(inline: T::Boolean).void }
      attr_writer :inline

      sig do
        params(
          topic: String,
          score: Float,
          tokens: T::Array[String],
          inline: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Suggested search phrase.
        topic:,
        # X's rounded relevance score for the phrase.
        score: nil,
        # Normalized text tokens X matches the phrase by.
        tokens: nil,
        # X's inline flag for the phrase.
        inline: nil
      )
      end

      sig do
        override.returns(
          {
            topic: String,
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
