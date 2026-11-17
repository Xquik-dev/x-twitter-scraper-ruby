# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::AccountConnectionLinks#list
      class AccountConnectionLinkListResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute links
        #   Your connect links, newest first.
        #
        #   @return [Array<XTwitterScraper::Models::X::XAccountConnectionLink>]
        required :links, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::XAccountConnectionLink] }

        # @!attribute has_more
        #   Whether more links follow. Send next_cursor as cursor to read them.
        #
        #   @return [Boolean]
        required :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

        # @!attribute next_cursor
        #   Pass unchanged as cursor when hasMore is true.
        #
        #   @return [String, nil]
        optional :next_cursor, String, api_name: :nextCursor

        # @!method initialize(links:, has_more:, next_cursor: nil)
        #   @param links [Array<XTwitterScraper::Models::X::XAccountConnectionLink>] Your connect links, newest first.
        #
        #   @param has_more [Boolean] Whether more links follow. Send next_cursor as cursor to read them.
        #
        #   @param next_cursor [String] Pass unchanged as cursor when hasMore is true.
      end
    end
  end
end
