# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballTeamScore < XTwitterScraper::Internal::Type::BaseModel
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

      # @!method initialize(team_id:, points:)
      #   A team's side of a game & its points.
      #
      #   @param team_id [String, nil] The team, a key of teams.
      #
      #   @param points [Integer, nil] The team's points so far.
    end
  end
end
