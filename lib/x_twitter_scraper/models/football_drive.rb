# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballDrive < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   X's ID for the drive within the game.
      #
      #   @return [String, nil]
      required :id, String, nil?: true

      # @!attribute sequence
      #   The drive's place in the game, from 1.
      #
      #   @return [Integer, nil]
      required :sequence, Integer, nil?: true

      # @!attribute offense
      #   The team that drove. Home or Away in NFL games, the team's alternateId in
      #   college games.
      #
      #   @return [String, nil]
      required :offense, String, nil?: true

      # @!attribute defense
      #   The team on defense. X stopped sending it on 2026-10-24, so it is null.
      #
      #   @return [String, nil]
      required :defense, String, nil?: true

      # @!attribute start_clock
      #   The game clock when the drive started, as HH:MM:SS.
      #
      #   @return [String, nil]
      required :start_clock, String, api_name: :startClock, nil?: true

      # @!attribute end_clock
      #   The game clock when the drive ended, as HH:MM:SS.
      #
      #   @return [String, nil]
      required :end_clock, String, api_name: :endClock, nil?: true

      # @!attribute start_reason
      #   How the drive started, such as Kickoff or Punt. X stopped sending it on
      #   2026-10-24, so it is null.
      #
      #   @return [String, nil]
      required :start_reason, String, api_name: :startReason, nil?: true

      # @!attribute end_reason
      #   How the drive ended, such as Touchdown or Punt.
      #
      #   @return [String, nil]
      required :end_reason, String, api_name: :endReason, nil?: true

      # @!attribute play_count
      #   The drive's plays.
      #
      #   @return [Integer, nil]
      required :play_count, Integer, api_name: :playCount, nil?: true

      # @!attribute first_downs
      #   The first downs the drive gained. X stopped sending it on 2026-10-24, so it is
      #   null.
      #
      #   @return [Integer, nil]
      required :first_downs, Integer, api_name: :firstDowns, nil?: true

      # @!attribute net_yards
      #   The yards the drive gained.
      #
      #   @return [Integer, nil]
      required :net_yards, Integer, api_name: :netYards, nil?: true

      # @!attribute scoring
      #   Whether the drive scored. X stopped sending it on 2026-10-24, so it is null.
      #   Each play still says whether it scored.
      #
      #   @return [Boolean, nil]
      required :scoring, XTwitterScraper::Internal::Type::Boolean, nil?: true

      # @!attribute plays
      #   The drive's plays, in order.
      #
      #   @return [Array<XTwitterScraper::Models::FootballPlay>]
      required :plays, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FootballPlay] }

      # @!method initialize(id:, sequence:, offense:, defense:, start_clock:, end_clock:, start_reason:, end_reason:, play_count:, first_downs:, net_yards:, scoring:, plays:)
      #   A drive, with its result & plays.
      #
      #   @param id [String, nil] X's ID for the drive within the game.
      #
      #   @param sequence [Integer, nil] The drive's place in the game, from 1.
      #
      #   @param offense [String, nil] The team that drove. Home or Away in NFL games, the team's alternateId in college games.
      #
      #   @param defense [String, nil] The team on defense. X stopped sending it on 2026-10-24, so it is null.
      #
      #   @param start_clock [String, nil] The game clock when the drive started, as HH:MM:SS.
      #
      #   @param end_clock [String, nil] The game clock when the drive ended, as HH:MM:SS.
      #
      #   @param start_reason [String, nil] How the drive started, such as Kickoff or Punt. X stopped sending it on 2026-10-24, so it is null.
      #
      #   @param end_reason [String, nil] How the drive ended, such as Touchdown or Punt.
      #
      #   @param play_count [Integer, nil] The drive's plays.
      #
      #   @param first_downs [Integer, nil] The first downs the drive gained. X stopped sending it on 2026-10-24, so it is null.
      #
      #   @param net_yards [Integer, nil] The yards the drive gained.
      #
      #   @param scoring [Boolean, nil] Whether the drive scored. X stopped sending it on 2026-10-24, so it is null. Each play still says whether it scored.
      #
      #   @param plays [Array<XTwitterScraper::Models::FootballPlay>] The drive's plays, in order.
    end
  end
end
