# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PaginatedUsers < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute has_next_page
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String]
      required :next_cursor, String

      # @!attribute users
      #
      #   @return [Array<XTwitterScraper::Models::UserProfile>]
      required :users, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::UserProfile] }

      # @!attribute filtered_count
      #   Whole number from 0.
      #
      #   @return [Integer, nil]
      optional :filtered_count, Integer

      # @!method initialize(has_next_page:, next_cursor:, users:, filtered_count: nil)
      #   Paginated user profiles. No-mode follower, following, and verified follower
      #   requests merge independent views automatically. Response fields, page size,
      #   aliases, filters, and per-returned-profile billing stay unchanged. Existing
      #   unprefixed cursors retain legacy behavior. Follow next_cursor while
      #   has_next_page is true.
      #
      #   @param has_next_page [Boolean]
      #   @param next_cursor [String]
      #   @param users [Array<XTwitterScraper::Models::UserProfile>]
      #   @param filtered_count [Integer] Whole number from 0.
    end
  end
end
