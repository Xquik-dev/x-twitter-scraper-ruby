# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Lists#retrieve_members
      class ListRetrieveMembersParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor for list members
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute page_size
        #   Members per page (20-200, default 20)
        #
        #   @return [Integer, nil]
        optional :page_size, Integer

        # @!method initialize(id:, cursor: nil, page_size: nil, request_options: {})
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor for list members
        #
        #   @param page_size [Integer] Members per page (20-200, default 20)
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
