# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Webhooks#list_deliveries
    class WebhookListDeliveriesParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute cursor
      #   Previous nextCursor. The after alias also works. Offset pagination is not
      #   supported.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum deliveries per page, from 1 to 10,000. Default 100. Pass nextCursor as
      #   cursor for the next page.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(id:, cursor: nil, limit: nil, request_options: {})
      #   @param id [String]
      #   @param cursor [String] Previous nextCursor. The after alias also works. Offset pagination is not suppor
      #
      #   @param limit [Integer] Maximum deliveries per page, from 1 to 10,000. Default 100. Pass nextCursor as c
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
