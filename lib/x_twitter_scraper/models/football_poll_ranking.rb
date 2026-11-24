# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballPollRanking < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute team_id
      #   The ranked team, a key of teams.
      #
      #   @return [String, nil]
      required :team_id, String, api_name: :teamId, nil?: true

      # @!attribute rank
      #   The team's rank, where 1 is the top.
      #
      #   @return [Integer, nil]
      required :rank, Integer, nil?: true

      # @!method initialize(team_id:, rank:)
      #   A team's rank in X's college football poll.
      #
      #   @param team_id [String, nil] The ranked team, a key of teams.
      #
      #   @param rank [Integer, nil] The team's rank, where 1 is the top.
    end
  end
end
