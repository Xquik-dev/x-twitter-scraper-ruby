# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#list
      class TweetListResponse < XTwitterScraper::Models::PaginatedTweets
        # @!attribute skipped
        #   Each `ids` entry that names no post, with why. Absent when every entry names a
        #   post.
        #
        #   @return [Array<XTwitterScraper::Models::X::TweetListResponse::Skipped>, nil]
        optional :skipped, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::TweetListResponse::Skipped] }

        # @!method initialize(skipped: nil)
        #   Requested tweets in request order.
        #
        #   @param skipped [Array<XTwitterScraper::Models::X::TweetListResponse::Skipped>] Each `ids` entry that names no post, with why. Absent when every entry names a

        class Skipped < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute entry
          #   The entry as sent.
          #
          #   @return [String]
          required :entry, String

          # @!attribute reason
          #   Why the entry names no post.
          #
          #   @return [String]
          required :reason, String

          # @!method initialize(entry:, reason:)
          #   @param entry [String] The entry as sent.
          #
          #   @param reason [String] Why the entry names no post.
        end
      end
    end
  end
end
