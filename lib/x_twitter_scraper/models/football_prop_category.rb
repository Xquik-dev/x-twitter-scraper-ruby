# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballPropCategory < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute key
      #   X's key for the prop, such as passing_yards.
      #
      #   @return [String, nil]
      required :key, String, nil?: true

      # @!attribute name
      #   The name X shows for the prop.
      #
      #   @return [String, nil]
      required :name, String, nil?: true

      # @!attribute rank
      #   The category's place in X's order, from 1.
      #
      #   @return [Float, nil]
      required :rank, Float, nil?: true

      # @!attribute props
      #   Each player's line, in X's order.
      #
      #   @return [Array<XTwitterScraper::Models::FootballPlayerProp>]
      required :props, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FootballPlayerProp] }

      # @!method initialize(key:, name:, rank:, props:)
      #   1 kind of player prop & its lines.
      #
      #   @param key [String, nil] X's key for the prop, such as passing_yards.
      #
      #   @param name [String, nil] The name X shows for the prop.
      #
      #   @param rank [Float, nil] The category's place in X's order, from 1.
      #
      #   @param props [Array<XTwitterScraper::Models::FootballPlayerProp>] Each player's line, in X's order.
    end
  end
end
