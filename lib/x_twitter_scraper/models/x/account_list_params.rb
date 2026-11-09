# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Accounts#list
      class AccountListParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute cursor
        #   Previous nextCursor. The after alias also works. Offset pagination is not
        #   supported.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #   Maximum items per page, from 1 to 10,000. Default 50. A low credit balance can
        #   return fewer paid results. When it covers none, the answer is 402
        #   insufficient_credits.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!method initialize(cursor: nil, limit: nil, request_options: {})
        #   @param cursor [String] Previous nextCursor. The after alias also works. Offset pagination is not suppor
        #
        #   @param limit [Integer] Maximum items per page, from 1 to 10,000. Default 50. A low credit balance can r
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
