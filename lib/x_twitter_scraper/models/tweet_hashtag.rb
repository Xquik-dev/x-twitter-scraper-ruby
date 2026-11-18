# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetHashtag < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute indices
      #
      #   @return [Array<Integer>, nil]
      optional :indices, XTwitterScraper::Internal::Type::ArrayOf[Integer]

      # @!attribute tag
      #   X's SmartTag for a cashtag, smarttag or hashtag.
      #
      #   @return [XTwitterScraper::Models::TweetSmartTag, nil]
      optional :tag, -> { XTwitterScraper::Models::TweetSmartTag }

      # @!attribute text
      #
      #   @return [String]
      required :text, String

      # @!method initialize(text:, indices: nil, tag: nil)
      #   Hashtag text and its source offsets in a tweet.
      #
      #   @param text [String]
      #
      #   @param indices [Array<Integer>]
      #
      #   @param tag [XTwitterScraper::Models::TweetSmartTag] X's SmartTag for a cashtag, smarttag or hashtag.
    end
  end
end
