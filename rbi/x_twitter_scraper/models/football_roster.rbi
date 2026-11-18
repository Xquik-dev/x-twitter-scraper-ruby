# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballRoster < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballRoster,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The ID of the game these rosters cover.
      sig { returns(String) }
      attr_accessor :id

      # The league of the game these rosters cover.
      sig do
        returns(XTwitterScraper::Models::FootballRoster::League::TaggedSymbol)
      end
      attr_reader :league

      sig do
        params(
          league: XTwitterScraper::Models::FootballRoster::League::OrSymbol
        ).void
      end
      attr_writer :league

      # Each team's roster, in X's order.
      sig { returns(T::Array[XTwitterScraper::Models::FootballRosterTeam]) }
      attr_reader :rosters

      sig do
        params(
          rosters: T::Array[XTwitterScraper::Models::FootballRosterTeam::OrHash]
        ).void
      end
      attr_writer :rosters

      # The 2 teams, by team ID.
      sig { returns(T::Hash[Symbol, XTwitterScraper::Models::SportsTeam]) }
      attr_reader :teams

      sig do
        params(
          teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam::OrHash]
        ).void
      end
      attr_writer :teams

      # Every rostered player, by player ID. Rosters carry no college or birth details &
      # only a medium headshot, so the rest are null.
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
          league: XTwitterScraper::Models::FootballRoster::League::OrSymbol,
          rosters:
            T::Array[XTwitterScraper::Models::FootballRosterTeam::OrHash],
          teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam::OrHash],
          players:
            T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the game these rosters cover.
        id:,
        # The league of the game these rosters cover.
        league:,
        # Each team's roster, in X's order.
        rosters:,
        # The 2 teams, by team ID.
        teams:,
        # Every rostered player, by player ID. Rosters carry no college or birth details &
        # only a medium headshot, so the rest are null.
        players:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            league:
              XTwitterScraper::Models::FootballRoster::League::TaggedSymbol,
            rosters: T::Array[XTwitterScraper::Models::FootballRosterTeam],
            teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam],
            players: T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer]
          }
        )
      end
      def to_hash
      end

      # The league of the game these rosters cover.
      module League
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::FootballRoster::League)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NFL =
          T.let(
            :nfl,
            XTwitterScraper::Models::FootballRoster::League::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::FootballRoster::League::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
