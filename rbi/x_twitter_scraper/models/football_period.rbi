# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballPeriod < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballPeriod,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X's name for the period, such as Quarter.
      sig { returns(T.nilable(String)) }
      attr_accessor :type

      # The period's number, or null when X sends no digits.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :number

      # The period's place in the game, from 1.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :sequence

      # The home team's points in the period.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :home_points

      # The away team's points in the period.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :away_points

      sig do
        params(
          type: T.nilable(String),
          number: T.nilable(Integer),
          sequence: T.nilable(Integer),
          home_points: T.nilable(Integer),
          away_points: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # X's name for the period, such as Quarter.
        type:,
        # The period's number, or null when X sends no digits.
        number:,
        # The period's place in the game, from 1.
        sequence:,
        # The home team's points in the period.
        home_points:,
        # The away team's points in the period.
        away_points:
      )
      end

      sig do
        override.returns(
          {
            type: T.nilable(String),
            number: T.nilable(Integer),
            sequence: T.nilable(Integer),
            home_points: T.nilable(Integer),
            away_points: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end
    end
  end
end
