# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Monitors
      # @see XTwitterScraper::Resources::Monitors::Posts#retrieve_metrics
      class PostRetrieveMetricsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #   Resource ID returned by the matching create or list endpoint.
        #
        #   @return [String]
        required :id, String

        # @!attribute hours
        #   Hours to return, from 1 to 17,520.
        #
        #   @return [Integer, nil]
        optional :hours, Integer

        # @!method initialize(id:, hours: nil, request_options: {})
        #   @param id [String] Resource ID returned by the matching create or list endpoint.
        #
        #   @param hours [Integer] Hours to return, from 1 to 17,520.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
