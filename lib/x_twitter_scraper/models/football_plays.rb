# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballPlays < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The ID of the game these plays come from.
      #
      #   @return [String]
      required :id, String

      # @!attribute league
      #   The league of the game these plays come from.
      #
      #   @return [Symbol, XTwitterScraper::Models::FootballPlays::League]
      required :league, enum: -> { XTwitterScraper::Models::FootballPlays::League }

      # @!attribute home_team_id
      #   The home team, a key of teams.
      #
      #   @return [String, nil]
      required :home_team_id, String, api_name: :homeTeamId, nil?: true

      # @!attribute away_team_id
      #   The away team, a key of teams.
      #
      #   @return [String, nil]
      required :away_team_id, String, api_name: :awayTeamId, nil?: true

      # @!attribute quarters
      #   The game's quarters, in order. Empty before kickoff.
      #
      #   @return [Array<XTwitterScraper::Models::FootballQuarter>]
      required :quarters, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FootballQuarter] }

      # @!attribute teams
      #   The teams these plays name, by team ID.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::SportsTeam}]
      required :teams, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Models::SportsTeam] }

      # @!attribute players
      #   The players these plays name, by player ID.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::FootballPlayer}]
      required :players, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Models::FootballPlayer] }

      # @!method initialize(id:, league:, home_team_id:, away_team_id:, quarters:, teams:, players:)
      #   1 game's drives & plays, by quarter.
      #
      #   @param id [String] The ID of the game these plays come from.
      #
      #   @param league [Symbol, XTwitterScraper::Models::FootballPlays::League] The league of the game these plays come from.
      #
      #   @param home_team_id [String, nil] The home team, a key of teams.
      #
      #   @param away_team_id [String, nil] The away team, a key of teams.
      #
      #   @param quarters [Array<XTwitterScraper::Models::FootballQuarter>] The game's quarters, in order. Empty before kickoff.
      #
      #   @param teams [Hash{Symbol=>XTwitterScraper::Models::SportsTeam}] The teams these plays name, by team ID.
      #
      #   @param players [Hash{Symbol=>XTwitterScraper::Models::FootballPlayer}] The players these plays name, by player ID.

      # The league of the game these plays come from.
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
