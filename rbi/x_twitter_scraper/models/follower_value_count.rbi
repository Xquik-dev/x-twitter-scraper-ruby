# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FollowerValueCount < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FollowerValueCount,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :count

      sig { returns(Float) }
      attr_accessor :percent

      sig { returns(String) }
      attr_accessor :value

      sig do
        params(count: Integer, percent: Float, value: String).returns(
          T.attached_class
        )
      end
      def self.new(count:, percent:, value:)
      end

      sig do
        override.returns({ count: Integer, percent: Float, value: String })
      end
      def to_hash
      end
    end
  end
end
