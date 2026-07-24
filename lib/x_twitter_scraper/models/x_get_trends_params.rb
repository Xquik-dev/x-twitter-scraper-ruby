# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_trends
    class XGetTrendsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute count
      #   Number of trending topics to return (1-50, default 30)
      #
      #   @return [Integer, nil]
      optional :count, Integer

      # @!attribute woeid
      #   Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      #
      #   @return [Integer, nil]
      optional :woeid, Integer

      # @!method initialize(count: nil, woeid: nil, request_options: {})
      #   @param count [Integer] Number of trending topics to return (1-50, default 30)
      #
      #   @param woeid [Integer] Region WOEID (1=Worldwide, 23424977=US, 23424975=UK, 23424969=Turkey)
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
