# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballTeamBox < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute team_id
      #   The team these totals belong to, a key of teams.
      #
      #   @return [String, nil]
      required :team_id, String, api_name: :teamId, nil?: true

      # @!attribute totals
      #   The team's totals, or null before kickoff.
      #
      #   @return [XTwitterScraper::Models::FootballTeamTotals, nil]
      required :totals, -> { XTwitterScraper::Models::FootballTeamTotals }, nil?: true

      # @!attribute players
      #   Each player with stats, 1 entry per player.
      #
      #   @return [Array<XTwitterScraper::Models::FootballPlayerStats>]
      required :players, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FootballPlayerStats] }

      # @!method initialize(team_id:, totals:, players:)
      #   1 team's totals & player stats.
      #
      #   @param team_id [String, nil] The team these totals belong to, a key of teams.
      #
      #   @param totals [XTwitterScraper::Models::FootballTeamTotals, nil] The team's totals, or null before kickoff.
      #
      #   @param players [Array<XTwitterScraper::Models::FootballPlayerStats>] Each player with stats, 1 entry per player.
    end
  end
end
