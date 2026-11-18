# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballPeriod < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute type
      #   X's name for the period, such as Quarter.
      #
      #   @return [String, nil]
      required :type, String, nil?: true

      # @!attribute number
      #   The period's number, or null when X sends no digits.
      #
      #   @return [Integer, nil]
      required :number, Integer, nil?: true

      # @!attribute sequence
      #   The period's place in the game, from 1.
      #
      #   @return [Integer, nil]
      required :sequence, Integer, nil?: true

      # @!attribute home_points
      #   The home team's points in the period.
      #
      #   @return [Integer, nil]
      required :home_points, Integer, api_name: :homePoints, nil?: true

      # @!attribute away_points
      #   The away team's points in the period.
      #
      #   @return [Integer, nil]
      required :away_points, Integer, api_name: :awayPoints, nil?: true

      # @!method initialize(type:, number:, sequence:, home_points:, away_points:)
      #   A period of a game & its points.
      #
      #   @param type [String, nil] X's name for the period, such as Quarter.
      #
      #   @param number [Integer, nil] The period's number, or null when X sends no digits.
      #
      #   @param sequence [Integer, nil] The period's place in the game, from 1.
      #
      #   @param home_points [Integer, nil] The home team's points in the period.
      #
      #   @param away_points [Integer, nil] The away team's points in the period.
    end
  end
end
