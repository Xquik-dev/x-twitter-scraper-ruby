# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballSchedulePeriod < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballSchedulePeriod,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X's name for the period, such as Quarter.
      sig { returns(T.nilable(String)) }
      attr_accessor :type

      sig { params(type: T.nilable(String)).returns(T.attached_class) }
      def self.new(
        # X's name for the period, such as Quarter.
        type:
      )
      end

      sig { override.returns({ type: T.nilable(String) }) }
      def to_hash
      end
    end
  end
end
