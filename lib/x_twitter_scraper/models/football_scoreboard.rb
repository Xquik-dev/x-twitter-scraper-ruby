# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballScoreboard < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The game ID from your request.
      #
      #   @return [String]
      required :id, String

      # @!attribute league
      #   The league from your request.
      #
      #   @return [Symbol, XTwitterScraper::Models::FootballScoreboard::League]
      required :league, enum: -> { XTwitterScraper::Models::FootballScoreboard::League }

      # @!attribute season_id
      #   X's ID for the season. NFL games have one.
      #
      #   @return [String, nil]
      required :season_id, String, api_name: :seasonId, nil?: true

      # @!attribute season_type
      #   The part of the season, such as RegularSeason. X stopped sending it with a game
      #   on 2026-10-24, so it is null.
      #
      #   @return [String, nil]
      required :season_type, String, api_name: :seasonType, nil?: true

      # @!attribute week
      #   The week of the season. X stopped sending it with a game on 2026-10-24, so it is
      #   null. The games list still has each week.
      #
      #   @return [Integer, nil]
      required :week, Integer, nil?: true

      # @!attribute starts_at
      #   The kickoff time in UTC, or null when X sends none Xquik can read.
      #
      #   @return [Time, nil]
      required :starts_at, Time, api_name: :startsAt, nil?: true

      # @!attribute venue
      #   The stadium.
      #
      #   @return [String, nil]
      required :venue, String, nil?: true

      # @!attribute status
      #   X's game status, such as Scheduled, InProgress or Closed.
      #
      #   @return [String, nil]
      required :status, String, nil?: true

      # @!attribute clock
      #   The game clock, as X writes it.
      #
      #   @return [String, nil]
      required :clock, String, nil?: true

      # @!attribute quarter
      #   The current or last quarter.
      #
      #   @return [Integer, nil]
      required :quarter, Integer, nil?: true

      # @!attribute situation
      #   Down & distance now, or null before kickoff.
      #
      #   @return [XTwitterScraper::Models::FootballScoreboard::Situation, nil]
      required :situation, -> { XTwitterScraper::Models::FootballScoreboard::Situation }, nil?: true

      # @!attribute home
      #   A team's side of a scoreboard.
      #
      #   @return [XTwitterScraper::Models::FootballSide]
      required :home, -> { XTwitterScraper::Models::FootballSide }

      # @!attribute away
      #   A team's side of a scoreboard.
      #
      #   @return [XTwitterScraper::Models::FootballSide]
      required :away, -> { XTwitterScraper::Models::FootballSide }

      # @!attribute periods
      #   Points by period, in order.
      #
      #   @return [Array<XTwitterScraper::Models::FootballPeriod>]
      required :periods, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FootballPeriod] }

      # @!attribute last_play
      #   The latest play, or null before kickoff. Its steps can list no players for a
      #   short while.
      #
      #   @return [XTwitterScraper::Models::FootballPlay, nil]
      required :last_play, -> { XTwitterScraper::Models::FootballPlay }, api_name: :lastPlay, nil?: true

      # @!attribute teams
      #   The teams this answer names, by team ID.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::SportsTeam}]
      required :teams, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Models::SportsTeam] }

      # @!attribute players
      #   The players this answer names, by player ID.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::FootballPlayer}]
      required :players, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Models::FootballPlayer] }

      # @!method initialize(id:, league:, season_id:, season_type:, week:, starts_at:, venue:, status:, clock:, quarter:, situation:, home:, away:, periods:, last_play:, teams:, players:)
      #   1 game's scoreboard.
      #
      #   @param id [String] The game ID from your request.
      #
      #   @param league [Symbol, XTwitterScraper::Models::FootballScoreboard::League] The league from your request.
      #
      #   @param season_id [String, nil] X's ID for the season. NFL games have one.
      #
      #   @param season_type [String, nil] The part of the season, such as RegularSeason. X stopped sending it with a game on 2026-10-24, so it is null.
      #
      #   @param week [Integer, nil] The week of the season. X stopped sending it with a game on 2026-10-24, so it is null. The games list still has each week.
      #
      #   @param starts_at [Time, nil] The kickoff time in UTC, or null when X sends none Xquik can read.
      #
      #   @param venue [String, nil] The stadium.
      #
      #   @param status [String, nil] X's game status, such as Scheduled, InProgress or Closed.
      #
      #   @param clock [String, nil] The game clock, as X writes it.
      #
      #   @param quarter [Integer, nil] The current or last quarter.
      #
      #   @param situation [XTwitterScraper::Models::FootballScoreboard::Situation, nil] Down & distance now, or null before kickoff.
      #
      #   @param home [XTwitterScraper::Models::FootballSide] A team's side of a scoreboard.
      #
      #   @param away [XTwitterScraper::Models::FootballSide] A team's side of a scoreboard.
      #
      #   @param periods [Array<XTwitterScraper::Models::FootballPeriod>] Points by period, in order.
      #
      #   @param last_play [XTwitterScraper::Models::FootballPlay, nil] The latest play, or null before kickoff. Its steps can list no players for a short while.
      #
      #   @param teams [Hash{Symbol=>XTwitterScraper::Models::SportsTeam}] The teams this answer names, by team ID.
      #
      #   @param players [Hash{Symbol=>XTwitterScraper::Models::FootballPlayer}] The players this answer names, by player ID.

      # The league from your request.
      module League
        extend XTwitterScraper::Internal::Type::Enum

        NFL = :nfl
        NCAAFB = :ncaafb

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Situation < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute down
        #   The current down, from 1 to 4.
        #
        #   @return [Integer, nil]
        required :down, Integer, nil?: true

        # @!attribute yards_to_go
        #   The yards the offense needs now for a first down.
        #
        #   @return [Integer, nil]
        required :yards_to_go, Integer, api_name: :yardsToGo, nil?: true

        # @!attribute yardline
        #   The ball's current yard line.
        #
        #   @return [Integer, nil]
        required :yardline, Integer, nil?: true

        # @!attribute yardline_team_id
        #   The team whose half the ball is in, a key of teams.
        #
        #   @return [String, nil]
        required :yardline_team_id, String, api_name: :yardlineTeamId, nil?: true

        # @!attribute possession_team_id
        #   The team with the ball, a key of teams.
        #
        #   @return [String, nil]
        required :possession_team_id, String, api_name: :possessionTeamId, nil?: true

        # @!method initialize(down:, yards_to_go:, yardline:, yardline_team_id:, possession_team_id:)
        #   Down & distance now, or null before kickoff.
        #
        #   @param down [Integer, nil] The current down, from 1 to 4.
        #
        #   @param yards_to_go [Integer, nil] The yards the offense needs now for a first down.
        #
        #   @param yardline [Integer, nil] The ball's current yard line.
        #
        #   @param yardline_team_id [String, nil] The team whose half the ball is in, a key of teams.
        #
        #   @param possession_team_id [String, nil] The team with the ball, a key of teams.
      end
    end
  end
end
