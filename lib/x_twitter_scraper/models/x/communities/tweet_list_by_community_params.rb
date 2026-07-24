# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Communities
        # @see XTwitterScraper::Resources::X::Communities::Tweets#list_by_community
        class TweetListByCommunityParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute cursor
          #   Pagination cursor for community tweets
          #
          #   @return [String, nil]
          optional :cursor, String

          # @!attribute page_size
          #   Maximum items requested from this page (1-100, default 20). The response can
          #   contain fewer items because the source returned fewer, filters removed items, or
          #   remaining credits cover fewer results. Keep requesting next_cursor while
          #   has_next_page is true, even when a page is empty. The deprecated limit and count
          #   aliases remain accepted.
          #
          #   @return [Integer, nil]
          optional :page_size, Integer

          # @!method initialize(id:, cursor: nil, page_size: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {XTwitterScraper::Models::X::Communities::TweetListByCommunityParams} for more
          #   details.
          #
          #   @param id [String]
          #
          #   @param cursor [String] Pagination cursor for community tweets
          #
          #   @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
          #
          #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
