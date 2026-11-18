# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class SportsGameAudience < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   The ID of the game, from your request.
      #
      #   @return [String]
      required :id, String

      # @!attribute league
      #   The game's league, from your request.
      #
      #   @return [Symbol, XTwitterScraper::Models::SportsGameAudience::League]
      required :league, enum: -> { XTwitterScraper::Models::SportsGameAudience::League }

      # @!attribute viewers
      #   People watching the game on X at X's last count. Null before X counts any, as
      #   before kickoff.
      #
      #   @return [XTwitterScraper::Models::SportsGameAudience::Viewers, nil]
      required :viewers, -> { XTwitterScraper::Models::SportsGameAudience::Viewers }, nil?: true

      # @!attribute team_picks
      #   How many people on X picked a team to root for.
      #
      #   @return [XTwitterScraper::Models::SportsGameAudience::TeamPicks]
      required :team_picks, -> { XTwitterScraper::Models::SportsGameAudience::TeamPicks }, api_name: :teamPicks

      # @!attribute chat
      #   The game's live chat on X.
      #
      #   @return [XTwitterScraper::Models::SportsGameAudience::Chat]
      required :chat, -> { XTwitterScraper::Models::SportsGameAudience::Chat }

      # @!attribute teams
      #   The game's teams, by team ID. Short name, alternate ID, X account & record are
      #   null here.
      #
      #   @return [Hash{Symbol=>XTwitterScraper::Models::SportsTeam}]
      required :teams, -> { XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Models::SportsTeam] }

      # @!method initialize(id:, league:, viewers:, team_picks:, chat:, teams:)
      #   Who watches & roots for 1 game on X.
      #
      #   @param id [String] The ID of the game, from your request.
      #
      #   @param league [Symbol, XTwitterScraper::Models::SportsGameAudience::League] The game's league, from your request.
      #
      #   @param viewers [XTwitterScraper::Models::SportsGameAudience::Viewers, nil] People watching the game on X at X's last count. Null before X counts any, as before kickoff.
      #
      #   @param team_picks [XTwitterScraper::Models::SportsGameAudience::TeamPicks] How many people on X picked a team to root for.
      #
      #   @param chat [XTwitterScraper::Models::SportsGameAudience::Chat] The game's live chat on X.
      #
      #   @param teams [Hash{Symbol=>XTwitterScraper::Models::SportsTeam}] The game's teams, by team ID. Short name, alternate ID, X account & record are null here.

      # The game's league, from your request.
      module League
        extend XTwitterScraper::Internal::Type::Enum

        NFL = :nfl
        NCAAFB = :ncaafb

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Viewers < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute count
        #   How many people watched the game on X.
        #
        #   @return [Integer]
        required :count, Integer

        # @!attribute as_of
        #   When X counted them.
        #
        #   @return [Time]
        required :as_of, Time, api_name: :asOf

        # @!method initialize(count:, as_of:)
        #   People watching the game on X at X's last count. Null before X counts any, as
        #   before kickoff.
        #
        #   @param count [Integer] How many people watched the game on X.
        #
        #   @param as_of [Time] When X counted them.
      end

      class TeamPicks < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute total
        #   Picks for every team in the game.
        #
        #   @return [Integer, nil]
        required :total, Integer, nil?: true

        # @!attribute teams
        #   Picks per team.
        #
        #   @return [Array<XTwitterScraper::Models::SportsGameAudience::TeamPicks::Team>]
        required :teams, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SportsGameAudience::TeamPicks::Team] }

        # @!method initialize(total:, teams:)
        #   How many people on X picked a team to root for.
        #
        #   @param total [Integer, nil] Picks for every team in the game.
        #
        #   @param teams [Array<XTwitterScraper::Models::SportsGameAudience::TeamPicks::Team>] Picks per team.

        class Team < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute team_id
          #   The team ID, a key in teams.
          #
          #   @return [String]
          required :team_id, String, api_name: :teamId

          # @!attribute count
          #   How many people picked this team.
          #
          #   @return [Integer, nil]
          required :count, Integer, nil?: true

          # @!method initialize(team_id:, count:)
          #   @param team_id [String] The team ID, a key in teams.
          #
          #   @param count [Integer, nil] How many people picked this team.
        end
      end

      class Chat < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute available
        #   Whether the chat is open now.
        #
        #   @return [Boolean, nil]
        required :available, XTwitterScraper::Internal::Type::Boolean, nil?: true

        # @!attribute broadcast_id
        #   X's ID for the game's chat room.
        #
        #   @return [String, nil]
        required :broadcast_id, String, api_name: :broadcastId, nil?: true

        # @!attribute opens_in
        #   Time left until the chat opens. Null while it is open & after the game.
        #
        #   @return [XTwitterScraper::Models::SportsGameAudience::Chat::OpensIn, nil]
        required :opens_in, -> { XTwitterScraper::Models::SportsGameAudience::Chat::OpensIn }, api_name: :opensIn, nil?: true

        # @!method initialize(available:, broadcast_id:, opens_in:)
        #   The game's live chat on X.
        #
        #   @param available [Boolean, nil] Whether the chat is open now.
        #
        #   @param broadcast_id [String, nil] X's ID for the game's chat room.
        #
        #   @param opens_in [XTwitterScraper::Models::SportsGameAudience::Chat::OpensIn, nil] Time left until the chat opens. Null while it is open & after the game.

        class OpensIn < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute days
          #   Whole days left.
          #
          #   @return [Integer, nil]
          required :days, Integer, nil?: true

          # @!attribute hours
          #   Hours left after the days.
          #
          #   @return [Integer, nil]
          required :hours, Integer, nil?: true

          # @!attribute minutes
          #   Minutes left after the hours.
          #
          #   @return [Integer, nil]
          required :minutes, Integer, nil?: true

          # @!method initialize(days:, hours:, minutes:)
          #   Time left until the chat opens. Null while it is open & after the game.
          #
          #   @param days [Integer, nil] Whole days left.
          #
          #   @param hours [Integer, nil] Hours left after the days.
          #
          #   @param minutes [Integer, nil] Minutes left after the hours.
        end
      end
    end
  end
end
