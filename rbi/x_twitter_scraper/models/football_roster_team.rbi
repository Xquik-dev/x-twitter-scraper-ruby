# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballRosterTeam < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballRosterTeam,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The team this roster belongs to, a key of teams.
      sig { returns(String) }
      attr_accessor :team_id

      # The team's players in X's order, keys of players.
      sig { returns(T::Array[String]) }
      attr_accessor :player_ids

      sig do
        params(team_id: String, player_ids: T::Array[String]).returns(
          T.attached_class
        )
      end
      def self.new(
        # The team this roster belongs to, a key of teams.
        team_id:,
        # The team's players in X's order, keys of players.
        player_ids:
      )
      end

      sig do
        override.returns({ team_id: String, player_ids: T::Array[String] })
      end
      def to_hash
      end
    end
  end
end
