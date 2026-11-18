# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class SearchSuggestionHashtag < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute hashtag
      #   Suggested hashtag, with its leading #.
      #
      #   @return [String]
      required :hashtag, String

      # @!attribute score
      #   X's rounded relevance score for the hashtag.
      #
      #   @return [Float, nil]
      optional :score, Float

      # @!attribute tokens
      #   Normalized text tokens X matches the hashtag by.
      #
      #   @return [Array<String>, nil]
      optional :tokens, XTwitterScraper::Internal::Type::ArrayOf[String]

      # @!attribute inline
      #   X's inline flag for the hashtag.
      #
      #   @return [Boolean, nil]
      optional :inline, XTwitterScraper::Internal::Type::Boolean

      # @!method initialize(hashtag:, score: nil, tokens: nil, inline: nil)
      #   A hashtag X suggests for the query.
      #
      #   @param hashtag [String] Suggested hashtag, with its leading #.
      #
      #   @param score [Float] X's rounded relevance score for the hashtag.
      #
      #   @param tokens [Array<String>] Normalized text tokens X matches the hashtag by.
      #
      #   @param inline [Boolean] X's inline flag for the hashtag.
    end
  end
end
