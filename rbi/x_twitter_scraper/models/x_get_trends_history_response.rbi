# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XGetTrendsHistoryResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XGetTrendsHistoryResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Start of the range as Xquik read it. A span such as 7d shows here as the time it
      # counted back to.
      sig { returns(Time) }
      attr_accessor :from_time

      # End of the range as Xquik read it, which the range leaves out. Without to, it is
      # the time of the first request.
      sig { returns(Time) }
      attr_accessor :to_time

      # 1 stored list per step, oldest first. A step with no stored list is left out.
      sig do
        returns(
          T::Array[XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot]
        )
      end
      attr_reader :snapshots

      sig do
        params(
          snapshots:
            T::Array[
              XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot::OrHash
            ]
        ).void
      end
      attr_writer :snapshots

      # Lists returned & charged.
      sig { returns(Integer) }
      attr_accessor :count

      sig { returns(Integer) }
      attr_accessor :woeid

      # The place the request named by country or location. Absent when it sent a woeid
      # or named no place.
      sig { returns(T.nilable(XTwitterScraper::Models::TrendLocation)) }
      attr_reader :location

      sig do
        params(location: XTwitterScraper::Models::TrendLocation::OrHash).void
      end
      attr_writer :location

      # Whether the range holds more lists.
      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      # Send it as cursor for the next lists. Empty on the last page.
      sig { returns(String) }
      attr_accessor :next_cursor

      sig do
        params(
          from_time: Time,
          to_time: Time,
          snapshots:
            T::Array[
              XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot::OrHash
            ],
          count: Integer,
          woeid: Integer,
          has_next_page: T::Boolean,
          next_cursor: String,
          location: XTwitterScraper::Models::TrendLocation::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Start of the range as Xquik read it. A span such as 7d shows here as the time it
        # counted back to.
        from_time:,
        # End of the range as Xquik read it, which the range leaves out. Without to, it is
        # the time of the first request.
        to_time:,
        # 1 stored list per step, oldest first. A step with no stored list is left out.
        snapshots:,
        # Lists returned & charged.
        count:,
        woeid:,
        # Whether the range holds more lists.
        has_next_page:,
        # Send it as cursor for the next lists. Empty on the last page.
        next_cursor:,
        # The place the request named by country or location. Absent when it sent a woeid
        # or named no place.
        location: nil
      )
      end

      sig do
        override.returns(
          {
            from_time: Time,
            to_time: Time,
            snapshots:
              T::Array[
                XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot
              ],
            count: Integer,
            woeid: Integer,
            location: XTwitterScraper::Models::TrendLocation,
            has_next_page: T::Boolean,
            next_cursor: String
          }
        )
      end
      def to_hash
      end

      class Snapshot < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # When Xquik read this stored list from X. Xquik never estimates it.
        sig { returns(Time) }
        attr_accessor :captured_at

        # Trends in this list.
        sig { returns(Integer) }
        attr_accessor :count

        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot::Trend
            ]
          )
        end
        attr_reader :trends

        sig do
          params(
            trends:
              T::Array[
                XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot::Trend::OrHash
              ]
          ).void
        end
        attr_writer :trends

        sig do
          params(
            captured_at: Time,
            count: Integer,
            trends:
              T::Array[
                XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot::Trend::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # When Xquik read this stored list from X. Xquik never estimates it.
          captured_at:,
          # Trends in this list.
          count:,
          trends:
        )
        end

        sig do
          override.returns(
            {
              captured_at: Time,
              count: Integer,
              trends:
                T::Array[
                  XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot::Trend
                ]
            }
          )
        end
        def to_hash
        end

        class Trend < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot::Trend,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :name

          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          sig { returns(T.nilable(String)) }
          attr_reader :query

          sig { params(query: String).void }
          attr_writer :query

          # X's promotion ID of a promoted trend. Null for the others.
          sig { returns(T.nilable(String)) }
          attr_reader :promoted_content

          sig { params(promoted_content: T.nilable(String)).void }
          attr_writer :promoted_content

          # The trend's place in X's list at that time.
          sig { returns(T.nilable(Integer)) }
          attr_reader :rank

          sig { params(rank: Integer).void }
          attr_writer :rank

          # X's post count for the trend at that time, when X showed one.
          sig { returns(T.nilable(Integer)) }
          attr_reader :tweet_volume

          sig { params(tweet_volume: T.nilable(Integer)).void }
          attr_writer :tweet_volume

          # The trend's search link on X.
          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          sig do
            params(
              name: String,
              description: String,
              query: String,
              promoted_content: T.nilable(String),
              rank: Integer,
              tweet_volume: T.nilable(Integer),
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            name:,
            description: nil,
            query: nil,
            # X's promotion ID of a promoted trend. Null for the others.
            promoted_content: nil,
            # The trend's place in X's list at that time.
            rank: nil,
            # X's post count for the trend at that time, when X showed one.
            tweet_volume: nil,
            # The trend's search link on X.
            url: nil
          )
          end

          sig do
            override.returns(
              {
                name: String,
                description: String,
                query: String,
                promoted_content: String,
                rank: Integer,
                tweet_volume: Integer,
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
end
