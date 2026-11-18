# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PostMetricReading < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::PostMetricReading,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_accessor :current

      sig { returns(T.nilable(Integer)) }
      attr_accessor :gain

      sig do
        params(current: T.nilable(Integer), gain: T.nilable(Integer)).returns(
          T.attached_class
        )
      end
      def self.new(current:, gain:)
      end

      sig do
        override.returns(
          { current: T.nilable(Integer), gain: T.nilable(Integer) }
        )
      end
      def to_hash
      end
    end
  end
end
