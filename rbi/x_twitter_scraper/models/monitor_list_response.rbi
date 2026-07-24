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

      sig { returns(T::Array[XTwitterScraper::Monitor]) }
      attr_accessor :monitors

      sig { returns(Integer) }
      attr_accessor :total

      sig do
        params(
          monitors: T::Array[XTwitterScraper::Monitor::OrHash],
          total: Integer
        ).returns(T.attached_class)
      end
      def self.new(monitors:, total:)
      end

      sig do
        override.returns(
          { monitors: T::Array[XTwitterScraper::Monitor], total: Integer }
        )
      end
      def to_hash
      end
    end
  end
end
