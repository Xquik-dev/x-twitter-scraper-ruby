# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballPlayDetail < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute sequence
      #   The step's place in the play, from 1.
      #
      #   @return [Integer, nil]
      required :sequence, Integer, nil?: true

      # @!attribute category
      #   X's kind of step, such as Pass, Tackle or Penalty.
      #
      #   @return [String, nil]
      required :category, String, nil?: true

      # @!attribute description
      #   What happened in the step.
      #
      #   @return [String, nil]
      required :description, String, nil?: true

      # @!attribute direction
      #   The direction X gives for the step.
      #
      #   @return [String, nil]
      required :direction, String, nil?: true

      # @!attribute yards
      #   The yards the step gained or lost.
      #
      #   @return [Integer, nil]
      required :yards, Integer, nil?: true

      # @!attribute players
      #   The players in the step & their roles.
      #
      #   @return [Array<XTwitterScraper::Models::FootballPlayDetail::Player>]
      required :players, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FootballPlayDetail::Player] }

      # @!attribute penalty
      #   The penalty this step called, or null.
      #
      #   @return [XTwitterScraper::Models::FootballPlayDetail::Penalty, nil]
      required :penalty, -> { XTwitterScraper::Models::FootballPlayDetail::Penalty }, nil?: true

      # @!method initialize(sequence:, category:, description:, direction:, yards:, players:, penalty:)
      #   1 step of a play, such as a pass, a tackle or a penalty.
      #
      #   @param sequence [Integer, nil] The step's place in the play, from 1.
      #
      #   @param category [String, nil] X's kind of step, such as Pass, Tackle or Penalty.
      #
      #   @param description [String, nil] What happened in the step.
      #
      #   @param direction [String, nil] The direction X gives for the step.
      #
      #   @param yards [Integer, nil] The yards the step gained or lost.
      #
      #   @param players [Array<XTwitterScraper::Models::FootballPlayDetail::Player>] The players in the step & their roles.
      #
      #   @param penalty [XTwitterScraper::Models::FootballPlayDetail::Penalty, nil] The penalty this step called, or null.

      class Player < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute player_id
        #   The player, a key of players.
        #
        #   @return [String, nil]
        required :player_id, String, api_name: :playerId, nil?: true

        # @!attribute player_role
        #   The player's role, such as Pass, Receive or Tackle.
        #
        #   @return [String, nil]
        required :player_role, String, api_name: :playerRole, nil?: true

        # @!method initialize(player_id:, player_role:)
        #   @param player_id [String, nil] The player, a key of players.
        #
        #   @param player_role [String, nil] The player's role, such as Pass, Receive or Tackle.
      end

      class Penalty < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute description
        #   The penalty's name.
        #
        #   @return [String, nil]
        required :description, String, nil?: true

        # @!attribute next_down
        #   What the penalty does to the down.
        #
        #   @return [String, nil]
        required :next_down, String, api_name: :nextDown, nil?: true

        # @!attribute result
        #   Whether the penalty was accepted or declined.
        #
        #   @return [String, nil]
        required :result, String, nil?: true

        # @!attribute team_id
        #   The penalized team, a key of teams.
        #
        #   @return [String, nil]
        required :team_id, String, api_name: :teamId, nil?: true

        # @!attribute yards
        #   The penalty's yards.
        #
        #   @return [Integer, nil]
        required :yards, Integer, nil?: true

        # @!method initialize(description:, next_down:, result:, team_id:, yards:)
        #   The penalty this step called, or null.
        #
        #   @param description [String, nil] The penalty's name.
        #
        #   @param next_down [String, nil] What the penalty does to the down.
        #
        #   @param result [String, nil] Whether the penalty was accepted or declined.
        #
        #   @param team_id [String, nil] The penalized team, a key of teams.
        #
        #   @param yards [Integer, nil] The penalty's yards.
      end
    end
  end
end
