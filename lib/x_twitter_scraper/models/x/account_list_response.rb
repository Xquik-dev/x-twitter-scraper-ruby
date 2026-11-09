# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Accounts#list
      class AccountListResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute accounts
        #
        #   @return [Array<XTwitterScraper::Models::X::XAccount>]
        required :accounts, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::XAccount] }

        # @!attribute has_more
        #   Present on cursor-paginated responses.
        #
        #   @return [Boolean, nil]
        optional :has_more, XTwitterScraper::Internal::Type::Boolean, api_name: :hasMore

        # @!attribute next_cursor
        #   Pass unchanged as cursor when hasMore is true.
        #
        #   @return [String, nil]
        optional :next_cursor, String, api_name: :nextCursor

        # @!method initialize(accounts:, has_more: nil, next_cursor: nil)
        #   @param accounts [Array<XTwitterScraper::Models::X::XAccount>]
        #
        #   @param has_more [Boolean] Present on cursor-paginated responses.
        #
        #   @param next_cursor [String] Pass unchanged as cursor when hasMore is true.
      end
    end
  end
end
