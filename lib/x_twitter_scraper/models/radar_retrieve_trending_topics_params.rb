# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Radar#retrieve_trending_topics
    class RadarRetrieveTrendingTopicsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute after
      #   Cursor for pagination (from prior response nextCursor).
      #
      #   @return [String, nil]
      optional :after, String

      # @!attribute category
      #   Filter by category.
      #
      #   @return [Symbol, XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams::Category, nil]
      optional :category, enum: -> { XTwitterScraper::RadarRetrieveTrendingTopicsParams::Category }

      # @!attribute hours
      #   Lookback window in hours (1-72, default 6).
      #
      #   @return [Integer, nil]
      optional :hours, Integer

      # @!attribute limit
      #   Number of items to return (1-100, default 50).
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute region
      #   Region filter. Use `global` or a region code such as `US`, `GB`, `TR`, or `ES`.
      #
      #   @return [String, nil]
      optional :region, String

      # @!attribute source
      #   Source filter. One of: github, google_trends, hacker_news, polymarket, reddit,
      #   trustmrr, wikipedia
      #
      #   @return [Symbol, XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams::Source, nil]
      optional :source, enum: -> { XTwitterScraper::RadarRetrieveTrendingTopicsParams::Source }

      # @!method initialize(after: nil, category: nil, hours: nil, limit: nil, region: nil, source: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams} for more details.
      #
      #   @param after [String] Cursor for pagination (from prior response nextCursor).
      #
      #   @param category [Symbol, XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams::Category] Filter by category.
      #
      #   @param hours [Integer] Lookback window in hours (1-72, default 6).
      #
      #   @param limit [Integer] Number of items to return (1-100, default 50).
      #
      #   @param region [String] Region filter. Use `global` or a region code such as `US`, `GB`, `TR`, or `ES`.
      #
      #   @param source [Symbol, XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams::Source] Source filter. One of: github, google_trends, hacker_news, polymarket, reddit, t
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Filter by category.
      module Category
        extend XTwitterScraper::Internal::Type::Enum

        GENERAL = :general
        TECH = :tech
        DEV = :dev
        SCIENCE = :science
        CULTURE = :culture
        POLITICS = :politics
        BUSINESS = :business
        ENTERTAINMENT = :entertainment

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Source filter. One of: github, google_trends, hacker_news, polymarket, reddit,
      # trustmrr, wikipedia
      module Source
        extend XTwitterScraper::Internal::Type::Enum

        GITHUB = :github
        GOOGLE_TRENDS = :google_trends
        HACKER_NEWS = :hacker_news
        POLYMARKET = :polymarket
        REDDIT = :reddit
        TRUSTMRR = :trustmrr
        WIKIPEDIA = :wikipedia

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
