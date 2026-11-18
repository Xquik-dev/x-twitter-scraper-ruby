# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballScheduleGame < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The game ID the other sports routes take.
      #
      #   @return [String]
      required :id, String

      # @!attribute season_type
      #   This game's part of the season, such as RegularSeason.
      #
      #   @return [String, nil]
      required :season_type, String, api_name: :seasonType, nil?: true

      # @!attribute week
      #   This game's week of the season.
      #
      #   @return [Integer, nil]
      required :week, Integer, nil?: true

      # @!attribute starts_at
      #   This game's kickoff time in UTC, or null when Xquik cannot read it.
      #
      #   @return [Time, nil]
      required :starts_at, Time, api_name: :startsAt, nil?: true

      # @!attribute status
      #   This game's status from X, such as Scheduled, InProgress or Closed.
      #
      #   @return [String, nil]
      required :status, String, nil?: true

      # @!attribute clock
      #   This game's clock, as X writes it.
      #
      #   @return [String, nil]
      required :clock, String, nil?: true

      # @!attribute quarter
      #   This game's current or last quarter.
      #
      #   @return [Integer, nil]
      required :quarter, Integer, nil?: true

      # @!attribute home
      #   A team's side of a game & its points.
      #
      #   @return [XTwitterScraper::Models::FootballTeamScore]
      required :home, -> { XTwitterScraper::Models::FootballTeamScore }

      # @!attribute away
      #   A team's side of a game & its points.
      #
      #   @return [XTwitterScraper::Models::FootballTeamScore]
      required :away, -> { XTwitterScraper::Models::FootballTeamScore }

      # @!attribute team_ids
      #   The game's teams, keys of teams.
      #
      #   @return [Array<String>]
      required :team_ids, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :teamIds

      # @!attribute periods
      #   The periods played so far.
      #
      #   @return [Array<XTwitterScraper::Models::FootballSchedulePeriod>]
      required :periods, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FootballSchedulePeriod] }

      # @!attribute odds
      #   Betting odds for each team, or null when X has none.
      #
      #   @return [XTwitterScraper::Models::FootballScheduleGame::Odds, nil]
      required :odds, -> { XTwitterScraper::Models::FootballScheduleGame::Odds }, nil?: true

      # @!method initialize(id:, season_type:, week:, starts_at:, status:, clock:, quarter:, home:, away:, team_ids:, periods:, odds:)
      #   A listed game, with its teams & score.
      #
      #   @param id [String] The game ID the other sports routes take.
      #
      #   @param season_type [String, nil] This game's part of the season, such as RegularSeason.
      #
      #   @param week [Integer, nil] This game's week of the season.
      #
      #   @param starts_at [Time, nil] This game's kickoff time in UTC, or null when Xquik cannot read it.
      #
      #   @param status [String, nil] This game's status from X, such as Scheduled, InProgress or Closed.
      #
      #   @param clock [String, nil] This game's clock, as X writes it.
      #
      #   @param quarter [Integer, nil] This game's current or last quarter.
      #
      #   @param home [XTwitterScraper::Models::FootballTeamScore] A team's side of a game & its points.
      #
      #   @param away [XTwitterScraper::Models::FootballTeamScore] A team's side of a game & its points.
      #
      #   @param team_ids [Array<String>] The game's teams, keys of teams.
      #
      #   @param periods [Array<XTwitterScraper::Models::FootballSchedulePeriod>] The periods played so far.
      #
      #   @param odds [XTwitterScraper::Models::FootballScheduleGame::Odds, nil] Betting odds for each team, or null when X has none.

      class Odds < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute home
        #   Betting odds titles for 1 team, as X shows them.
        #
        #   @return [XTwitterScraper::Models::FootballOdds]
        required :home, -> { XTwitterScraper::Models::FootballOdds }

        # @!attribute away
        #   Betting odds titles for 1 team, as X shows them.
        #
        #   @return [XTwitterScraper::Models::FootballOdds]
        required :away, -> { XTwitterScraper::Models::FootballOdds }

        # @!method initialize(home:, away:)
        #   Betting odds for each team, or null when X has none.
        #
        #   @param home [XTwitterScraper::Models::FootballOdds] Betting odds titles for 1 team, as X shows them.
        #
        #   @param away [XTwitterScraper::Models::FootballOdds] Betting odds titles for 1 team, as X shows them.
      end
    end
  end
end
