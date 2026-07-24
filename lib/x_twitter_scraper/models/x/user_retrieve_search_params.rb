# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_search
      class UserRetrieveSearchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute q
        #   User search query
        #
        #   @return [String]
        required :q, String

        # @!attribute cursor
        #   Pagination cursor for user search
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!method initialize(q:, cursor: nil, request_options: {})
        #   @param q [String] User search query
        #
        #   @param cursor [String] Pagination cursor for user search
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
