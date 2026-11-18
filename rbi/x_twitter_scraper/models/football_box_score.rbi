# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballBoxScore < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballBoxScore,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The ID of the game this box score covers.
      sig { returns(String) }
      attr_accessor :id

      # The league of the game this box score covers.
      sig do
        returns(XTwitterScraper::Models::FootballBoxScore::League::TaggedSymbol)
      end
      attr_reader :league

      sig do
        params(
          league: XTwitterScraper::Models::FootballBoxScore::League::OrSymbol
        ).void
      end
      attr_writer :league

      # 1 team's totals & player stats.
      sig { returns(XTwitterScraper::Models::FootballTeamBox) }
      attr_reader :home

      sig do
        params(home: XTwitterScraper::Models::FootballTeamBox::OrHash).void
      end
      attr_writer :home

      # 1 team's totals & player stats.
      sig { returns(XTwitterScraper::Models::FootballTeamBox) }
      attr_reader :away

      sig do
        params(away: XTwitterScraper::Models::FootballTeamBox::OrHash).void
      end
      attr_writer :away

      # The teams this box score names, by team ID.
      sig { returns(T::Hash[Symbol, XTwitterScraper::Models::SportsTeam]) }
      attr_reader :teams

      sig do
        params(
          teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam::OrHash]
        ).void
      end
      attr_writer :teams

      # The players this box score names, by player ID.
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
          league: XTwitterScraper::Models::FootballBoxScore::League::OrSymbol,
          home: XTwitterScraper::Models::FootballTeamBox::OrHash,
          away: XTwitterScraper::Models::FootballTeamBox::OrHash,
          teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam::OrHash],
          players:
            T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the game this box score covers.
        id:,
        # The league of the game this box score covers.
        league:,
        # 1 team's totals & player stats.
        home:,
        # 1 team's totals & player stats.
        away:,
        # The teams this box score names, by team ID.
        teams:,
        # The players this box score names, by player ID.
        players:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            league:
              XTwitterScraper::Models::FootballBoxScore::League::TaggedSymbol,
            home: XTwitterScraper::Models::FootballTeamBox,
            away: XTwitterScraper::Models::FootballTeamBox,
            teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam],
            players: T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer]
          }
        )
      end
      def to_hash
      end

      # The league of the game this box score covers.
      module League
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::FootballBoxScore::League)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NFL =
          T.let(
            :nfl,
            XTwitterScraper::Models::FootballBoxScore::League::TaggedSymbol
          )
        NCAAFB =
          T.let(
            :ncaafb,
            XTwitterScraper::Models::FootballBoxScore::League::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::FootballBoxScore::League::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
