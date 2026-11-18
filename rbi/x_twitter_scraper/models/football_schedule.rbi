# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballSchedule < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballSchedule,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The league whose games this list holds.
      sig do
        returns(XTwitterScraper::Models::FootballSchedule::League::TaggedSymbol)
      end
      attr_reader :league

      sig do
        params(
          league: XTwitterScraper::Models::FootballSchedule::League::OrSymbol
        ).void
      end
      attr_writer :league

      # The games, earliest first.
      sig { returns(T::Array[XTwitterScraper::Models::FootballScheduleGame]) }
      attr_reader :games

      sig do
        params(
          games: T::Array[XTwitterScraper::Models::FootballScheduleGame::OrHash]
        ).void
      end
      attr_writer :games

      # The teams the games name, by team ID.
      sig { returns(T::Hash[Symbol, XTwitterScraper::Models::SportsTeam]) }
      attr_reader :teams

      sig do
        params(
          teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam::OrHash]
        ).void
      end
      attr_writer :teams

      sig do
        params(
          league: XTwitterScraper::Models::FootballSchedule::League::OrSymbol,
          games:
            T::Array[XTwitterScraper::Models::FootballScheduleGame::OrHash],
          teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The league whose games this list holds.
        league:,
        # The games, earliest first.
        games:,
        # The teams the games name, by team ID.
        teams:
      )
      end

      sig do
        override.returns(
          {
            league:
              XTwitterScraper::Models::FootballSchedule::League::TaggedSymbol,
            games: T::Array[XTwitterScraper::Models::FootballScheduleGame],
            teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam]
          }
        )
      end
      def to_hash
      end

      # The league whose games this list holds.
      module League
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::FootballSchedule::League)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NFL =
          T.let(
            :nfl,
            XTwitterScraper::Models::FootballSchedule::League::TaggedSymbol
          )
        NCAAFB =
          T.let(
            :ncaafb,
            XTwitterScraper::Models::FootballSchedule::League::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::FootballSchedule::League::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
