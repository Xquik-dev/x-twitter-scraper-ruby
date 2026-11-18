# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballOdds < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballOdds,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The money line. X sends it for the away team only.
      sig { returns(T.nilable(String)) }
      attr_accessor :money_line

      # The point spread.
      sig { returns(T.nilable(String)) }
      attr_accessor :spread

      # The over or under total.
      sig { returns(T.nilable(String)) }
      attr_accessor :total

      sig do
        params(
          money_line: T.nilable(String),
          spread: T.nilable(String),
          total: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The money line. X sends it for the away team only.
        money_line:,
        # The point spread.
        spread:,
        # The over or under total.
        total:
      )
      end

      sig do
        override.returns(
          {
            money_line: T.nilable(String),
            spread: T.nilable(String),
            total: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
