# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballProps < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The ID of the game these props cover.
      #
      #   @return [String]
      required :id, String

      # @!attribute league
      #   The league of the game these props cover.
      #
      #   @return [Symbol, XTwitterScraper::Models::FootballProps::League]
      required :league, enum: -> { XTwitterScraper::Models::FootballProps::League }

      # @!attribute sportsbook_url
      #   The sportsbook page X links for these props.
      #
      #   @return [String, nil]
      required :sportsbook_url, String, api_name: :sportsbookUrl, nil?: true

      # @!attribute categories
      #   Each kind of prop, such as passing yards, in X's order. A game without props has
      #   none.
      #
      #   @return [Array<XTwitterScraper::Models::FootballPropCategory>]
      required :categories, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::FootballPropCategory] }

      # @!attribute players
      #   The players these props name, by player ID. X sends only each player's name,
      #   jersey & team, so other fields are null.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::FootballPlayer}]
      required :players, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Models::FootballPlayer] }

      # @!method initialize(id:, league:, sportsbook_url:, categories:, players:)
      #   The player props X shows for 1 NFL game.
      #
      #   @param id [String] The ID of the game these props cover.
      #
      #   @param league [Symbol, XTwitterScraper::Models::FootballProps::League] The league of the game these props cover.
      #
      #   @param sportsbook_url [String, nil] The sportsbook page X links for these props.
      #
      #   @param categories [Array<XTwitterScraper::Models::FootballPropCategory>] Each kind of prop, such as passing yards, in X's order. A game without props has none.
      #
      #   @param players [Hash{Symbol=>XTwitterScraper::Models::FootballPlayer}] The players these props name, by player ID. X sends only each player's name, jersey & team, so other fields are null.

      # The league of the game these props cover.
      module League
        extend XTwitterScraper::Internal::Type::Enum

        NFL = :nfl

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
