# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballRoster < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The ID of the game these rosters cover.
      #
      #   @return [String]
      required :id, String

      # @!attribute league
      #   The league of the game these rosters cover.
      #
      #   @return [Symbol, XTwitterScraper::Models::FootballRoster::League]
      required :league, enum: -> { XTwitterScraper::Models::FootballRoster::League }

      # @!attribute rosters
      #   Each team's roster, in X's order.
      #
      #   @return [Array<XTwitterScraper::Models::FootballRosterTeam>]
      required :rosters, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FootballRosterTeam] }

      # @!attribute teams
      #   The 2 teams, by team ID.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::SportsTeam}]
      required :teams, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Models::SportsTeam] }

      # @!attribute players
      #   Every rostered player, by player ID. Rosters carry no college or birth details &
      #   only a medium headshot, so the rest are null.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::FootballPlayer}]
      required :players, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Models::FootballPlayer] }

      # @!method initialize(id:, league:, rosters:, teams:, players:)
      #   Both teams' rosters for 1 NFL game.
      #
      #   @param id [String] The ID of the game these rosters cover.
      #
      #   @param league [Symbol, XTwitterScraper::Models::FootballRoster::League] The league of the game these rosters cover.
      #
      #   @param rosters [Array<XTwitterScraper::Models::FootballRosterTeam>] Each team's roster, in X's order.
      #
      #   @param teams [Hash{Symbol=>XTwitterScraper::Models::SportsTeam}] The 2 teams, by team ID.
      #
      #   @param players [Hash{Symbol=>XTwitterScraper::Models::FootballPlayer}] Every rostered player, by player ID. Rosters carry no college or birth details & only a medium headshot, so the rest are null.

      # The league of the game these rosters cover.
      module League
        extend XTwitterScraper::Internal::Type::Enum

        NFL = :nfl

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
