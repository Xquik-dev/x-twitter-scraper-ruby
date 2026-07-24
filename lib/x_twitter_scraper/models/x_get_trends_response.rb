# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_trends
    class XGetTrendsResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute count
      #
      #   @return [Integer]
      required :count, Integer

      # @!attribute trends
      #
      #   @return [Array<XTwitterScraper::Models::XGetTrendsResponse::Trend>]
      required :trends,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XGetTrendsResponse::Trend] }

      # @!attribute woeid
      #
      #   @return [Integer]
      required :woeid, Integer

      # @!method initialize(count:, trends:, woeid:)
      #   @param count [Integer]
      #   @param trends [Array<XTwitterScraper::Models::XGetTrendsResponse::Trend>]
      #   @param woeid [Integer]

      class Trend < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute query
        #
        #   @return [String, nil]
        optional :query, String

        # @!attribute rank
        #
        #   @return [Integer, nil]
        optional :rank, Integer

        # @!method initialize(name:, description: nil, query: nil, rank: nil)
        #   @param name [String]
        #   @param description [String]
        #   @param query [String]
        #   @param rank [Integer]
      end
    end
  end
end
