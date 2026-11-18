# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TrendLocation < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::TrendLocation,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Location ID. Pass it as woeid to /x/trends.
      sig { returns(Integer) }
      attr_accessor :woeid

      sig { returns(String) }
      attr_accessor :name

      # Country name. Null for Worldwide.
      sig { returns(T.nilable(String)) }
      attr_accessor :country

      # 2-letter country code. Null for Worldwide.
      sig { returns(T.nilable(String)) }
      attr_accessor :country_code

      # X's kind of place. Town, Country, Supername for Worldwide, or Unknown.
      sig { returns(T.nilable(String)) }
      attr_accessor :place_type

      # X's numeric code for the kind of place.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :place_type_code

      # WOEID of the country or region above it. Null for Worldwide.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :parent_woeid

      # X's legacy Yahoo GeoPlanet reference. It may not resolve.
      sig { returns(T.nilable(String)) }
      attr_accessor :url

      sig do
        params(
          woeid: Integer,
          name: String,
          country: T.nilable(String),
          country_code: T.nilable(String),
          place_type: T.nilable(String),
          place_type_code: T.nilable(Integer),
          parent_woeid: T.nilable(Integer),
          url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Location ID. Pass it as woeid to /x/trends.
        woeid:,
        name:,
        # Country name. Null for Worldwide.
        country:,
        # 2-letter country code. Null for Worldwide.
        country_code:,
        # X's kind of place. Town, Country, Supername for Worldwide, or Unknown.
        place_type:,
        # X's numeric code for the kind of place.
        place_type_code:,
        # WOEID of the country or region above it. Null for Worldwide.
        parent_woeid:,
        # X's legacy Yahoo GeoPlanet reference. It may not resolve.
        url:
      )
      end

      sig do
        override.returns(
          {
            woeid: Integer,
            name: String,
            country: T.nilable(String),
            country_code: T.nilable(String),
            place_type: T.nilable(String),
            place_type_code: T.nilable(Integer),
            parent_woeid: T.nilable(Integer),
            url: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
