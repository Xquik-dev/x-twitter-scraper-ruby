# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class FootballScoreboard < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::FootballScoreboard,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The game ID from your request.
      sig { returns(String) }
      attr_accessor :id

      # The league from your request.
      sig do
        returns(
          XTwitterScraper::Models::FootballScoreboard::League::TaggedSymbol
        )
      end
      attr_reader :league

      sig do
        params(
          league: XTwitterScraper::Models::FootballScoreboard::League::OrSymbol
        ).void
      end
      attr_writer :league

      # X's ID for the season. NFL games have one.
      sig { returns(T.nilable(String)) }
      attr_accessor :season_id

      # The part of the season, such as RegularSeason. X stopped sending it with a game
      # on 2026-10-24, so it is null.
      sig { returns(T.nilable(String)) }
      attr_accessor :season_type

      # The week of the season. X stopped sending it with a game on 2026-10-24, so it is
      # null. The games list still has each week.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :week

      # The kickoff time in UTC, or null when X sends none Xquik can read.
      sig { returns(T.nilable(Time)) }
      attr_accessor :starts_at

      # The stadium.
      sig { returns(T.nilable(String)) }
      attr_accessor :venue

      # X's game status, such as Scheduled, InProgress or Closed.
      sig { returns(T.nilable(String)) }
      attr_accessor :status

      # The game clock, as X writes it.
      sig { returns(T.nilable(String)) }
      attr_accessor :clock

      # The current or last quarter.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :quarter

      # Down & distance now, or null before kickoff.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::FootballScoreboard::Situation)
        )
      end
      attr_reader :situation

      sig do
        params(
          situation:
            T.nilable(
              XTwitterScraper::Models::FootballScoreboard::Situation::OrHash
            )
        ).void
      end
      attr_writer :situation

      # A team's side of a scoreboard.
      sig { returns(XTwitterScraper::Models::FootballSide) }
      attr_reader :home

      sig { params(home: XTwitterScraper::Models::FootballSide::OrHash).void }
      attr_writer :home

      # A team's side of a scoreboard.
      sig { returns(XTwitterScraper::Models::FootballSide) }
      attr_reader :away

      sig { params(away: XTwitterScraper::Models::FootballSide::OrHash).void }
      attr_writer :away

      # Points by period, in order.
      sig { returns(T::Array[XTwitterScraper::Models::FootballPeriod]) }
      attr_reader :periods

      sig do
        params(
          periods: T::Array[XTwitterScraper::Models::FootballPeriod::OrHash]
        ).void
      end
      attr_writer :periods

      # The latest play, or null before kickoff. Its steps can list no players for a
      # short while.
      sig { returns(T.nilable(XTwitterScraper::Models::FootballPlay)) }
      attr_reader :last_play

      sig do
        params(
          last_play: T.nilable(XTwitterScraper::Models::FootballPlay::OrHash)
        ).void
      end
      attr_writer :last_play

      # The teams this answer names, by team ID.
      sig { returns(T::Hash[Symbol, XTwitterScraper::Models::SportsTeam]) }
      attr_reader :teams

      sig do
        params(
          teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam::OrHash]
        ).void
      end
      attr_writer :teams

      # The players this answer names, by player ID.
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
          league: XTwitterScraper::Models::FootballScoreboard::League::OrSymbol,
          season_id: T.nilable(String),
          season_type: T.nilable(String),
          week: T.nilable(Integer),
          starts_at: T.nilable(Time),
          venue: T.nilable(String),
          status: T.nilable(String),
          clock: T.nilable(String),
          quarter: T.nilable(Integer),
          situation:
            T.nilable(
              XTwitterScraper::Models::FootballScoreboard::Situation::OrHash
            ),
          home: XTwitterScraper::Models::FootballSide::OrHash,
          away: XTwitterScraper::Models::FootballSide::OrHash,
          periods: T::Array[XTwitterScraper::Models::FootballPeriod::OrHash],
          last_play: T.nilable(XTwitterScraper::Models::FootballPlay::OrHash),
          teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam::OrHash],
          players:
            T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The game ID from your request.
        id:,
        # The league from your request.
        league:,
        # X's ID for the season. NFL games have one.
        season_id:,
        # The part of the season, such as RegularSeason. X stopped sending it with a game
        # on 2026-10-24, so it is null.
        season_type:,
        # The week of the season. X stopped sending it with a game on 2026-10-24, so it is
        # null. The games list still has each week.
        week:,
        # The kickoff time in UTC, or null when X sends none Xquik can read.
        starts_at:,
        # The stadium.
        venue:,
        # X's game status, such as Scheduled, InProgress or Closed.
        status:,
        # The game clock, as X writes it.
        clock:,
        # The current or last quarter.
        quarter:,
        # Down & distance now, or null before kickoff.
        situation:,
        # A team's side of a scoreboard.
        home:,
        # A team's side of a scoreboard.
        away:,
        # Points by period, in order.
        periods:,
        # The latest play, or null before kickoff. Its steps can list no players for a
        # short while.
        last_play:,
        # The teams this answer names, by team ID.
        teams:,
        # The players this answer names, by player ID.
        players:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            league:
              XTwitterScraper::Models::FootballScoreboard::League::TaggedSymbol,
            season_id: T.nilable(String),
            season_type: T.nilable(String),
            week: T.nilable(Integer),
            starts_at: T.nilable(Time),
            venue: T.nilable(String),
            status: T.nilable(String),
            clock: T.nilable(String),
            quarter: T.nilable(Integer),
            situation:
              T.nilable(XTwitterScraper::Models::FootballScoreboard::Situation),
            home: XTwitterScraper::Models::FootballSide,
            away: XTwitterScraper::Models::FootballSide,
            periods: T::Array[XTwitterScraper::Models::FootballPeriod],
            last_play: T.nilable(XTwitterScraper::Models::FootballPlay),
            teams: T::Hash[Symbol, XTwitterScraper::Models::SportsTeam],
            players: T::Hash[Symbol, XTwitterScraper::Models::FootballPlayer]
          }
        )
      end
      def to_hash
      end

      # The league from your request.
      module League
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::FootballScoreboard::League)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NFL =
          T.let(
            :nfl,
            XTwitterScraper::Models::FootballScoreboard::League::TaggedSymbol
          )
        NCAAFB =
          T.let(
            :ncaafb,
            XTwitterScraper::Models::FootballScoreboard::League::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::FootballScoreboard::League::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Situation < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::FootballScoreboard::Situation,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The current down, from 1 to 4.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :down

        # The yards the offense needs now for a first down.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :yards_to_go

        # The ball's current yard line.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :yardline

        # The team whose half the ball is in, a key of teams.
        sig { returns(T.nilable(String)) }
        attr_accessor :yardline_team_id

        # The team with the ball, a key of teams.
        sig { returns(T.nilable(String)) }
        attr_accessor :possession_team_id

        sig do
          params(
            down: T.nilable(Integer),
            yards_to_go: T.nilable(Integer),
            yardline: T.nilable(Integer),
            yardline_team_id: T.nilable(String),
            possession_team_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The current down, from 1 to 4.
          down:,
          # The yards the offense needs now for a first down.
          yards_to_go:,
          # The ball's current yard line.
          yardline:,
          # The team whose half the ball is in, a key of teams.
          yardline_team_id:,
          # The team with the ball, a key of teams.
          possession_team_id:
        )
        end

        sig do
          override.returns(
            {
              down: T.nilable(Integer),
              yards_to_go: T.nilable(Integer),
              yardline: T.nilable(Integer),
              yardline_team_id: T.nilable(String),
              possession_team_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
