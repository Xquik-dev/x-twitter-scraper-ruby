# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XGetTrendsResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XGetTrendsResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :count

      sig do
        returns(T::Array[XTwitterScraper::Models::XGetTrendsResponse::Trend])
      end
      attr_accessor :trends

      sig { returns(Integer) }
      attr_accessor :woeid

      # When Xquik read this list from X. It comes from the stored list and is never
      # estimated.
      sig { returns(T.nilable(Time)) }
      attr_reader :captured_at

      sig { params(captured_at: Time).void }
      attr_writer :captured_at

      # The place country or location named. Absent when woeid picked the place or the
      # request named none.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::XGetTrendsResponse::Location)
        )
      end
      attr_reader :location

      sig do
        params(
          location:
            XTwitterScraper::Models::XGetTrendsResponse::Location::OrHash
        ).void
      end
      attr_writer :location

      # The time the at parameter asked for, as Xquik read it. A span such as 24h shows
      # here as the time it counted back to. Present only with at.
      sig { returns(T.nilable(Time)) }
      attr_reader :requested_at

      sig { params(requested_at: Time).void }
      attr_writer :requested_at

      sig do
        params(
          count: Integer,
          trends:
            T::Array[
              XTwitterScraper::Models::XGetTrendsResponse::Trend::OrHash
            ],
          woeid: Integer,
          captured_at: Time,
          location:
            XTwitterScraper::Models::XGetTrendsResponse::Location::OrHash,
          requested_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        count:,
        trends:,
        woeid:,
        # When Xquik read this list from X. It comes from the stored list and is never
        # estimated.
        captured_at: nil,
        # The place country or location named. Absent when woeid picked the place or the
        # request named none.
        location: nil,
        # The time the at parameter asked for, as Xquik read it. A span such as 24h shows
        # here as the time it counted back to. Present only with at.
        requested_at: nil
      )
      end

      sig do
        override.returns(
          {
            count: Integer,
            trends:
              T::Array[XTwitterScraper::Models::XGetTrendsResponse::Trend],
            woeid: Integer,
            captured_at: Time,
            location: XTwitterScraper::Models::XGetTrendsResponse::Location,
            requested_at: Time
          }
        )
      end
      def to_hash
      end

      class Trend < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::XGetTrendsResponse::Trend,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Promotion identifier from X. Null for organic trends.
        sig { returns(T.nilable(String)) }
        attr_accessor :promoted_content

        sig { returns(T.nilable(String)) }
        attr_reader :query

        sig { params(query: String).void }
        attr_writer :query

        sig { returns(T.nilable(Integer)) }
        attr_reader :rank

        sig { params(rank: Integer).void }
        attr_writer :rank

        # Approximate public post volume when X supplies it.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :tweet_volume

        # X search URL for the trend.
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig do
          params(
            name: String,
            description: String,
            promoted_content: T.nilable(String),
            query: String,
            rank: Integer,
            tweet_volume: T.nilable(Integer),
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          name:,
          description: nil,
          # Promotion identifier from X. Null for organic trends.
          promoted_content: nil,
          query: nil,
          rank: nil,
          # Approximate public post volume when X supplies it.
          tweet_volume: nil,
          # X search URL for the trend.
          url: nil
        )
        end

        sig do
          override.returns(
            {
              name: String,
              description: String,
              promoted_content: T.nilable(String),
              query: String,
              rank: Integer,
              tweet_volume: T.nilable(Integer),
              url: String
            }
          )
        end
        def to_hash
        end
      end

      class Location < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::XGetTrendsResponse::Location,
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

        # A place X offers trends for.
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
end
