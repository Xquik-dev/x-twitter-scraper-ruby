# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballTeamBox < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballTeamBox,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The team these totals belong to, a key of teams.
      sig { returns(T.nilable(String)) }
      attr_accessor :team_id

      # The team's totals, or null before kickoff.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballTeamTotals)) }
      attr_reader :totals

      sig do
        params(
          totals: T.nilable(XTwitterScraper::Models::FootballTeamTotals::OrHash)
        ).void
      end
      attr_writer :totals

      # Each player with stats, 1 entry per player.
      sig { returns(T::Array[XTwitterScraper::Models::FootballPlayerStats]) }
      attr_reader :players

      sig do
        params(
          players:
            T::Array[XTwitterScraper::Models::FootballPlayerStats::OrHash]
        ).void
      end
      attr_writer :players

      sig do
        params(
          team_id: T.nilable(String),
          totals:
            T.nilable(XTwitterScraper::Models::FootballTeamTotals::OrHash),
          players:
            T::Array[XTwitterScraper::Models::FootballPlayerStats::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The team these totals belong to, a key of teams.
        team_id:,
        # The team's totals, or null before kickoff.
        totals:,
        # Each player with stats, 1 entry per player.
        players:
      )
      end

      sig do
        override.returns(
          {
            team_id: T.nilable(String),
            totals: T.nilable(XTwitterScraper::Models::FootballTeamTotals),
            players: T::Array[XTwitterScraper::Models::FootballPlayerStats]
          }
        )
      end
      def to_hash
      end
    end
  end
end
