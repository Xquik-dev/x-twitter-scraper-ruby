# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballTeamTotals < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute first_downs
      #   First downs.
      #
      #   @return [Integer, nil]
      required :first_downs, Integer, api_name: :firstDowns, nil?: true

      # @!attribute third_downs
      #   Third downs tried & converted.
      #
      #   @return [XTwitterScraper::Models::FootballTeamTotals::ThirdDowns, nil]
      required :third_downs, -> { XTwitterScraper::Models::FootballTeamTotals::ThirdDowns }, api_name: :thirdDowns, nil?: true

      # @!attribute fumbles
      #   The team's fumbles, or null.
      #
      #   @return [XTwitterScraper::Models::FootballFumbleStats, nil]
      required :fumbles, -> { XTwitterScraper::Models::FootballFumbleStats }, nil?: true

      # @!attribute passing
      #   The team's passing, or null.
      #
      #   @return [XTwitterScraper::Models::FootballPassingStats, nil]
      required :passing, -> { XTwitterScraper::Models::FootballPassingStats }, nil?: true

      # @!attribute penalties
      #   Penalties against the team.
      #
      #   @return [XTwitterScraper::Models::FootballTeamTotals::Penalties, nil]
      required :penalties, -> { XTwitterScraper::Models::FootballTeamTotals::Penalties }, nil?: true

      # @!attribute rushing
      #   The team's rushing, or null.
      #
      #   @return [XTwitterScraper::Models::FootballRushingStats, nil]
      required :rushing, -> { XTwitterScraper::Models::FootballRushingStats }, nil?: true

      # @!attribute time_of_possession_seconds
      #   Time with the ball, in seconds.
      #
      #   @return [Integer, nil]
      required :time_of_possession_seconds, Integer, api_name: :timeOfPossessionSeconds, nil?: true

      # @!attribute total_yards
      #   Total yards.
      #
      #   @return [Integer, nil]
      required :total_yards, Integer, api_name: :totalYards, nil?: true

      # @!attribute turnovers
      #   Turnovers.
      #
      #   @return [Integer, nil]
      required :turnovers, Integer, nil?: true

      # @!method initialize(first_downs:, third_downs:, fumbles:, passing:, penalties:, rushing:, time_of_possession_seconds:, total_yards:, turnovers:)
      #   A team's totals for 1 game.
      #
      #   @param first_downs [Integer, nil] First downs.
      #
      #   @param third_downs [XTwitterScraper::Models::FootballTeamTotals::ThirdDowns, nil] Third downs tried & converted.
      #
      #   @param fumbles [XTwitterScraper::Models::FootballFumbleStats, nil] The team's fumbles, or null.
      #
      #   @param passing [XTwitterScraper::Models::FootballPassingStats, nil] The team's passing, or null.
      #
      #   @param penalties [XTwitterScraper::Models::FootballTeamTotals::Penalties, nil] Penalties against the team.
      #
      #   @param rushing [XTwitterScraper::Models::FootballRushingStats, nil] The team's rushing, or null.
      #
      #   @param time_of_possession_seconds [Integer, nil] Time with the ball, in seconds.
      #
      #   @param total_yards [Integer, nil] Total yards.
      #
      #   @param turnovers [Integer, nil] Turnovers.

      class ThirdDowns < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute attempts
        #   Third downs tried.
        #
        #   @return [Integer, nil]
        required :attempts, Integer, nil?: true

        # @!attribute successes
        #   Third downs converted.
        #
        #   @return [Integer, nil]
        required :successes, Integer, nil?: true

        # @!method initialize(attempts:, successes:)
        #   Third downs tried & converted.
        #
        #   @param attempts [Integer, nil] Third downs tried.
        #
        #   @param successes [Integer, nil] Third downs converted.
      end

      class Penalties < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute count
        #   Penalties.
        #
        #   @return [Integer, nil]
        required :count, Integer, nil?: true

        # @!attribute yards
        #   Penalty yards.
        #
        #   @return [Integer, nil]
        required :yards, Integer, nil?: true

        # @!method initialize(count:, yards:)
        #   Penalties against the team.
        #
        #   @param count [Integer, nil] Penalties.
        #
        #   @param yards [Integer, nil] Penalty yards.
      end
    end
  end
end
