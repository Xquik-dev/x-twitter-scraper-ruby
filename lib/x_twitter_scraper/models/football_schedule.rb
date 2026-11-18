# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballSchedule < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute league
      #   The league whose games this list holds.
      #
      #   @return [Symbol, XTwitterScraper::Models::FootballSchedule::League]
      required :league, enum: -> { XTwitterScraper::Models::FootballSchedule::League }

      # @!attribute games
      #   The games, earliest first.
      #
      #   @return [Array<XTwitterScraper::Models::FootballScheduleGame>]
      required :games, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FootballScheduleGame] }

      # @!attribute teams
      #   The teams the games name, by team ID.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::SportsTeam}]
      required :teams, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Models::SportsTeam] }

      # @!method initialize(league:, games:, teams:)
      #   A league's games in a time window.
      #
      #   @param league [Symbol, XTwitterScraper::Models::FootballSchedule::League] The league whose games this list holds.
      #
      #   @param games [Array<XTwitterScraper::Models::FootballScheduleGame>] The games, earliest first.
      #
      #   @param teams [Hash{Symbol=>XTwitterScraper::Models::SportsTeam}] The teams the games name, by team ID.

      # The league whose games this list holds.
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
