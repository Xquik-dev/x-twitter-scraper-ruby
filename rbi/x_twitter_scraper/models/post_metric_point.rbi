# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PostMetricPoint < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::PostMetricPoint,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_accessor :value

      sig { returns(T.nilable(Integer)) }
      attr_accessor :gain

      sig do
        params(value: T.nilable(Integer), gain: T.nilable(Integer)).returns(
          T.attached_class
        )
      end
      def self.new(value:, gain:)
      end

      sig do
        override.returns(
          { value: T.nilable(Integer), gain: T.nilable(Integer) }
        )
      end
      def to_hash
      end
    end
  end
end
