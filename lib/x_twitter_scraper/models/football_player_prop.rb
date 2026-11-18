# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballPlayerProp < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute player_id
      #   The player the line is for, a key of players.
      #
      #   @return [String, nil]
      required :player_id, String, api_name: :playerId, nil?: true

      # @!attribute rank
      #   The line's place in its category, from 1.
      #
      #   @return [Float, nil]
      required :rank, Float, nil?: true

      # @!attribute line
      #   The line the odds price, such as 248.5 yards. Null when the prop has no line,
      #   such as the first touchdown scorer.
      #
      #   @return [Float, nil]
      required :line, Float, nil?: true

      # @!attribute odds
      #   The American odds X shows first, such as -115 or 240.
      #
      #   @return [Float, nil]
      required :odds, Float, nil?: true

      # @!attribute alternate_odds
      #   The American odds X shows second. Null for a prop with 1 price.
      #
      #   @return [Float, nil]
      required :alternate_odds, Float, api_name: :alternateOdds, nil?: true

      # @!attribute open_for_betting
      #   Whether the sportsbook takes bets on the line.
      #
      #   @return [Boolean, nil]
      required :open_for_betting,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :openForBetting,
               nil?: true

      # @!method initialize(player_id:, rank:, line:, odds:, alternate_odds:, open_for_betting:)
      #   1 player's line & odds in a prop category.
      #
      #   @param player_id [String, nil] The player the line is for, a key of players.
      #
      #   @param rank [Float, nil] The line's place in its category, from 1.
      #
      #   @param line [Float, nil] The line the odds price, such as 248.5 yards. Null when the prop has no line, such as the first touchdown scorer.
      #
      #   @param odds [Float, nil] The American odds X shows first, such as -115 or 240.
      #
      #   @param alternate_odds [Float, nil] The American odds X shows second. Null for a prop with 1 price.
      #
      #   @param open_for_betting [Boolean, nil] Whether the sportsbook takes bets on the line.
    end
  end
end
