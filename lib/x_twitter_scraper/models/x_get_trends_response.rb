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

      # @!attribute captured_at
      #   When Xquik read this list from X. It comes from the stored list and is never
      #   estimated.
      #
      #   @return [Time, nil]
      optional :captured_at, Time, api_name: :capturedAt

      # @!attribute location
      #   The place country or location named. Absent when woeid picked the place or the
      #   request named none.
      #
      #   @return [XTwitterScraper::Models::XGetTrendsResponse::Location, nil]
      optional :location, -> { XTwitterScraper::Models::XGetTrendsResponse::Location }

      # @!attribute requested_at
      #   The time the at parameter asked for, as Xquik read it. A span such as 24h shows
      #   here as the time it counted back to. Present only with at.
      #
      #   @return [Time, nil]
      optional :requested_at, Time, api_name: :requestedAt

      # @!method initialize(count:, trends:, woeid:, captured_at: nil, location: nil, requested_at: nil)
      #   @param count [Integer]
      #   @param trends [Array<XTwitterScraper::Models::XGetTrendsResponse::Trend>]
      #   @param woeid [Integer]
      #   @param captured_at [Time] When Xquik read this list from X. It comes from the stored list and is never est
      #   @param location [XTwitterScraper::Models::XGetTrendsResponse::Location] The place country or location named. Absent when woeid picked the place or the r
      #   @param requested_at [Time] The time the at parameter asked for, as Xquik read it. A span such as 24h shows

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

      # @see XTwitterScraper::Models::XGetTrendsResponse#location
      class Location < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute woeid
        #   Location ID. Pass it as woeid to /x/trends.
        #
        #   @return [Integer]
        required :woeid, Integer

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute country
        #   Country name. Null for Worldwide.
        #
        #   @return [String, nil]
        required :country, String, nil?: true

        # @!attribute country_code
        #   2-letter country code. Null for Worldwide.
        #
        #   @return [String, nil]
        required :country_code, String, api_name: :countryCode, nil?: true

        # @!attribute place_type
        #   X's kind of place. Town, Country, Supername for Worldwide, or Unknown.
        #
        #   @return [String, nil]
        required :place_type, String, api_name: :placeType, nil?: true

        # @!attribute place_type_code
        #   X's numeric code for the kind of place.
        #
        #   @return [Integer, nil]
        required :place_type_code, Integer, api_name: :placeTypeCode, nil?: true

        # @!attribute parent_woeid
        #   WOEID of the country or region above it. Null for Worldwide.
        #
        #   @return [Integer, nil]
        required :parent_woeid, Integer, api_name: :parentWoeid, nil?: true

        # @!attribute url
        #   X's legacy Yahoo GeoPlanet reference. It may not resolve.
        #
        #   @return [String, nil]
        required :url, String, nil?: true

        # @!method initialize(woeid:, name:, country:, country_code:, place_type:, place_type_code:, parent_woeid:, url:)
        #   A place X offers trends for.
        #
        #   @param woeid [Integer] Location ID. Pass it as woeid to /x/trends.
        #
        #   @param name [String]
        #
        #   @param country [String, nil] Country name. Null for Worldwide.
        #
        #   @param country_code [String, nil] 2-letter country code. Null for Worldwide.
        #
        #   @param place_type [String, nil] X's kind of place. Town, Country, Supername for Worldwide, or Unknown.
        #
        #   @param place_type_code [Integer, nil] X's numeric code for the kind of place.
        #
        #   @param parent_woeid [Integer, nil] WOEID of the country or region above it. Null for Worldwide.
        #
        #   @param url [String, nil] X's legacy Yahoo GeoPlanet reference. It may not resolve.
      end
    end
  end
end
