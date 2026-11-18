# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballRushingStats < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute attempts
      #   Rushes.
      #
      #   @return [Integer, nil]
      required :attempts, Integer, nil?: true

      # @!attribute avg_yards
      #   Yards per rush.
      #
      #   @return [Float, nil]
      required :avg_yards, Float, api_name: :avgYards, nil?: true

      # @!attribute longest
      #   The longest rush, in yards.
      #
      #   @return [Integer, nil]
      required :longest, Integer, nil?: true

      # @!attribute touchdowns
      #   Rushing touchdowns.
      #
      #   @return [Integer, nil]
      required :touchdowns, Integer, nil?: true

      # @!attribute yards
      #   Rushing yards.
      #
      #   @return [Integer, nil]
      required :yards, Integer, nil?: true

      # @!method initialize(attempts:, avg_yards:, longest:, touchdowns:, yards:)
      #   Rushing stats.
      #
      #   @param attempts [Integer, nil] Rushes.
      #
      #   @param avg_yards [Float, nil] Yards per rush.
      #
      #   @param longest [Integer, nil] The longest rush, in yards.
      #
      #   @param touchdowns [Integer, nil] Rushing touchdowns.
      #
      #   @param yards [Integer, nil] Rushing yards.
    end
  end
end
