# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityAnalyticsMetric < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CommunityAnalyticsMetric,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Total for this metric during X's latest period.
      sig { returns(Integer) }
      attr_accessor :count

      # Change in percent from the same figure 1 day earlier. Values stay unrounded.
      sig { returns(Float) }
      attr_accessor :change_percent

      sig do
        params(count: Integer, change_percent: Float).returns(T.attached_class)
      end
      def self.new(
        # Total for this metric during X's latest period.
        count:,
        # Change in percent from the same figure 1 day earlier. Values stay unrounded.
        change_percent:
      )
      end

      sig { override.returns({ count: Integer, change_percent: Float }) }
      def to_hash
      end
    end
  end
end
