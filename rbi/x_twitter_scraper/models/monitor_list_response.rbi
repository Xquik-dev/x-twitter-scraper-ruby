# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class MonitorListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::MonitorListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T::Array[XTwitterScraper::Monitor]) }
      attr_accessor :monitors

      sig { returns(Integer) }
      attr_accessor :total

      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig do
        params(
          has_more: T::Boolean,
          monitors: T::Array[XTwitterScraper::Monitor::OrHash],
          total: Integer,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(has_more:, monitors:, total:, next_cursor: nil)
      end

      sig do
        override.returns(
          {
            has_more: T::Boolean,
            monitors: T::Array[XTwitterScraper::Monitor],
            total: Integer,
            next_cursor: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
