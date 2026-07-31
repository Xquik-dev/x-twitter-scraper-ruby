# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Trends#list
    class TrendListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute total
      #
      #   @return [Integer]
      required :total, Integer

      # @!attribute trends
      #
      #   @return [Array<XTwitterScraper::Models::TrendListResponse::Trend>]
      required :trends,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::TrendListResponse::Trend] }

      # @!attribute woeid
      #
      #   @return [Integer]
      required :woeid, Integer

      # @!method initialize(total:, trends:, woeid:)
      #   @param total [Integer]
      #   @param trends [Array<XTwitterScraper::Models::TrendListResponse::Trend>]
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

        # @!attribute promoted_content
        #   Promotion identifier from X. Null for organic trends.
        #
        #   @return [String, nil]
        optional :promoted_content, String, api_name: :promotedContent, nil?: true

        # @!attribute query
        #
        #   @return [String, nil]
        optional :query, String

        # @!attribute rank
        #
        #   @return [Integer, nil]
        optional :rank, Integer

        # @!attribute tweet_volume
        #   Approximate public post volume when X supplies it.
        #
        #   @return [Integer, nil]
        optional :tweet_volume, Integer, api_name: :tweetVolume, nil?: true

        # @!attribute url
        #   X search URL for the trend.
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(name:, description: nil, promoted_content: nil, query: nil, rank: nil, tweet_volume: nil, url: nil)
        #   @param name [String]
        #
        #   @param description [String]
        #
        #   @param promoted_content [String, nil] Promotion identifier from X. Null for organic trends.
        #
        #   @param query [String]
        #
        #   @param rank [Integer]
        #
        #   @param tweet_volume [Integer, nil] Approximate public post volume when X supplies it.
        #
        #   @param url [String] X search URL for the trend.
      end
    end
  end
end
