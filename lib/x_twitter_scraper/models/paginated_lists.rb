# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PaginatedLists < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute lists
      #
      #   @return [Array<XTwitterScraper::Models::XList>]
      required :lists, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XList] }

      # @!attribute has_next_page
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #   Cursor for the next page. Send it unchanged. Each next page arrives fast.
      #
      #   @return [String]
      required :next_cursor, String

      # @!method initialize(lists:, has_next_page:, next_cursor:)
      #   1 page of public X Lists. Follow next_cursor while the response reports more
      #   pages. Each returned List costs 1 credit.
      #
      #   @param lists [Array<XTwitterScraper::Models::XList>]
      #
      #   @param has_next_page [Boolean]
      #
      #   @param next_cursor [String] Cursor for the next page. Send it unchanged. Each next page arrives fast.
    end
  end
end
