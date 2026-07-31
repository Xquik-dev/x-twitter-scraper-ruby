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

      sig do
        params(
          count: Integer,
          trends:
            T::Array[
              XTwitterScraper::Models::XGetTrendsResponse::Trend::OrHash
            ],
          woeid: Integer
        ).returns(T.attached_class)
      end
      def self.new(count:, trends:, woeid:)
      end

      sig do
        override.returns(
          {
            count: Integer,
            trends:
              T::Array[XTwitterScraper::Models::XGetTrendsResponse::Trend],
            woeid: Integer
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
    end
  end
end
