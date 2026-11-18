# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetSymbol < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute indices
      #
      #   @return [Array<Integer>, nil]
      optional :indices, XTwitterScraper::Internal::Type::ArrayOf[Integer]

      # @!attribute seconds
      #
      #   @return [Float, nil]
      optional :seconds, Float

      # @!attribute text
      #
      #   @return [String, nil]
      optional :text, String

      # @!attribute tag
      #   X's SmartTag for a cashtag, smarttag or hashtag.
      #
      #   @return [XTwitterScraper::Models::TweetSmartTag, nil]
      optional :tag, -> { XTwitterScraper::Models::TweetSmartTag }

      # @!method initialize(indices: nil, seconds: nil, text: nil, tag: nil)
      #   Indexed smart-tag, cashtag, or video timestamp metadata.
      #
      #   @param indices [Array<Integer>]
      #
      #   @param seconds [Float]
      #
      #   @param text [String]
      #
      #   @param tag [XTwitterScraper::Models::TweetSmartTag] X's SmartTag for a cashtag, smarttag or hashtag.
    end
  end
end
