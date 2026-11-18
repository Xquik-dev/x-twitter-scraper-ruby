# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballReturnStats < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute avg_yards
      #   Yards per return.
      #
      #   @return [Float, nil]
      required :avg_yards, Float, api_name: :avgYards, nil?: true

      # @!attribute longest
      #   The longest return, in yards.
      #
      #   @return [Integer, nil]
      required :longest, Integer, nil?: true

      # @!attribute returns
      #   Returns.
      #
      #   @return [Integer, nil]
      required :returns, Integer, nil?: true

      # @!attribute touchdowns
      #   Return touchdowns.
      #
      #   @return [Integer, nil]
      required :touchdowns, Integer, nil?: true

      # @!attribute yards
      #   Return yards.
      #
      #   @return [Integer, nil]
      required :yards, Integer, nil?: true

      # @!method initialize(avg_yards:, longest:, returns:, touchdowns:, yards:)
      #   Kick, punt or interception return stats.
      #
      #   @param avg_yards [Float, nil] Yards per return.
      #
      #   @param longest [Integer, nil] The longest return, in yards.
      #
      #   @param returns [Integer, nil] Returns.
      #
      #   @param touchdowns [Integer, nil] Return touchdowns.
      #
      #   @param yards [Integer, nil] Return yards.
    end
  end
end
