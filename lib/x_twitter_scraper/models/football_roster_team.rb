# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballRosterTeam < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute team_id
      #   The team this roster belongs to, a key of teams.
      #
      #   @return [String]
      required :team_id, String, api_name: :teamId

      # @!attribute player_ids
      #   The team's players in X's order, keys of players.
      #
      #   @return [Array<String>]
      required :player_ids, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :playerIds

      # @!method initialize(team_id:, player_ids:)
      #   1 team's roster.
      #
      #   @param team_id [String] The team this roster belongs to, a key of teams.
      #
      #   @param player_ids [Array<String>] The team's players in X's order, keys of players.
    end
  end
end
