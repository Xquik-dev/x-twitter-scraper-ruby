# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballBoxScore < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The ID of the game this box score covers.
      #
      #   @return [String]
      required :id, String

      # @!attribute league
      #   The league of the game this box score covers.
      #
      #   @return [Symbol, XTwitterScraper::Models::FootballBoxScore::League]
      required :league, enum: -> { XTwitterScraper::Models::FootballBoxScore::League }

      # @!attribute home
      #   1 team's totals & player stats.
      #
      #   @return [XTwitterScraper::Models::FootballTeamBox]
      required :home, -> { XTwitterScraper::Models::FootballTeamBox }

      # @!attribute away
      #   1 team's totals & player stats.
      #
      #   @return [XTwitterScraper::Models::FootballTeamBox]
      required :away, -> { XTwitterScraper::Models::FootballTeamBox }

      # @!attribute teams
      #   The teams this box score names, by team ID.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::SportsTeam}]
      required :teams, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Models::SportsTeam] }

      # @!attribute players
      #   The players this box score names, by player ID.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::FootballPlayer}]
      required :players, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Models::FootballPlayer] }

      # @!method initialize(id:, league:, home:, away:, teams:, players:)
      #   1 game's team totals & player stats.
      #
      #   @param id [String] The ID of the game this box score covers.
      #
      #   @param league [Symbol, XTwitterScraper::Models::FootballBoxScore::League] The league of the game this box score covers.
      #
      #   @param home [XTwitterScraper::Models::FootballTeamBox] 1 team's totals & player stats.
      #
      #   @param away [XTwitterScraper::Models::FootballTeamBox] 1 team's totals & player stats.
      #
      #   @param teams [Hash{Symbol=>XTwitterScraper::Models::SportsTeam}] The teams this box score names, by team ID.
      #
      #   @param players [Hash{Symbol=>XTwitterScraper::Models::FootballPlayer}] The players this box score names, by player ID.

      # The league of the game this box score covers.
      module League
        extend XTwitterScraper::Internal::Type::Enum

        NFL = :nfl
        NCAAFB = :ncaafb

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
