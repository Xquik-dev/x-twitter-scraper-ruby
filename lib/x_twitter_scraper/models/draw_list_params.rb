# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Draws#list
    class DrawListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Cursor for keyset pagination from prior response next_cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum number of items to return (1-100, default 50). For paid per-result
      #   endpoints, the returned count may be lower when remaining credits cannot cover
      #   the requested page. If zero paid results are affordable, the endpoint returns
      #   402 insufficient_credits.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(cursor: nil, limit: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::DrawListParams} for more details.
      #
      #   @param cursor [String] Cursor for keyset pagination from prior response next_cursor
      #
      #   @param limit [Integer] Maximum number of items to return (1-100, default 50). For paid per-result endpo
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
