# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballSide < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballSide,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The team, a key of teams.
      sig { returns(T.nilable(String)) }
      attr_accessor :team_id

      # The team's points so far.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :points

      # The timeouts the team has left.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :timeouts_left

      sig do
        params(
          team_id: T.nilable(String),
          points: T.nilable(Integer),
          timeouts_left: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # The team, a key of teams.
        team_id:,
        # The team's points so far.
        points:,
        # The timeouts the team has left.
        timeouts_left:
      )
      end

      sig do
        override.returns(
          {
            team_id: T.nilable(String),
            points: T.nilable(Integer),
            timeouts_left: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end
    end
  end
end
