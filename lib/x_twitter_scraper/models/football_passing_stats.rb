# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballPassingStats < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute attempts
      #   Passes thrown.
      #
      #   @return [Integer, nil]
      required :attempts, Integer, nil?: true

      # @!attribute avg_yards
      #   Yards per pass.
      #
      #   @return [Float, nil]
      required :avg_yards, Float, api_name: :avgYards, nil?: true

      # @!attribute completions
      #   Passes caught.
      #
      #   @return [Integer, nil]
      required :completions, Integer, nil?: true

      # @!attribute interceptions
      #   Passes intercepted.
      #
      #   @return [Integer, nil]
      required :interceptions, Integer, nil?: true

      # @!attribute net_yards
      #   Passing yards minus sack yards.
      #
      #   @return [Integer, nil]
      required :net_yards, Integer, api_name: :netYards, nil?: true

      # @!attribute rating
      #   The passer rating.
      #
      #   @return [Float, nil]
      required :rating, Float, nil?: true

      # @!attribute sack_yards
      #   Yards lost to sacks.
      #
      #   @return [Integer, nil]
      required :sack_yards, Integer, api_name: :sackYards, nil?: true

      # @!attribute sacks
      #   Times sacked.
      #
      #   @return [Integer, nil]
      required :sacks, Integer, nil?: true

      # @!attribute touchdowns
      #   Passing touchdowns.
      #
      #   @return [Integer, nil]
      required :touchdowns, Integer, nil?: true

      # @!attribute yards
      #   Passing yards.
      #
      #   @return [Integer, nil]
      required :yards, Integer, nil?: true

      # @!method initialize(attempts:, avg_yards:, completions:, interceptions:, net_yards:, rating:, sack_yards:, sacks:, touchdowns:, yards:)
      #   Passing stats.
      #
      #   @param attempts [Integer, nil] Passes thrown.
      #
      #   @param avg_yards [Float, nil] Yards per pass.
      #
      #   @param completions [Integer, nil] Passes caught.
      #
      #   @param interceptions [Integer, nil] Passes intercepted.
      #
      #   @param net_yards [Integer, nil] Passing yards minus sack yards.
      #
      #   @param rating [Float, nil] The passer rating.
      #
      #   @param sack_yards [Integer, nil] Yards lost to sacks.
      #
      #   @param sacks [Integer, nil] Times sacked.
      #
      #   @param touchdowns [Integer, nil] Passing touchdowns.
      #
      #   @param yards [Integer, nil] Passing yards.
    end
  end
end
