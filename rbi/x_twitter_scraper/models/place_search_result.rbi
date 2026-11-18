# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PlaceSearchResult < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::PlaceSearchResult,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Place ID. Pass it as place to /x/tweets/search.
      sig { returns(String) }
      attr_accessor :id

      # Short name of the place.
      sig { returns(String) }
      attr_accessor :name

      # Name with the region or country around the place.
      sig { returns(T.nilable(String)) }
      attr_accessor :full_name

      # Country the place lies in.
      sig { returns(T.nilable(String)) }
      attr_accessor :country

      # 2-letter code of the country the place lies in.
      sig { returns(T.nilable(String)) }
      attr_accessor :country_code

      # X's kind of place, such as city, admin, neighborhood, poi or country.
      sig { returns(T.nilable(String)) }
      attr_accessor :place_type

      # X's own reference URL for the place.
      sig { returns(T.nilable(String)) }
      attr_accessor :url

      # Center of the place. Longitude, then latitude.
      sig { returns(T.nilable(T::Array[Float])) }
      attr_accessor :centroid

      # Outline of the place as GeoJSON. Each point holds longitude, then latitude.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::PlaceSearchResult::BoundingBox)
        )
      end
      attr_reader :bounding_box

      sig do
        params(
          bounding_box:
            T.nilable(
              XTwitterScraper::Models::PlaceSearchResult::BoundingBox::OrHash
            )
        ).void
      end
      attr_writer :bounding_box

      # Extra details X attaches to some places. Often empty.
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :attributes

      # Larger places this place lies in. Often 1.
      sig { returns(T::Array[XTwitterScraper::Models::Place]) }
      attr_reader :contained_within

      sig do
        params(
          contained_within: T::Array[XTwitterScraper::Models::Place::OrHash]
        ).void
      end
      attr_writer :contained_within

      sig do
        params(
          id: String,
          name: String,
          full_name: T.nilable(String),
          country: T.nilable(String),
          country_code: T.nilable(String),
          place_type: T.nilable(String),
          url: T.nilable(String),
          centroid: T.nilable(T::Array[Float]),
          bounding_box:
            T.nilable(
              XTwitterScraper::Models::PlaceSearchResult::BoundingBox::OrHash
            ),
          attributes: T::Hash[Symbol, T.anything],
          contained_within: T::Array[XTwitterScraper::Models::Place::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Place ID. Pass it as place to /x/tweets/search.
        id:,
        # Short name of the place.
        name:,
        # Name with the region or country around the place.
        full_name:,
        # Country the place lies in.
        country:,
        # 2-letter code of the country the place lies in.
        country_code:,
        # X's kind of place, such as city, admin, neighborhood, poi or country.
        place_type:,
        # X's own reference URL for the place.
        url:,
        # Center of the place. Longitude, then latitude.
        centroid:,
        # Outline of the place as GeoJSON. Each point holds longitude, then latitude.
        bounding_box:,
        # Extra details X attaches to some places. Often empty.
        attributes:,
        # Larger places this place lies in. Often 1.
        contained_within:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            full_name: T.nilable(String),
            country: T.nilable(String),
            country_code: T.nilable(String),
            place_type: T.nilable(String),
            url: T.nilable(String),
            centroid: T.nilable(T::Array[Float]),
            bounding_box:
              T.nilable(
                XTwitterScraper::Models::PlaceSearchResult::BoundingBox
              ),
            attributes: T::Hash[Symbol, T.anything],
            contained_within: T::Array[XTwitterScraper::Models::Place]
          }
        )
      end
      def to_hash
      end

      class BoundingBox < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::PlaceSearchResult::BoundingBox,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # GeoJSON shape of the outline.
        sig { returns(String) }
        attr_accessor :type

        # Rings of points that draw the outline.
        sig { returns(T::Array[T::Array[T::Array[Float]]]) }
        attr_accessor :coordinates

        sig do
          params(
            type: String,
            coordinates: T::Array[T::Array[T::Array[Float]]]
          ).returns(T.attached_class)
        end
        def self.new(
          # GeoJSON shape of the outline.
          type:,
          # Rings of points that draw the outline.
          coordinates:
        )
        end

        sig do
          override.returns(
            { type: String, coordinates: T::Array[T::Array[T::Array[Float]]] }
          )
        end
        def to_hash
        end
      end
    end
  end
end
