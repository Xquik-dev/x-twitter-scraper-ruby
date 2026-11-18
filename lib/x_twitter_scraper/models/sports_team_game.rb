# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class SportsTeamGame < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The game ID, which the game routes take.
      #
      #   @return [String]
      required :id, String

      # @!attribute starts_at
      #   When this game kicked off, in UTC. Null when Xquik can't read X's time.
      #
      #   @return [Time, nil]
      required :starts_at, Time, api_name: :startsAt, nil?: true

      # @!attribute venue
      #   The stadium. X has sent none in recent games so far.
      #
      #   @return [String, nil]
      required :venue, String, nil?: true

      # @!attribute status
      #   This game's status as X names it, such as Closed.
      #
      #   @return [String, nil]
      required :status, String, nil?: true

      # @!attribute clock
      #   The game clock, as X writes it. X has sent none so far.
      #
      #   @return [String, nil]
      required :clock, String, nil?: true

      # @!attribute quarter
      #   The current or last quarter. X has sent none so far.
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

      # @!method initialize(id:, starts_at:, venue:, status:, clock:, quarter:, home:, away:)
      #   A recent game of a team, as X lists it with the team.
      #
      #   @param id [String] The game ID, which the game routes take.
      #
      #   @param starts_at [Time, nil] When this game kicked off, in UTC. Null when Xquik can't read X's time.
      #
      #   @param venue [String, nil] The stadium. X has sent none in recent games so far.
      #
      #   @param status [String, nil] This game's status as X names it, such as Closed.
      #
      #   @param clock [String, nil] The game clock, as X writes it. X has sent none so far.
      #
      #   @param quarter [Integer, nil] The current or last quarter. X has sent none so far.
      #
      #   @param home [XTwitterScraper::Models::FootballTeamScore] A team's side of a game & its points.
      #
      #   @param away [XTwitterScraper::Models::FootballTeamScore] A team's side of a game & its points.
    end
  end
end
