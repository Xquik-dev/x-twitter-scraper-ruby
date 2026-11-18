# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PlaceSearchResult < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   Place ID. Pass it as place to /x/tweets/search.
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Short name of the place.
      #
      #   @return [String]
      required :name, String

      # @!attribute full_name
      #   Name with the region or country around the place.
      #
      #   @return [String, nil]
      required :full_name, String, api_name: :fullName, nil?: true

      # @!attribute country
      #   Country the place lies in.
      #
      #   @return [String, nil]
      required :country, String, nil?: true

      # @!attribute country_code
      #   2-letter code of the country the place lies in.
      #
      #   @return [String, nil]
      required :country_code, String, api_name: :countryCode, nil?: true

      # @!attribute place_type
      #   X's kind of place, such as city, admin, neighborhood, poi or country.
      #
      #   @return [String, nil]
      required :place_type, String, api_name: :placeType, nil?: true

      # @!attribute url
      #   X's own reference URL for the place.
      #
      #   @return [String, nil]
      required :url, String, nil?: true

      # @!attribute centroid
      #   Center of the place. Longitude, then latitude.
      #
      #   @return [Array<Float>, nil]
      required :centroid, XTwitterScraper::Internal::Type::ArrayOf[Float], nil?: true

      # @!attribute bounding_box
      #   Outline of the place as GeoJSON. Each point holds longitude, then latitude.
      #
      #   @return [XTwitterScraper::Models::PlaceSearchResult::BoundingBox, nil]
      required :bounding_box, -> { XTwitterScraper::Models::PlaceSearchResult::BoundingBox }, api_name: :boundingBox, nil?: true

      # @!attribute attributes
      #   Extra details X attaches to some places. Often empty.
      #
      #   @return [Hash{Symbol=>Object}]
      required :attributes, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

      # @!attribute contained_within
      #   Larger places this place lies in. Often 1.
      #
      #   @return [Array<XTwitterScraper::Models::Place>]
      required :contained_within, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Place] }, api_name: :containedWithin

      # @!method initialize(id:, name:, full_name:, country:, country_code:, place_type:, url:, centroid:, bounding_box:, attributes:, contained_within:)
      #   A place X found, with the larger places it lies in.
      #
      #   @param id [String] Place ID. Pass it as place to /x/tweets/search.
      #
      #   @param name [String] Short name of the place.
      #
      #   @param full_name [String, nil] Name with the region or country around the place.
      #
      #   @param country [String, nil] Country the place lies in.
      #
      #   @param country_code [String, nil] 2-letter code of the country the place lies in.
      #
      #   @param place_type [String, nil] X's kind of place, such as city, admin, neighborhood, poi or country.
      #
      #   @param url [String, nil] X's own reference URL for the place.
      #
      #   @param centroid [Array<Float>, nil] Center of the place. Longitude, then latitude.
      #
      #   @param bounding_box [XTwitterScraper::Models::PlaceSearchResult::BoundingBox, nil] Outline of the place as GeoJSON. Each point holds longitude, then latitude.
      #
      #   @param attributes [Hash{Symbol=>Object}] Extra details X attaches to some places. Often empty.
      #
      #   @param contained_within [Array<XTwitterScraper::Models::Place>] Larger places this place lies in. Often 1.

      class BoundingBox < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute type
        #   GeoJSON shape of the outline.
        #
        #   @return [String]
        required :type, String

        # @!attribute coordinates
        #   Rings of points that draw the outline.
        #
        #   @return [Array<Array<Array<Float>>>]
        required :coordinates,
                 XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Internal::Type::ArrayOf[Float]]]

        # @!method initialize(type:, coordinates:)
        #   Outline of the place as GeoJSON. Each point holds longitude, then latitude.
        #
        #   @param type [String] GeoJSON shape of the outline.
        #
        #   @param coordinates [Array<Array<Array<Float>>>] Rings of points that draw the outline.
      end
    end
  end
end
