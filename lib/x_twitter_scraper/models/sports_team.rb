# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class SportsTeam < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The team ID that games & players refer to.
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   The team's full name.
      #
      #   @return [String, nil]
      required :name, String, nil?: true

      # @!attribute short_name
      #   The team's short name.
      #
      #   @return [String, nil]
      required :short_name, String, api_name: :shortName, nil?: true

      # @!attribute abbreviation
      #   The team's abbreviation.
      #
      #   @return [String, nil]
      required :abbreviation, String, nil?: true

      # @!attribute alternate_id
      #   Another ID X keeps for the team.
      #
      #   @return [String, nil]
      required :alternate_id, String, api_name: :alternateId, nil?: true

      # @!attribute location
      #   The school or place the team plays for. X sends it in college football schedules
      #   & in a game's audience.
      #
      #   @return [String, nil]
      required :location, String, nil?: true

      # @!attribute colors
      #   The team's colors, as red, green & blue from 0 to 255.
      #
      #   @return [Array<XTwitterScraper::Models::SportsTeam::Color>]
      required :colors, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SportsTeam::Color] }

      # @!attribute logos
      #   The team's logo images.
      #
      #   @return [XTwitterScraper::Models::SportsTeam::Logos]
      required :logos, -> { XTwitterScraper::Models::SportsTeam::Logos }

      # @!attribute x_user_id
      #   The user ID of the team's X account.
      #
      #   @return [String, nil]
      required :x_user_id, String, api_name: :xUserId, nil?: true

      # @!attribute record
      #   The team's wins, losses & ties this season. X sends it only in college football
      #   games.
      #
      #   @return [XTwitterScraper::Models::SportsTeam::Record, nil]
      required :record, -> { XTwitterScraper::Models::SportsTeam::Record }, nil?: true

      # @!attribute recent_games
      #   The team's recent games, newest first. Games without a kickoff time come last. X
      #   sends them only with the teams of a college football game. The list is empty
      #   elsewhere.
      #
      #   @return [Array<XTwitterScraper::Models::SportsTeamGame>]
      required :recent_games, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SportsTeamGame] }, api_name: :recentGames

      # @!method initialize(id:, name:, short_name:, abbreviation:, alternate_id:, location:, colors:, logos:, x_user_id:, record:, recent_games:)
      #   A team, as X's sports pages show it.
      #
      #   @param id [String] The team ID that games & players refer to.
      #
      #   @param name [String, nil] The team's full name.
      #
      #   @param short_name [String, nil] The team's short name.
      #
      #   @param abbreviation [String, nil] The team's abbreviation.
      #
      #   @param alternate_id [String, nil] Another ID X keeps for the team.
      #
      #   @param location [String, nil] The school or place the team plays for. X sends it in college football schedules & in a game's audience.
      #
      #   @param colors [Array<XTwitterScraper::Models::SportsTeam::Color>] The team's colors, as red, green & blue from 0 to 255.
      #
      #   @param logos [XTwitterScraper::Models::SportsTeam::Logos] The team's logo images.
      #
      #   @param x_user_id [String, nil] The user ID of the team's X account.
      #
      #   @param record [XTwitterScraper::Models::SportsTeam::Record, nil] The team's wins, losses & ties this season. X sends it only in college football games.
      #
      #   @param recent_games [Array<XTwitterScraper::Models::SportsTeamGame>] The team's recent games, newest first. Games without a kickoff time come last. X sends them only with the teams of a college football game. The list is empty elsewhere.

      class Color < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute r
        #   Red, from 0 to 255.
        #
        #   @return [Integer, nil]
        required :r, Integer, nil?: true

        # @!attribute g
        #   Green, from 0 to 255.
        #
        #   @return [Integer, nil]
        required :g, Integer, nil?: true

        # @!attribute b
        #   Blue, from 0 to 255.
        #
        #   @return [Integer, nil]
        required :b, Integer, nil?: true

        # @!method initialize(r:, g:, b:)
        #   @param r [Integer, nil] Red, from 0 to 255.
        #
        #   @param g [Integer, nil] Green, from 0 to 255.
        #
        #   @param b [Integer, nil] Blue, from 0 to 255.
      end

      class Logos < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute default
        #   The logo X shows by default.
        #
        #   @return [String, nil]
        required :default, String, nil?: true

        # @!attribute light
        #   The logo for light backgrounds.
        #
        #   @return [String, nil]
        required :light, String, nil?: true

        # @!attribute dark
        #   The logo for dark backgrounds.
        #
        #   @return [String, nil]
        required :dark, String, nil?: true

        # @!method initialize(default:, light:, dark:)
        #   The team's logo images.
        #
        #   @param default [String, nil] The logo X shows by default.
        #
        #   @param light [String, nil] The logo for light backgrounds.
        #
        #   @param dark [String, nil] The logo for dark backgrounds.
      end

      class Record < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute wins
        #   Games the team won this season.
        #
        #   @return [Integer, nil]
        required :wins, Integer, nil?: true

        # @!attribute losses
        #   Games the team lost this season.
        #
        #   @return [Integer, nil]
        required :losses, Integer, nil?: true

        # @!attribute ties
        #   Games the team tied this season.
        #
        #   @return [Integer, nil]
        required :ties, Integer, nil?: true

        # @!method initialize(wins:, losses:, ties:)
        #   The team's wins, losses & ties this season. X sends it only in college football
        #   games.
        #
        #   @param wins [Integer, nil] Games the team won this season.
        #
        #   @param losses [Integer, nil] Games the team lost this season.
        #
        #   @param ties [Integer, nil] Games the team tied this season.
      end
    end
  end
end
