# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class SearchSuggestionTopic < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute topic
      #   Suggested search phrase.
      #
      #   @return [String]
      required :topic, String

      # @!attribute score
      #   X's rounded relevance score for the phrase.
      #
      #   @return [Float, nil]
      optional :score, Float

      # @!attribute tokens
      #   Normalized text tokens X matches the phrase by.
      #
      #   @return [Array<String>, nil]
      optional :tokens, XTwitterScraper::Internal::Type::ArrayOf[String]

      # @!attribute inline
      #   X's inline flag for the phrase.
      #
      #   @return [Boolean, nil]
      optional :inline, XTwitterScraper::Internal::Type::Boolean

      # @!method initialize(topic:, score: nil, tokens: nil, inline: nil)
      #   A search phrase X suggests for the query.
      #
      #   @param topic [String] Suggested search phrase.
      #
      #   @param score [Float] X's rounded relevance score for the phrase.
      #
      #   @param tokens [Array<String>] Normalized text tokens X matches the phrase by.
      #
      #   @param inline [Boolean] X's inline flag for the phrase.
    end
  end
end
