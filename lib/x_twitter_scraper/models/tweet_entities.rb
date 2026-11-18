# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetEntities < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute hashtags
      #
      #   @return [Array<XTwitterScraper::Models::TweetHashtag>, nil]
      optional :hashtags, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::TweetHashtag] }

      # @!attribute smarttags
      #
      #   @return [Array<XTwitterScraper::Models::TweetSymbol>, nil]
      optional :smarttags, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::TweetSymbol] }

      # @!attribute symbols
      #
      #   @return [Array<XTwitterScraper::Models::TweetSymbol>, nil]
      optional :symbols, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::TweetSymbol] }

      # @!attribute timestamps
      #
      #   @return [Array<XTwitterScraper::Models::TweetSymbol>, nil]
      optional :timestamps, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::TweetSymbol] }

      # @!attribute urls
      #
      #   @return [Array<XTwitterScraper::Models::TweetUrlEntity>, nil]
      optional :urls, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::TweetUrlEntity] }

      # @!attribute user_mentions
      #
      #   @return [Array<XTwitterScraper::Models::TweetUserMention>, nil]
      optional :user_mentions, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::TweetUserMention] }

      # @!method initialize(hashtags: nil, smarttags: nil, symbols: nil, timestamps: nil, urls: nil, user_mentions: nil)
      #   Lists hashtags, symbols, links, and mentions from tweet text.
      #
      #   @param hashtags [Array<XTwitterScraper::Models::TweetHashtag>]
      #
      #   @param smarttags [Array<XTwitterScraper::Models::TweetSymbol>]
      #
      #   @param symbols [Array<XTwitterScraper::Models::TweetSymbol>]
      #
      #   @param timestamps [Array<XTwitterScraper::Models::TweetSymbol>]
      #
      #   @param urls [Array<XTwitterScraper::Models::TweetUrlEntity>]
      #
      #   @param user_mentions [Array<XTwitterScraper::Models::TweetUserMention>]
    end
  end
end
