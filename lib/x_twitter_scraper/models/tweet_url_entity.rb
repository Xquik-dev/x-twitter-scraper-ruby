# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetUrlEntity < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute display_url
      #
      #   @return [String, nil]
      optional :display_url, String

      # @!attribute expanded_url
      #
      #   @return [String, nil]
      optional :expanded_url, String

      # @!attribute indices
      #
      #   @return [Array<Integer>, nil]
      optional :indices, XTwitterScraper::Internal::Type::ArrayOf[Integer]

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(display_url: nil, expanded_url: nil, indices: nil, url: nil)
      #   Shortened, display, and expanded URLs from tweet text.
      #
      #   @param display_url [String]
      #
      #   @param expanded_url [String]
      #
      #   @param indices [Array<Integer>]
      #
      #   @param url [String]
    end
  end
end
