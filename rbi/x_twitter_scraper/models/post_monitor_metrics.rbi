# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PostMonitorMetrics < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::PostMonitorMetrics,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :hours

      sig do
        returns(T::Array[XTwitterScraper::Models::PostMonitorMetrics::Bucket])
      end
      attr_reader :buckets

      sig do
        params(
          buckets:
            T::Array[
              XTwitterScraper::Models::PostMonitorMetrics::Bucket::OrHash
            ]
        ).void
      end
      attr_writer :buckets

      sig do
        params(
          hours: Integer,
          buckets:
            T::Array[
              XTwitterScraper::Models::PostMonitorMetrics::Bucket::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(hours:, buckets:)
      end

      sig do
        override.returns(
          {
            hours: Integer,
            buckets:
              T::Array[XTwitterScraper::Models::PostMonitorMetrics::Bucket]
          }
        )
      end
      def to_hash
      end

      class Bucket < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::PostMonitorMetrics::Bucket,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Start of the hour.
        sig { returns(Time) }
        attr_accessor :at

        sig do
          returns(XTwitterScraper::Models::PostMonitorMetrics::Bucket::Metrics)
        end
        attr_reader :metrics

        sig do
          params(
            metrics:
              XTwitterScraper::Models::PostMonitorMetrics::Bucket::Metrics::OrHash
          ).void
        end
        attr_writer :metrics

        sig do
          params(
            at: Time,
            metrics:
              XTwitterScraper::Models::PostMonitorMetrics::Bucket::Metrics::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Start of the hour.
          at:,
          metrics:
        )
        end

        sig do
          override.returns(
            {
              at: Time,
              metrics:
                XTwitterScraper::Models::PostMonitorMetrics::Bucket::Metrics
            }
          )
        end
        def to_hash
        end

        class Metrics < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::PostMonitorMetrics::Bucket::Metrics,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # A metric's value at the hour's end & its gain over that hour. Both are null when
          # X shows no count.
          sig { returns(XTwitterScraper::Models::PostMetricPoint) }
          attr_reader :views

          sig do
            params(views: XTwitterScraper::Models::PostMetricPoint::OrHash).void
          end
          attr_writer :views

          # A metric's value at the hour's end & its gain over that hour. Both are null when
          # X shows no count.
          sig { returns(XTwitterScraper::Models::PostMetricPoint) }
          attr_reader :likes

          sig do
            params(likes: XTwitterScraper::Models::PostMetricPoint::OrHash).void
          end
          attr_writer :likes

          # A metric's value at the hour's end & its gain over that hour. Both are null when
          # X shows no count.
          sig { returns(XTwitterScraper::Models::PostMetricPoint) }
          attr_reader :retweets

          sig do
            params(
              retweets: XTwitterScraper::Models::PostMetricPoint::OrHash
            ).void
          end
          attr_writer :retweets

          # A metric's value at the hour's end & its gain over that hour. Both are null when
          # X shows no count.
          sig { returns(XTwitterScraper::Models::PostMetricPoint) }
          attr_reader :replies

          sig do
            params(
              replies: XTwitterScraper::Models::PostMetricPoint::OrHash
            ).void
          end
          attr_writer :replies

          # A metric's value at the hour's end & its gain over that hour. Both are null when
          # X shows no count.
          sig { returns(XTwitterScraper::Models::PostMetricPoint) }
          attr_reader :quotes

          sig do
            params(
              quotes: XTwitterScraper::Models::PostMetricPoint::OrHash
            ).void
          end
          attr_writer :quotes

          # A metric's value at the hour's end & its gain over that hour. Both are null when
          # X shows no count.
          sig { returns(XTwitterScraper::Models::PostMetricPoint) }
          attr_reader :bookmarks

          sig do
            params(
              bookmarks: XTwitterScraper::Models::PostMetricPoint::OrHash
            ).void
          end
          attr_writer :bookmarks

          sig do
            params(
              views: XTwitterScraper::Models::PostMetricPoint::OrHash,
              likes: XTwitterScraper::Models::PostMetricPoint::OrHash,
              retweets: XTwitterScraper::Models::PostMetricPoint::OrHash,
              replies: XTwitterScraper::Models::PostMetricPoint::OrHash,
              quotes: XTwitterScraper::Models::PostMetricPoint::OrHash,
              bookmarks: XTwitterScraper::Models::PostMetricPoint::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # A metric's value at the hour's end & its gain over that hour. Both are null when
            # X shows no count.
            views:,
            # A metric's value at the hour's end & its gain over that hour. Both are null when
            # X shows no count.
            likes:,
            # A metric's value at the hour's end & its gain over that hour. Both are null when
            # X shows no count.
            retweets:,
            # A metric's value at the hour's end & its gain over that hour. Both are null when
            # X shows no count.
            replies:,
            # A metric's value at the hour's end & its gain over that hour. Both are null when
            # X shows no count.
            quotes:,
            # A metric's value at the hour's end & its gain over that hour. Both are null when
            # X shows no count.
            bookmarks:
          )
          end

          sig do
            override.returns(
              {
                views: XTwitterScraper::Models::PostMetricPoint,
                likes: XTwitterScraper::Models::PostMetricPoint,
                retweets: XTwitterScraper::Models::PostMetricPoint,
                replies: XTwitterScraper::Models::PostMetricPoint,
                quotes: XTwitterScraper::Models::PostMetricPoint,
                bookmarks: XTwitterScraper::Models::PostMetricPoint
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
