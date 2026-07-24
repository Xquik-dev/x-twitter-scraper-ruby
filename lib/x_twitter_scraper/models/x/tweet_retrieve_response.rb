# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#retrieve
      class TweetRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute tweet
        #   Full tweet with text, engagement metrics, media, and metadata. A zero metric can
        #   mean X did not report the count.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail]
        required :tweet, -> { XTwitterScraper::X::TweetDetail }

        # @!attribute author
        #   Tweet author profile. The lookup route always includes follower count and
        #   verification state. Other profile fields appear when available.
        #
        #   @return [XTwitterScraper::Models::X::TweetAuthor, nil]
        optional :author, -> { XTwitterScraper::X::TweetAuthor }

        # @!method initialize(tweet:, author: nil)
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::TweetRetrieveResponse} for more details.
        #
        #   @param tweet [XTwitterScraper::Models::X::TweetDetail] Full tweet with text, engagement metrics, media, and metadata. A zero metric can
        #
        #   @param author [XTwitterScraper::Models::X::TweetAuthor] Tweet author profile. The lookup route always includes follower count and verifi
      end
    end
  end
end
