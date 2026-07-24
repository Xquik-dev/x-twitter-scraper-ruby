# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Lists#retrieve_tweets
      class ListRetrieveTweetsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor for list tweets
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute include_replies
        #   Include replies (default false)
        #
        #   @return [Boolean, nil]
        optional :include_replies, XTwitterScraper::Internal::Type::Boolean

        # @!attribute page_size
        #   Maximum items requested from this page (1-100, default 20). The response can
        #   contain fewer items because the source returned fewer, filters removed items, or
        #   remaining credits cover fewer results. Keep requesting next_cursor while
        #   has_next_page is true, even when a page is empty. The deprecated limit and count
        #   aliases remain accepted.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer

        # @!attribute since_time
        #   Unix timestamp - filter after
        #
        #   @return [String, nil]
        optional :since_time, String

        # @!attribute until_time
        #   Unix timestamp - filter before
        #
        #   @return [String, nil]
        optional :until_time, String

        # @!method initialize(id:, cursor: nil, include_replies: nil, page_size: nil, since_time: nil, until_time: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::ListRetrieveTweetsParams} for more details.
        #
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor for list tweets
        #
        #   @param include_replies [Boolean] Include replies (default false)
        #
        #   @param page_size [Integer] Maximum items requested from this page (1-100, default 20). The response can con
        #
        #   @param since_time [String] Unix timestamp - filter after
        #
        #   @param until_time [String] Unix timestamp - filter before
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
