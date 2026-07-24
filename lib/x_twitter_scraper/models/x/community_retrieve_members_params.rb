# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#retrieve_members
      class CommunityRetrieveMembersParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute page_size
        #   Items per page (20-200, default 20). This is an upper bound for paid
        #   authenticated calls: remaining credits can reduce the returned page size, and
        #   zero affordable results returns 402 insufficient_credits.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer

        # @!method initialize(id:, cursor: nil, page_size: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::CommunityRetrieveMembersParams} for more details.
        #
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor
        #
        #   @param page_size [Integer] Items per page (20-200, default 20). This is an upper bound for paid authenticat
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
