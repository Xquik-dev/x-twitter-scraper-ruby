# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PaginatedTweets < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute has_next_page
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String]
      required :next_cursor, String

      # @!attribute tweets
      #
      #   @return [Array<XTwitterScraper::Models::SearchTweet>]
      required :tweets, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::SearchTweet] }

      # @!method initialize(has_next_page:, next_cursor:, tweets:)
      #   Paginated tweet results. The item count can be lower than pageSize when the
      #   source returns fewer tweets, filters remove tweets, or remaining credits cover
      #   fewer results. Follow next_cursor while has_next_page is true. An empty page can
      #   still have has_next_page true after filtering. Zero affordable results returns
      #   402 insufficient_credits.
      #
      #   @param has_next_page [Boolean]
      #   @param next_cursor [String]
      #   @param tweets [Array<XTwitterScraper::Models::SearchTweet>]
    end
  end
end
