# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class SearchSuggestions < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute query
      #   The query you sent, trimmed.
      #
      #   @return [String]
      required :query, String

      # @!attribute users
      #   Suggested accounts.
      #
      #   @return [Array<XTwitterScraper::Models::SearchSuggestionUser>]
      required :users, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SearchSuggestionUser] }

      # @!attribute topics
      #   Suggested search phrases that are not hashtags.
      #
      #   @return [Array<XTwitterScraper::Models::SearchSuggestionTopic>]
      required :topics, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SearchSuggestionTopic] }

      # @!attribute hashtags
      #   Suggested hashtags.
      #
      #   @return [Array<XTwitterScraper::Models::SearchSuggestionHashtag>]
      required :hashtags, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SearchSuggestionHashtag] }

      # @!attribute cashtags
      #   Suggested stocks & crypto tokens.
      #
      #   @return [Array<XTwitterScraper::Models::SearchSuggestionCashtag>]
      required :cashtags, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SearchSuggestionCashtag] }

      # @!attribute count
      #   Suggestions returned across all 4 lists. Each costs 1 credit.
      #
      #   @return [Integer]
      required :count, Integer

      # @!method initialize(query:, users:, topics:, hashtags:, cashtags:, count:)
      #   What X suggests for a partial search query. Each list keeps X's order. A list is
      #   empty when X suggests none of its type or types leaves it out.
      #
      #   @param query [String] The query you sent, trimmed.
      #
      #   @param users [Array<XTwitterScraper::Models::SearchSuggestionUser>] Suggested accounts.
      #
      #   @param topics [Array<XTwitterScraper::Models::SearchSuggestionTopic>] Suggested search phrases that are not hashtags.
      #
      #   @param hashtags [Array<XTwitterScraper::Models::SearchSuggestionHashtag>] Suggested hashtags.
      #
      #   @param cashtags [Array<XTwitterScraper::Models::SearchSuggestionCashtag>] Suggested stocks & crypto tokens.
      #
      #   @param count [Integer] Suggestions returned across all 4 lists. Each costs 1 credit.
    end
  end
end
