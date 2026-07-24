# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#get_favoriters
      class TweetGetFavoritersParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor for favoriters
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute page_size
        #   Maximum user profiles requested from this page (20-200, default 200). The
        #   response can contain fewer profiles because the source returned fewer or
        #   remaining credits cover fewer results. Keep requesting next_cursor while
        #   has_next_page is true. The deprecated limit and count aliases remain accepted.
        #
        #   @return [Integer, nil]
        optional :page_size, Integer

        # @!method initialize(id:, cursor: nil, page_size: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::TweetGetFavoritersParams} for more details.
        #
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor for favoriters
        #
        #   @param page_size [Integer] Maximum user profiles requested from this page (20-200, default 200). The respon
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
