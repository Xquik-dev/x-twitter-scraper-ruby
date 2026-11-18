# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TrendLocation < XTwitterScraper::Internal::Type::BaseModel
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
