# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballSide < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute team_id
      #   The team, a key of teams.
      #
      #   @return [String, nil]
      required :team_id, String, api_name: :teamId, nil?: true

      # @!attribute points
      #   The team's points so far.
      #
      #   @return [Integer, nil]
      required :points, Integer, nil?: true

      # @!attribute timeouts_left
      #   The timeouts the team has left.
      #
      #   @return [Integer, nil]
      required :timeouts_left, Integer, api_name: :timeoutsLeft, nil?: true

      # @!method initialize(team_id:, points:, timeouts_left:)
      #   A team's side of a scoreboard.
      #
      #   @param team_id [String, nil] The team, a key of teams.
      #
      #   @param points [Integer, nil] The team's points so far.
      #
      #   @param timeouts_left [Integer, nil] The timeouts the team has left.
    end
  end
end
