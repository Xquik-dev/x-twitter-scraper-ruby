# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class FootballPlayer < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The player ID that plays & stats refer to.
      #
      #   @return [String]
      required :id, String

      # @!attribute team_id
      #   The player's team, a key of teams.
      #
      #   @return [String, nil]
      required :team_id, String, api_name: :teamId, nil?: true

      # @!attribute name
      #   The player's full name.
      #
      #   @return [String, nil]
      required :name, String, nil?: true

      # @!attribute short_name
      #   The name play descriptions use.
      #
      #   @return [String, nil]
      required :short_name, String, api_name: :shortName, nil?: true

      # @!attribute jersey
      #   The jersey number, as text.
      #
      #   @return [String, nil]
      required :jersey, String, nil?: true

      # @!attribute position
      #   The position abbreviation, such as QB or DE.
      #
      #   @return [String, nil]
      required :position, String, nil?: true

      # @!attribute college
      #   The college the player came from.
      #
      #   @return [String, nil]
      required :college, String, nil?: true

      # @!attribute birth_place
      #   Where the player was born. X sends it only for NFL players.
      #
      #   @return [String, nil]
      required :birth_place, String, api_name: :birthPlace, nil?: true

      # @!attribute birth_date
      #   The birth date, as YYYY-MM-DD.
      #
      #   @return [String, nil]
      required :birth_date, String, api_name: :birthDate, nil?: true

      # @!attribute headshots
      #   Photos of the player. Any of them can be null.
      #
      #   @return [XTwitterScraper::Models::FootballPlayer::Headshots]
      required :headshots, -> { XTwitterScraper::Models::FootballPlayer::Headshots }

      # @!attribute x_user
      #   The player's X account, or null without one.
      #
      #   @return [XTwitterScraper::Models::FootballPlayer::XUser, nil]
      required :x_user, -> { XTwitterScraper::Models::FootballPlayer::XUser }, api_name: :xUser, nil?: true

      # @!method initialize(id:, team_id:, name:, short_name:, jersey:, position:, college:, birth_place:, birth_date:, headshots:, x_user:)
      #   A football player, as X's sports pages show them.
      #
      #   @param id [String] The player ID that plays & stats refer to.
      #
      #   @param team_id [String, nil] The player's team, a key of teams.
      #
      #   @param name [String, nil] The player's full name.
      #
      #   @param short_name [String, nil] The name play descriptions use.
      #
      #   @param jersey [String, nil] The jersey number, as text.
      #
      #   @param position [String, nil] The position abbreviation, such as QB or DE.
      #
      #   @param college [String, nil] The college the player came from.
      #
      #   @param birth_place [String, nil] Where the player was born. X sends it only for NFL players.
      #
      #   @param birth_date [String, nil] The birth date, as YYYY-MM-DD.
      #
      #   @param headshots [XTwitterScraper::Models::FootballPlayer::Headshots] Photos of the player. Any of them can be null.
      #
      #   @param x_user [XTwitterScraper::Models::FootballPlayer::XUser, nil] The player's X account, or null without one.

      class Headshots < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute original
        #   The photo X shows on the player's card.
        #
        #   @return [String, nil]
        required :original, String, nil?: true

        # @!attribute large
        #   The large photo.
        #
        #   @return [String, nil]
        required :large, String, nil?: true

        # @!attribute medium
        #   The medium photo.
        #
        #   @return [String, nil]
        required :medium, String, nil?: true

        # @!attribute small
        #   The small photo.
        #
        #   @return [String, nil]
        required :small, String, nil?: true

        # @!method initialize(original:, large:, medium:, small:)
        #   Photos of the player. Any of them can be null.
        #
        #   @param original [String, nil] The photo X shows on the player's card.
        #
        #   @param large [String, nil] The large photo.
        #
        #   @param medium [String, nil] The medium photo.
        #
        #   @param small [String, nil] The small photo.
      end

      class XUser < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #   The account's user ID.
        #
        #   @return [String]
        required :id, String

        # @!attribute username
        #   The account's username, without @.
        #
        #   @return [String, nil]
        required :username, String, nil?: true

        # @!attribute blue_verified
        #   Whether the account has a blue check.
        #
        #   @return [Boolean, nil]
        required :blue_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :blueVerified, nil?: true

        # @!attribute protected
        #   Whether the account protects its posts. Only rosters carry it.
        #
        #   @return [Boolean, nil]
        required :protected, XTwitterScraper::Internal::Type::Boolean, nil?: true

        # @!attribute super_follow_eligible
        #   Whether the account can offer subscriptions. Only rosters carry it.
        #
        #   @return [Boolean, nil]
        required :super_follow_eligible,
                 XTwitterScraper::Internal::Type::Boolean,
                 api_name: :superFollowEligible,
                 nil?: true

        # @!attribute label_type
        #   The label X highlights on the account, such as BusinessLabel. Only rosters carry
        #   it.
        #
        #   @return [String, nil]
        required :label_type, String, api_name: :labelType, nil?: true

        # @!method initialize(id:, username:, blue_verified:, protected:, super_follow_eligible:, label_type:)
        #   The player's X account, or null without one.
        #
        #   @param id [String] The account's user ID.
        #
        #   @param username [String, nil] The account's username, without @.
        #
        #   @param blue_verified [Boolean, nil] Whether the account has a blue check.
        #
        #   @param protected [Boolean, nil] Whether the account protects its posts. Only rosters carry it.
        #
        #   @param super_follow_eligible [Boolean, nil] Whether the account can offer subscriptions. Only rosters carry it.
        #
        #   @param label_type [String, nil] The label X highlights on the account, such as BusinessLabel. Only rosters carry it.
      end
    end
  end
end
