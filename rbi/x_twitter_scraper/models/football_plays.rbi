# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballPlays < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballPlays,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The ID of the game these plays come from.
      sig { returns(String) }
      attr_accessor :id

      # The league of the game these plays come from.
      sig do
        returns(XTwitterScraper::Models::FootballPlays::League::TaggedSymbol)
      end
      attr_reader :league

      sig do
        params(
          league: XTwitterScraper::Models::FootballPlays::League::OrSymbol
        ).void
      end
      attr_writer :league

      # The home team, a key of teams.
      sig { returns(T.nilable(String)) }
      attr_accessor :home_team_id

      # The away team, a key of teams.
      sig { returns(T.nilable(String)) }
      attr_accessor :away_team_id

      # The game's quarters, in order. Empty before kickoff.
      sig { returns(T::Array[XTwitterScraper::Models::FootballQuarter]) }
      attr_reader :quarters

      sig do
        params(
          quarters: T::Array[XTwitterScraper::Models::FootballQuarter::OrHash]
        ).void
      end
      attr_writer :quarters

      # The teams these plays name, by team ID.
      sig { returns(T::Hash[Symbol, XTwitterScraper::Models::SportsTeam]) }
      attr_reader :teams

      sig do
        params(
          teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam::OrHash]
        ).void
      end
      attr_writer :teams

      # The players these plays name, by player ID.
      sig { returns(T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer]) }
      attr_reader :players

      sig do
        params(
          players:
            T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer::OrHash]
        ).void
      end
      attr_writer :players

      sig do
        params(
          id: String,
          league: XTwitterScraper::Models::FootballPlays::League::OrSymbol,
          home_team_id: T.nilable(String),
          away_team_id: T.nilable(String),
          quarters: T::Array[XTwitterScraper::Models::FootballQuarter::OrHash],
          teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam::OrHash],
          players:
            T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the game these plays come from.
        id:,
        # The league of the game these plays come from.
        league:,
        # The home team, a key of teams.
        home_team_id:,
        # The away team, a key of teams.
        away_team_id:,
        # The game's quarters, in order. Empty before kickoff.
        quarters:,
        # The teams these plays name, by team ID.
        teams:,
        # The players these plays name, by player ID.
        players:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            league:
              XTwitterScraper::Models::FootballPlays::League::TaggedSymbol,
            home_team_id: T.nilable(String),
            away_team_id: T.nilable(String),
            quarters: T::Array[XTwitterScraper::Models::FootballQuarter],
            teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam],
            players: T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer]
          }
        )
      end
      def to_hash
      end

      # The league of the game these plays come from.
      module League
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::FootballPlays::League)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NFL =
          T.let(
            :nfl,
            XTwitterScraper::Models::FootballPlays::League::TaggedSymbol
          )
        NCAAFB =
          T.let(
            :ncaafb,
            XTwitterScraper::Models::FootballPlays::League::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::FootballPlays::League::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
