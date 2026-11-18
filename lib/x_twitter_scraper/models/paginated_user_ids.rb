# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PaginatedUserIds < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute ids
      #   X user IDs, newest relationship first.
      #
      #   @return [Array<String>]
      required :ids, XTwitterScraper::Internal::Type::ArrayOf[String]

      # @!attribute has_next_page
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #   Cursor for the next page. Send it unchanged. Each next page arrives fast.
      #
      #   @return [String]
      required :next_cursor, String

      # @!method initialize(ids:, has_next_page:, next_cursor:)
      #   A page of user IDs without profiles. Follow next_cursor while the response
      #   reports more pages.
      #
      #   @param ids [Array<String>] X user IDs, newest relationship first.
      #
      #   @param has_next_page [Boolean]
      #
      #   @param next_cursor [String] Cursor for the next page. Send it unchanged. Each next page arrives fast.
    end
  end
end
