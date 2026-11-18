# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballFumbleStats < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute lost
      #   Fumbles the other team recovered.
      #
      #   @return [Integer, nil]
      required :lost, Integer, nil?: true

      # @!attribute opponent_recovery_touchdowns
      #   Touchdowns scored after recovering the other team's fumble.
      #
      #   @return [Integer, nil]
      required :opponent_recovery_touchdowns, Integer, api_name: :opponentRecoveryTouchdowns, nil?: true

      # @!attribute own_recovery_touchdowns
      #   Touchdowns scored after recovering an own fumble.
      #
      #   @return [Integer, nil]
      required :own_recovery_touchdowns, Integer, api_name: :ownRecoveryTouchdowns, nil?: true

      # @!method initialize(lost:, opponent_recovery_touchdowns:, own_recovery_touchdowns:)
      #   Fumble stats.
      #
      #   @param lost [Integer, nil] Fumbles the other team recovered.
      #
      #   @param opponent_recovery_touchdowns [Integer, nil] Touchdowns scored after recovering the other team's fumble.
      #
      #   @param own_recovery_touchdowns [Integer, nil] Touchdowns scored after recovering an own fumble.
    end
  end
end
