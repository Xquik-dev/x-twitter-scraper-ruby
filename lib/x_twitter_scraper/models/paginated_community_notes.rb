# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PaginatedCommunityNotes < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute notes
      #
      #   @return [Array<XTwitterScraper::Models::CommunityNote>]
      required :notes, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::CommunityNote] }

      # @!attribute has_next_page
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #   Cursor for the next page. Send it unchanged. Each next page arrives fast.
      #
      #   @return [String]
      required :next_cursor, String

      # @!method initialize(notes:, has_next_page:, next_cursor:)
      #   1 page of Community Notes. Follow next_cursor while the response reports more
      #   pages.
      #
      #   @param notes [Array<XTwitterScraper::Models::CommunityNote>]
      #
      #   @param has_next_page [Boolean]
      #
      #   @param next_cursor [String] Cursor for the next page. Send it unchanged. Each next page arrives fast.
    end
  end
end
