# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class UserHighlightsInfo < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute can_highlight_tweets
      #
      #   @return [Boolean, nil]
      optional :can_highlight_tweets, XTwitterScraper::Internal::Type::Boolean, api_name: :canHighlightTweets

      # @!attribute highlighted_tweets
      #
      #   @return [String, nil]
      optional :highlighted_tweets, String, api_name: :highlightedTweets

      # @!method initialize(can_highlight_tweets: nil, highlighted_tweets: nil)
      #   Profile highlight availability and count metadata.
      #
      #   @param can_highlight_tweets [Boolean]
      #
      #   @param highlighted_tweets [String]
    end
  end
end
